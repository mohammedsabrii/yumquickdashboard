import { createClient } from 'npm:@supabase/supabase-js@2'
import { JWT } from 'npm:google-auth-library@9'
import serviceAccount from '../service_account.json' with { type: 'json' }

interface NotificationPayload {
  user_id: string
  title: string
  body: string
  image_url?: string
  screen?: string
  product_id?: string
}

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
)

Deno.serve(async (req) => {
  const body: NotificationPayload = await req.json()
  console.log('📦 Payload:', body)

  const { data: profile, error: profileError } = await supabase
    .from('profiles')
    .select('fcm_token')
    .eq('id', body.user_id)
    .single()

  if (profileError || !profile?.fcm_token) {
    console.error('❌ Error fetching FCM token:', profileError)
    return new Response(JSON.stringify({ error: 'User FCM token not found' }), {
      status: 400,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const fcmToken = profile.fcm_token as string

  const accessToken = await getAccessToken({
    clientEmail: serviceAccount.client_email,
    privateKey: serviceAccount.private_key,
  })

  const res = await fetch(
    `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        message: {
          token: fcmToken,
          notification: {
            title: body.title,
            body: body.body,
            image: body.image_url,
          },
          data: {
            screen: body.screen ?? '',
            image_position: 'right',
            product_id: body.product_id ?? '',
          },
        },
      }),
    }
  )

  const resData = await res.json()

  if (res.status < 200 || 299 < res.status) {
    console.error('❌ FCM Error:', resData)
    return new Response(JSON.stringify(resData), {
      status: res.status,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const { error: insertError } = await supabase.from('notifications').insert({
    user_id: body.user_id,
    title: body.title,
    body: body.body,
    image_url: body.image_url,
    product_id: body.product_id,
  })

  if (insertError) {
    console.error('❌ Error saving notification:', insertError)
  }

  return new Response(JSON.stringify({ success: true, fcm: resData }), {
    headers: { 'Content-Type': 'application/json' },
  })
})

const getAccessToken = ({
  clientEmail,
  privateKey,
}: {
  clientEmail: string
  privateKey: string
}): Promise<string> => {
  return new Promise((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
    })
    jwtClient.authorize((err, tokens) => {
      if (err) {
        reject(err)
        return
      }
      resolve(tokens!.access_token!)
    })
  })
}

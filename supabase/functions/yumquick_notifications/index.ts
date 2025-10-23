import { createClient } from "jsr:@supabase/supabase-js@2";

Deno.serve(async (req) => {
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
  );

  const { userId, title, body } = await req.json();

  if (!userId || !title || !body) {
    return new Response("Missing parameters", { status: 400 });
  }

  const { data: tokenData, error } = await supabase
    .from("profiles")
    .select("fcm_token")
    .eq("id", userId)
    .single();

  if (error || !tokenData?.fcm_token) {
    return new Response("User token not found", { status: 404 });
  }

  const fcmToken = tokenData.fcm_token;

  const res = await fetch("https://fcm.googleapis.com/fcm/send", {
    method: "POST",
    headers: {
      "Authorization": `key=${Deno.env.get("FCM_SERVER_KEY")}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      to: fcmToken,
      notification: { title, body },
    }),
  });

  const result = await res.json();
  return new Response(JSON.stringify(result), { status: 200 });
});

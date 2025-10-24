import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> sendNotificationToUser({
  required String userId,
  required String title,
  required String body,
}) async {
  final supabase = Supabase.instance.client;

  await supabase.functions.invoke(
    'sendNotification',
    body: {'userId': userId, 'title': title, 'body': body},
  );
}

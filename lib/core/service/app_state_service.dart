import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

class AppStatsService {
  final supabase = Supabase.instance.client;

  Future<AppStatsEntity?> getLatestStats() async {
    final response =
        await supabase
            .from('app_stats')
            .select()
            .order('created_at', ascending: false)
            .limit(1)
            .single();

    return AppStatsEntity.fromJson(response);
  }
}

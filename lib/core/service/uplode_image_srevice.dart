import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UplodeImageSrevice {
  final SupabaseClient supabase = Supabase.instance.client;
  Future<String> uploadImageToSupabase(XFile imageFile) async {
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}';
    final filePath = 'products/$fileName';
    final bytes = await imageFile.readAsBytes();

    await supabase.storage
        .from('products')
        .uploadBinary(
          filePath,
          bytes,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    return supabase.storage.from('products').getPublicUrl(filePath);
  }

  Future<String> updateImageToSupabase(XFile imageFile) async {
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}';
    final filePath = 'products/$fileName';
    final bytes = await imageFile.readAsBytes();

    await supabase.storage
        .from('products')
        .updateBinary(
          filePath,
          bytes,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    return supabase.storage.from('products').getPublicUrl(filePath);
  }
}

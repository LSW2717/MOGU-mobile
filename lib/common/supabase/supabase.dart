import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data_source/data.dart';

final supabaseProvider = Provider<SupabaseClient>((ref) {
  return SupabaseClient(url, anonKey);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_quest/models/quest/quest.dart';

class QuestRepository {
  final supabase = Supabase.instance.client;

  void getQuest() async {
    final response = await supabase.rpc("new_quest");
    print("LOGEE ${response.map((res) => Quest.fromJson(res))}");
 }
}

// categories:categories (
// name
// )
final questRepositoryProvider = Provider<QuestRepository>((ref) {
  return QuestRepository();
});

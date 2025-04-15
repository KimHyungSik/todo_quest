import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

@freezed
abstract class Quest with _$Quest {
  const factory Quest({
    required String id,
    required int completion_criteria_days,
    required String description,
    required int difficulty,
    required String difficulty_label,
    required int duration_days,
    required Map<String, dynamic> rewards,
    required String short_description,
    required List<String> tags,
    required String title,
  }) = _Quest;
  const Quest._();
  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
}
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/quest_category.dart';
import '../title/reward_title.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

@freezed
abstract class Quest with _$Quest {
  const Quest._();

  const factory Quest({
    required String id,
    @Default(1) int completion_criteria_days,
    @Default('') String description,
    @Default(1) int difficulty,
    @Default('쉬움') String difficulty_label,
    @Default(7) int duration_days,
    required Map<String, dynamic> rewards,
    @Default('') String short_description,
    required String title,
    @Default([]) List<QuestCategory> categories,
    required RewardTitle rewardTitle,
    @Default(false) bool isCompleted,
  }) = _Quest;

  /// Creates a Quest with default values for missing fields
  /// This helps handle incomplete data from Firestore
  @JsonKey(ignore: true)
  factory Quest.safe({
    required String id,
    required String title,
    required RewardTitle rewardTitle,
    Map<String, dynamic>? rewards,
    String? description,
    String? short_description,
    int? completion_criteria_days,
    int? difficulty,
    String? difficulty_label,
    int? duration_days,
    List<QuestCategory>? categories,
    bool? isCompleted,
  }) {
    return Quest(
      id: id,
      title: title,
      rewardTitle: rewardTitle,
      rewards: rewards ?? {'exp': 0},
      description: description ?? '',
      short_description: short_description ?? '',
      completion_criteria_days: completion_criteria_days ?? 1,
      difficulty: difficulty ?? 1,
      difficulty_label: difficulty_label ?? '쉬움',
      duration_days: duration_days ?? 7,
      categories: categories ?? const [],
      isCompleted: isCompleted ?? false,
    );
  }

  /// Custom fromJson converter with robust error handling
  static Quest fromJsonSafe(Map<String, dynamic> json) {
    try {
      // Try standard fromJson first
      return _$QuestFromJson(json);
    } catch (e) {
      // Fallback to safe creation if standard method fails
      print('Error parsing Quest JSON: $e. Using safe fallback.');
      
      // Extract and safely convert categories
      List<QuestCategory> safeCategories = [];
      try {
        if (json['categories'] != null) {
          safeCategories = (json['categories'] as List<dynamic>)
              .map((e) => QuestCategory.fromJson(e as Map<String, dynamic>))
              .toList();
        } else if (json['tag_refs'] != null) {
          safeCategories = (json['tag_refs'] as List<dynamic>)
              .map((e) => e is QuestCategory ? e : QuestCategory(
                    id: e['id'] ?? 'unknown',
                    name: e['name'] ?? 'Unknown Category',
                    description: e['description'] ?? '',
                  ))
              .toList();
        }
      } catch (e) {
        print('Error parsing categories: $e');
      }
      
      // Extract and safely convert rewardTitle
      RewardTitle safeRewardTitle;
      try {
        if (json['rewardTitle'] != null) {
          safeRewardTitle = RewardTitle.fromJson(json['rewardTitle'] as Map<String, dynamic>);
        } else if (json['rewards'] != null && json['rewards']['title_ref'] is RewardTitle) {
          safeRewardTitle = json['rewards']['title_ref'] as RewardTitle;
        } else {
          safeRewardTitle = RewardTitle(
            id: 'unknown',
            name: 'Unknown Title',
            description: '',
          );
        }
      } catch (e) {
        print('Error parsing rewardTitle: $e');
        safeRewardTitle = RewardTitle(
          id: 'unknown',
          name: 'Unknown Title',
          description: '',
        );
      }
      
      // Create a safe rewards map
      Map<String, dynamic> safeRewards;
      try {
        safeRewards = json['rewards'] as Map<String, dynamic>;
      } catch (e) {
        safeRewards = {'exp': 0};
      }
      
      return Quest.safe(
        id: json['id'] as String? ?? 'unknown',
        title: json['title'] as String? ?? 'Unknown Quest',
        description: json['description'] as String?,
        short_description: json['short_description'] as String?,
        completion_criteria_days: (json['completion_criteria_days'] as num?)?.toInt(),
        difficulty: (json['difficulty'] as num?)?.toInt(),
        difficulty_label: json['difficulty_label'] as String?,
        duration_days: (json['duration_days'] as num?)?.toInt(),
        rewards: safeRewards,
        categories: safeCategories,
        rewardTitle: safeRewardTitle,
        isCompleted: json['isCompleted'] as bool?,
      );
    }
  }

  factory Quest.fromJson(Map<String, dynamic> json) => fromJsonSafe(json);
}
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/quest_category.dart';
import '../title/reward_title.dart';

part 'quest.freezed.dart';

part 'quest.g.dart';

@freezed
abstract class Quest with _$Quest {
  const Quest._();

  factory Quest({
    required int id,
    required String title,
    @JsonKey(name: 'rewards_title') required int rewardTitleId,
    @JsonKey(name: 'rewards_exp') required int rewardsExp,
    required int difficulty,
    @JsonKey(name: 'difficulty_label') required String? difficultyLabel,
    @JsonKey(name: 'completion_criteria_days')
    required int completion_criteria_days,
    @JsonKey(name: 'duration_days') required int durationDays,
    String? description,
    @JsonKey(name: 'short_description') String? shortDescription,
    @JsonKey(name: 'categories') List<int>? categoriesId,
    // Non-serialized fields for the related objects
    @JsonKey(includeFromJson: false, includeToJson: false) RewardTitle? rewardTitle,
    @JsonKey(includeFromJson: false, includeToJson: false) List<QuestCategory>? categoriesList,
  }) = _Quest;

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  // Helper method to create a new Quest with populated title and categories
  Quest copyWithRelations({
    RewardTitle? rewardTitle,
    List<QuestCategory>? categories,
  }) {
    return copyWith(
      rewardTitle: rewardTitle ?? this.rewardTitle,
      categoriesList: categories ?? this.categoriesList,
    );
  }
}

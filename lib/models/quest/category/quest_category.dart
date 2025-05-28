import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest_category.freezed.dart';
part 'quest_category.g.dart';

@freezed
abstract class QuestCategory with _$QuestCategory {
  const QuestCategory._();

  const factory QuestCategory({
    required String id,
    required String name,
    String? description,
  }) = _QuestCategory;

  factory QuestCategory.fromJson(Map<String, dynamic> json) =>
      _$QuestCategoryFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_title.freezed.dart';
part 'reward_title.g.dart';

@freezed
abstract class RewardTitle with _$RewardTitle {
  const RewardTitle._();

  const factory RewardTitle({
    required int id,
    required String name,
    required String description,
  }) = _RewardTitle;

  factory RewardTitle.fromJson(Map<String, dynamic> json) => _$RewardTitleFromJson(json);
}
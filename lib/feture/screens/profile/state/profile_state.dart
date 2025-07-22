import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../models/user/user_info/user_profile.dart';
import '../../../../models/quest/category/quest_category.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();

  factory ProfileState({
    UserInfo? userInfo,
    @Default([]) List<QuestCategory> allCategories,
    @Default([]) List<QuestCategory> selectedCategories,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _ProfileState;

  factory ProfileState.fromJson(Map<String, dynamic> json) => _$ProfileStateFromJson(json);
}
// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_quest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserQuestInfo {
  @JsonKey(name: 'quest_id')
  String get questId;
  @JsonKey(name: 'quest_title')
  String get questTitle;
  @JsonKey(name: 'quest_description')
  String? get questDescription;
  @JsonKey(name: 'quest_short_description')
  String? get questShortDescription;
  int? get difficulty; // smallint에서 int로 변경
  @JsonKey(name: 'difficulty_label')
  String? get difficultyLabel;
  @JsonKey(name: 'completion_criteria_days')
  int get completionCriteriaDays;
  @JsonKey(name: 'duration_days')
  int get durationDays;
  @JsonKey(name: 'rewards_exp')
  int get rewardsExp;
  @JsonKey(name: 'reward_title_name')
  String? get rewardTitleName;
  List<String> get categories;
  @JsonKey(name: 'user_quest_id')
  String get userQuestId;
  @JsonKey(name: 'user_quest_status')
  String? get userQuestStatus;
  @JsonKey(name: 'user_quest_created_at')
  DateTime? get userQuestCreatedAt;
  @JsonKey(name: 'user_quest_completed_at')
  DateTime? get userQuestCompletedAt;

  /// Create a copy of UserQuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserQuestInfoCopyWith<UserQuestInfo> get copyWith =>
      _$UserQuestInfoCopyWithImpl<UserQuestInfo>(
          this as UserQuestInfo, _$identity);

  /// Serializes this UserQuestInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserQuestInfo &&
            (identical(other.questId, questId) || other.questId == questId) &&
            (identical(other.questTitle, questTitle) ||
                other.questTitle == questTitle) &&
            (identical(other.questDescription, questDescription) ||
                other.questDescription == questDescription) &&
            (identical(other.questShortDescription, questShortDescription) ||
                other.questShortDescription == questShortDescription) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.difficultyLabel, difficultyLabel) ||
                other.difficultyLabel == difficultyLabel) &&
            (identical(other.completionCriteriaDays, completionCriteriaDays) ||
                other.completionCriteriaDays == completionCriteriaDays) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.rewardsExp, rewardsExp) ||
                other.rewardsExp == rewardsExp) &&
            (identical(other.rewardTitleName, rewardTitleName) ||
                other.rewardTitleName == rewardTitleName) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.userQuestId, userQuestId) ||
                other.userQuestId == userQuestId) &&
            (identical(other.userQuestStatus, userQuestStatus) ||
                other.userQuestStatus == userQuestStatus) &&
            (identical(other.userQuestCreatedAt, userQuestCreatedAt) ||
                other.userQuestCreatedAt == userQuestCreatedAt) &&
            (identical(other.userQuestCompletedAt, userQuestCompletedAt) ||
                other.userQuestCompletedAt == userQuestCompletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questId,
      questTitle,
      questDescription,
      questShortDescription,
      difficulty,
      difficultyLabel,
      completionCriteriaDays,
      durationDays,
      rewardsExp,
      rewardTitleName,
      const DeepCollectionEquality().hash(categories),
      userQuestId,
      userQuestStatus,
      userQuestCreatedAt,
      userQuestCompletedAt);

  @override
  String toString() {
    return 'UserQuestInfo(questId: $questId, questTitle: $questTitle, questDescription: $questDescription, questShortDescription: $questShortDescription, difficulty: $difficulty, difficultyLabel: $difficultyLabel, completionCriteriaDays: $completionCriteriaDays, durationDays: $durationDays, rewardsExp: $rewardsExp, rewardTitleName: $rewardTitleName, categories: $categories, userQuestId: $userQuestId, userQuestStatus: $userQuestStatus, userQuestCreatedAt: $userQuestCreatedAt, userQuestCompletedAt: $userQuestCompletedAt)';
  }
}

/// @nodoc
abstract mixin class $UserQuestInfoCopyWith<$Res> {
  factory $UserQuestInfoCopyWith(
          UserQuestInfo value, $Res Function(UserQuestInfo) _then) =
      _$UserQuestInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'quest_id') String questId,
      @JsonKey(name: 'quest_title') String questTitle,
      @JsonKey(name: 'quest_description') String? questDescription,
      @JsonKey(name: 'quest_short_description') String? questShortDescription,
      int? difficulty,
      @JsonKey(name: 'difficulty_label') String? difficultyLabel,
      @JsonKey(name: 'completion_criteria_days') int completionCriteriaDays,
      @JsonKey(name: 'duration_days') int durationDays,
      @JsonKey(name: 'rewards_exp') int rewardsExp,
      @JsonKey(name: 'reward_title_name') String? rewardTitleName,
      List<String> categories,
      @JsonKey(name: 'user_quest_id') String userQuestId,
      @JsonKey(name: 'user_quest_status') String? userQuestStatus,
      @JsonKey(name: 'user_quest_created_at') DateTime? userQuestCreatedAt,
      @JsonKey(name: 'user_quest_completed_at')
      DateTime? userQuestCompletedAt});
}

/// @nodoc
class _$UserQuestInfoCopyWithImpl<$Res>
    implements $UserQuestInfoCopyWith<$Res> {
  _$UserQuestInfoCopyWithImpl(this._self, this._then);

  final UserQuestInfo _self;
  final $Res Function(UserQuestInfo) _then;

  /// Create a copy of UserQuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questId = null,
    Object? questTitle = null,
    Object? questDescription = freezed,
    Object? questShortDescription = freezed,
    Object? difficulty = freezed,
    Object? difficultyLabel = freezed,
    Object? completionCriteriaDays = null,
    Object? durationDays = null,
    Object? rewardsExp = null,
    Object? rewardTitleName = freezed,
    Object? categories = null,
    Object? userQuestId = null,
    Object? userQuestStatus = freezed,
    Object? userQuestCreatedAt = freezed,
    Object? userQuestCompletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      questId: null == questId
          ? _self.questId
          : questId // ignore: cast_nullable_to_non_nullable
              as String,
      questTitle: null == questTitle
          ? _self.questTitle
          : questTitle // ignore: cast_nullable_to_non_nullable
              as String,
      questDescription: freezed == questDescription
          ? _self.questDescription
          : questDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      questShortDescription: freezed == questShortDescription
          ? _self.questShortDescription
          : questShortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      difficultyLabel: freezed == difficultyLabel
          ? _self.difficultyLabel
          : difficultyLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      completionCriteriaDays: null == completionCriteriaDays
          ? _self.completionCriteriaDays
          : completionCriteriaDays // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsExp: null == rewardsExp
          ? _self.rewardsExp
          : rewardsExp // ignore: cast_nullable_to_non_nullable
              as int,
      rewardTitleName: freezed == rewardTitleName
          ? _self.rewardTitleName
          : rewardTitleName // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userQuestId: null == userQuestId
          ? _self.userQuestId
          : userQuestId // ignore: cast_nullable_to_non_nullable
              as String,
      userQuestStatus: freezed == userQuestStatus
          ? _self.userQuestStatus
          : userQuestStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      userQuestCreatedAt: freezed == userQuestCreatedAt
          ? _self.userQuestCreatedAt
          : userQuestCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userQuestCompletedAt: freezed == userQuestCompletedAt
          ? _self.userQuestCompletedAt
          : userQuestCompletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserQuestInfo extends UserQuestInfo {
  _UserQuestInfo(
      {@JsonKey(name: 'quest_id') required this.questId,
      @JsonKey(name: 'quest_title') required this.questTitle,
      @JsonKey(name: 'quest_description') this.questDescription,
      @JsonKey(name: 'quest_short_description') this.questShortDescription,
      this.difficulty,
      @JsonKey(name: 'difficulty_label') this.difficultyLabel,
      @JsonKey(name: 'completion_criteria_days')
      this.completionCriteriaDays = 1,
      @JsonKey(name: 'duration_days') this.durationDays = 7,
      @JsonKey(name: 'rewards_exp') this.rewardsExp = 0,
      @JsonKey(name: 'reward_title_name') this.rewardTitleName,
      final List<String> categories = const [],
      @JsonKey(name: 'user_quest_id') required this.userQuestId,
      @JsonKey(name: 'user_quest_status') this.userQuestStatus,
      @JsonKey(name: 'user_quest_created_at') this.userQuestCreatedAt,
      @JsonKey(name: 'user_quest_completed_at') this.userQuestCompletedAt})
      : _categories = categories,
        super._();
  factory _UserQuestInfo.fromJson(Map<String, dynamic> json) =>
      _$UserQuestInfoFromJson(json);

  @override
  @JsonKey(name: 'quest_id')
  final String questId;
  @override
  @JsonKey(name: 'quest_title')
  final String questTitle;
  @override
  @JsonKey(name: 'quest_description')
  final String? questDescription;
  @override
  @JsonKey(name: 'quest_short_description')
  final String? questShortDescription;
  @override
  final int? difficulty;
// smallint에서 int로 변경
  @override
  @JsonKey(name: 'difficulty_label')
  final String? difficultyLabel;
  @override
  @JsonKey(name: 'completion_criteria_days')
  final int completionCriteriaDays;
  @override
  @JsonKey(name: 'duration_days')
  final int durationDays;
  @override
  @JsonKey(name: 'rewards_exp')
  final int rewardsExp;
  @override
  @JsonKey(name: 'reward_title_name')
  final String? rewardTitleName;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey(name: 'user_quest_id')
  final String userQuestId;
  @override
  @JsonKey(name: 'user_quest_status')
  final String? userQuestStatus;
  @override
  @JsonKey(name: 'user_quest_created_at')
  final DateTime? userQuestCreatedAt;
  @override
  @JsonKey(name: 'user_quest_completed_at')
  final DateTime? userQuestCompletedAt;

  /// Create a copy of UserQuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserQuestInfoCopyWith<_UserQuestInfo> get copyWith =>
      __$UserQuestInfoCopyWithImpl<_UserQuestInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserQuestInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserQuestInfo &&
            (identical(other.questId, questId) || other.questId == questId) &&
            (identical(other.questTitle, questTitle) ||
                other.questTitle == questTitle) &&
            (identical(other.questDescription, questDescription) ||
                other.questDescription == questDescription) &&
            (identical(other.questShortDescription, questShortDescription) ||
                other.questShortDescription == questShortDescription) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.difficultyLabel, difficultyLabel) ||
                other.difficultyLabel == difficultyLabel) &&
            (identical(other.completionCriteriaDays, completionCriteriaDays) ||
                other.completionCriteriaDays == completionCriteriaDays) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.rewardsExp, rewardsExp) ||
                other.rewardsExp == rewardsExp) &&
            (identical(other.rewardTitleName, rewardTitleName) ||
                other.rewardTitleName == rewardTitleName) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.userQuestId, userQuestId) ||
                other.userQuestId == userQuestId) &&
            (identical(other.userQuestStatus, userQuestStatus) ||
                other.userQuestStatus == userQuestStatus) &&
            (identical(other.userQuestCreatedAt, userQuestCreatedAt) ||
                other.userQuestCreatedAt == userQuestCreatedAt) &&
            (identical(other.userQuestCompletedAt, userQuestCompletedAt) ||
                other.userQuestCompletedAt == userQuestCompletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questId,
      questTitle,
      questDescription,
      questShortDescription,
      difficulty,
      difficultyLabel,
      completionCriteriaDays,
      durationDays,
      rewardsExp,
      rewardTitleName,
      const DeepCollectionEquality().hash(_categories),
      userQuestId,
      userQuestStatus,
      userQuestCreatedAt,
      userQuestCompletedAt);

  @override
  String toString() {
    return 'UserQuestInfo(questId: $questId, questTitle: $questTitle, questDescription: $questDescription, questShortDescription: $questShortDescription, difficulty: $difficulty, difficultyLabel: $difficultyLabel, completionCriteriaDays: $completionCriteriaDays, durationDays: $durationDays, rewardsExp: $rewardsExp, rewardTitleName: $rewardTitleName, categories: $categories, userQuestId: $userQuestId, userQuestStatus: $userQuestStatus, userQuestCreatedAt: $userQuestCreatedAt, userQuestCompletedAt: $userQuestCompletedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserQuestInfoCopyWith<$Res>
    implements $UserQuestInfoCopyWith<$Res> {
  factory _$UserQuestInfoCopyWith(
          _UserQuestInfo value, $Res Function(_UserQuestInfo) _then) =
      __$UserQuestInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quest_id') String questId,
      @JsonKey(name: 'quest_title') String questTitle,
      @JsonKey(name: 'quest_description') String? questDescription,
      @JsonKey(name: 'quest_short_description') String? questShortDescription,
      int? difficulty,
      @JsonKey(name: 'difficulty_label') String? difficultyLabel,
      @JsonKey(name: 'completion_criteria_days') int completionCriteriaDays,
      @JsonKey(name: 'duration_days') int durationDays,
      @JsonKey(name: 'rewards_exp') int rewardsExp,
      @JsonKey(name: 'reward_title_name') String? rewardTitleName,
      List<String> categories,
      @JsonKey(name: 'user_quest_id') String userQuestId,
      @JsonKey(name: 'user_quest_status') String? userQuestStatus,
      @JsonKey(name: 'user_quest_created_at') DateTime? userQuestCreatedAt,
      @JsonKey(name: 'user_quest_completed_at')
      DateTime? userQuestCompletedAt});
}

/// @nodoc
class __$UserQuestInfoCopyWithImpl<$Res>
    implements _$UserQuestInfoCopyWith<$Res> {
  __$UserQuestInfoCopyWithImpl(this._self, this._then);

  final _UserQuestInfo _self;
  final $Res Function(_UserQuestInfo) _then;

  /// Create a copy of UserQuestInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questId = null,
    Object? questTitle = null,
    Object? questDescription = freezed,
    Object? questShortDescription = freezed,
    Object? difficulty = freezed,
    Object? difficultyLabel = freezed,
    Object? completionCriteriaDays = null,
    Object? durationDays = null,
    Object? rewardsExp = null,
    Object? rewardTitleName = freezed,
    Object? categories = null,
    Object? userQuestId = null,
    Object? userQuestStatus = freezed,
    Object? userQuestCreatedAt = freezed,
    Object? userQuestCompletedAt = freezed,
  }) {
    return _then(_UserQuestInfo(
      questId: null == questId
          ? _self.questId
          : questId // ignore: cast_nullable_to_non_nullable
              as String,
      questTitle: null == questTitle
          ? _self.questTitle
          : questTitle // ignore: cast_nullable_to_non_nullable
              as String,
      questDescription: freezed == questDescription
          ? _self.questDescription
          : questDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      questShortDescription: freezed == questShortDescription
          ? _self.questShortDescription
          : questShortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      difficultyLabel: freezed == difficultyLabel
          ? _self.difficultyLabel
          : difficultyLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      completionCriteriaDays: null == completionCriteriaDays
          ? _self.completionCriteriaDays
          : completionCriteriaDays // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsExp: null == rewardsExp
          ? _self.rewardsExp
          : rewardsExp // ignore: cast_nullable_to_non_nullable
              as int,
      rewardTitleName: freezed == rewardTitleName
          ? _self.rewardTitleName
          : rewardTitleName // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userQuestId: null == userQuestId
          ? _self.userQuestId
          : userQuestId // ignore: cast_nullable_to_non_nullable
              as String,
      userQuestStatus: freezed == userQuestStatus
          ? _self.userQuestStatus
          : userQuestStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      userQuestCreatedAt: freezed == userQuestCreatedAt
          ? _self.userQuestCreatedAt
          : userQuestCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userQuestCompletedAt: freezed == userQuestCompletedAt
          ? _self.userQuestCompletedAt
          : userQuestCompletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on

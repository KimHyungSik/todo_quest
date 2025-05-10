// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quest implements DiagnosticableTreeMixin {
  int get id;
  String get title;
  @JsonKey(name: 'rewards_title')
  int get rewardTitleId;
  @JsonKey(name: 'rewards_exp')
  int get rewardsExp;
  int get difficulty;
  @JsonKey(name: 'difficulty_label')
  String? get difficultyLabel;
  @JsonKey(name: 'completion_criteria_days')
  int get completion_criteria_days;
  @JsonKey(name: 'duration_days')
  int get durationDays;
  String? get description;
  @JsonKey(name: 'short_description')
  String? get shortDescription;
  @JsonKey(name: 'categories')
  List<int>? get categoriesId;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestCopyWith<Quest> get copyWith =>
      _$QuestCopyWithImpl<Quest>(this as Quest, _$identity);

  /// Serializes this Quest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Quest'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('rewardTitleId', rewardTitleId))
      ..add(DiagnosticsProperty('rewardsExp', rewardsExp))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('difficultyLabel', difficultyLabel))
      ..add(DiagnosticsProperty(
          'completion_criteria_days', completion_criteria_days))
      ..add(DiagnosticsProperty('durationDays', durationDays))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('shortDescription', shortDescription))
      ..add(DiagnosticsProperty('categoriesId', categoriesId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Quest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rewardTitleId, rewardTitleId) ||
                other.rewardTitleId == rewardTitleId) &&
            (identical(other.rewardsExp, rewardsExp) ||
                other.rewardsExp == rewardsExp) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.difficultyLabel, difficultyLabel) ||
                other.difficultyLabel == difficultyLabel) &&
            (identical(
                    other.completion_criteria_days, completion_criteria_days) ||
                other.completion_criteria_days == completion_criteria_days) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            const DeepCollectionEquality()
                .equals(other.categoriesId, categoriesId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      rewardTitleId,
      rewardsExp,
      difficulty,
      difficultyLabel,
      completion_criteria_days,
      durationDays,
      description,
      shortDescription,
      const DeepCollectionEquality().hash(categoriesId));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quest(id: $id, title: $title, rewardTitleId: $rewardTitleId, rewardsExp: $rewardsExp, difficulty: $difficulty, difficultyLabel: $difficultyLabel, completion_criteria_days: $completion_criteria_days, durationDays: $durationDays, description: $description, shortDescription: $shortDescription, categoriesId: $categoriesId)';
  }
}

/// @nodoc
abstract mixin class $QuestCopyWith<$Res> {
  factory $QuestCopyWith(Quest value, $Res Function(Quest) _then) =
      _$QuestCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'rewards_title') int rewardTitleId,
      @JsonKey(name: 'rewards_exp') int rewardsExp,
      int difficulty,
      @JsonKey(name: 'difficulty_label') String? difficultyLabel,
      @JsonKey(name: 'completion_criteria_days') int completion_criteria_days,
      @JsonKey(name: 'duration_days') int durationDays,
      String? description,
      @JsonKey(name: 'short_description') String? shortDescription,
      @JsonKey(name: 'categories') List<int>? categoriesId});
}

/// @nodoc
class _$QuestCopyWithImpl<$Res> implements $QuestCopyWith<$Res> {
  _$QuestCopyWithImpl(this._self, this._then);

  final Quest _self;
  final $Res Function(Quest) _then;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? rewardTitleId = null,
    Object? rewardsExp = null,
    Object? difficulty = null,
    Object? difficultyLabel = freezed,
    Object? completion_criteria_days = null,
    Object? durationDays = null,
    Object? description = freezed,
    Object? shortDescription = freezed,
    Object? categoriesId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rewardTitleId: null == rewardTitleId
          ? _self.rewardTitleId
          : rewardTitleId // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsExp: null == rewardsExp
          ? _self.rewardsExp
          : rewardsExp // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      difficultyLabel: freezed == difficultyLabel
          ? _self.difficultyLabel
          : difficultyLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      completion_criteria_days: null == completion_criteria_days
          ? _self.completion_criteria_days
          : completion_criteria_days // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _self.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesId: freezed == categoriesId
          ? _self.categoriesId
          : categoriesId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Quest extends Quest with DiagnosticableTreeMixin {
  _Quest(
      {required this.id,
      required this.title,
      @JsonKey(name: 'rewards_title') required this.rewardTitleId,
      @JsonKey(name: 'rewards_exp') required this.rewardsExp,
      required this.difficulty,
      @JsonKey(name: 'difficulty_label') required this.difficultyLabel,
      @JsonKey(name: 'completion_criteria_days')
      required this.completion_criteria_days,
      @JsonKey(name: 'duration_days') required this.durationDays,
      this.description,
      @JsonKey(name: 'short_description') this.shortDescription,
      @JsonKey(name: 'categories') final List<int>? categoriesId})
      : _categoriesId = categoriesId,
        super._();
  factory _Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'rewards_title')
  final int rewardTitleId;
  @override
  @JsonKey(name: 'rewards_exp')
  final int rewardsExp;
  @override
  final int difficulty;
  @override
  @JsonKey(name: 'difficulty_label')
  final String? difficultyLabel;
  @override
  @JsonKey(name: 'completion_criteria_days')
  final int completion_criteria_days;
  @override
  @JsonKey(name: 'duration_days')
  final int durationDays;
  @override
  final String? description;
  @override
  @JsonKey(name: 'short_description')
  final String? shortDescription;
  final List<int>? _categoriesId;
  @override
  @JsonKey(name: 'categories')
  List<int>? get categoriesId {
    final value = _categoriesId;
    if (value == null) return null;
    if (_categoriesId is EqualUnmodifiableListView) return _categoriesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestCopyWith<_Quest> get copyWith =>
      __$QuestCopyWithImpl<_Quest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Quest'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('rewardTitleId', rewardTitleId))
      ..add(DiagnosticsProperty('rewardsExp', rewardsExp))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('difficultyLabel', difficultyLabel))
      ..add(DiagnosticsProperty(
          'completion_criteria_days', completion_criteria_days))
      ..add(DiagnosticsProperty('durationDays', durationDays))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('shortDescription', shortDescription))
      ..add(DiagnosticsProperty('categoriesId', categoriesId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Quest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rewardTitleId, rewardTitleId) ||
                other.rewardTitleId == rewardTitleId) &&
            (identical(other.rewardsExp, rewardsExp) ||
                other.rewardsExp == rewardsExp) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.difficultyLabel, difficultyLabel) ||
                other.difficultyLabel == difficultyLabel) &&
            (identical(
                    other.completion_criteria_days, completion_criteria_days) ||
                other.completion_criteria_days == completion_criteria_days) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            const DeepCollectionEquality()
                .equals(other._categoriesId, _categoriesId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      rewardTitleId,
      rewardsExp,
      difficulty,
      difficultyLabel,
      completion_criteria_days,
      durationDays,
      description,
      shortDescription,
      const DeepCollectionEquality().hash(_categoriesId));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quest(id: $id, title: $title, rewardTitleId: $rewardTitleId, rewardsExp: $rewardsExp, difficulty: $difficulty, difficultyLabel: $difficultyLabel, completion_criteria_days: $completion_criteria_days, durationDays: $durationDays, description: $description, shortDescription: $shortDescription, categoriesId: $categoriesId)';
  }
}

/// @nodoc
abstract mixin class _$QuestCopyWith<$Res> implements $QuestCopyWith<$Res> {
  factory _$QuestCopyWith(_Quest value, $Res Function(_Quest) _then) =
      __$QuestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'rewards_title') int rewardTitleId,
      @JsonKey(name: 'rewards_exp') int rewardsExp,
      int difficulty,
      @JsonKey(name: 'difficulty_label') String? difficultyLabel,
      @JsonKey(name: 'completion_criteria_days') int completion_criteria_days,
      @JsonKey(name: 'duration_days') int durationDays,
      String? description,
      @JsonKey(name: 'short_description') String? shortDescription,
      @JsonKey(name: 'categories') List<int>? categoriesId});
}

/// @nodoc
class __$QuestCopyWithImpl<$Res> implements _$QuestCopyWith<$Res> {
  __$QuestCopyWithImpl(this._self, this._then);

  final _Quest _self;
  final $Res Function(_Quest) _then;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? rewardTitleId = null,
    Object? rewardsExp = null,
    Object? difficulty = null,
    Object? difficultyLabel = freezed,
    Object? completion_criteria_days = null,
    Object? durationDays = null,
    Object? description = freezed,
    Object? shortDescription = freezed,
    Object? categoriesId = freezed,
  }) {
    return _then(_Quest(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rewardTitleId: null == rewardTitleId
          ? _self.rewardTitleId
          : rewardTitleId // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsExp: null == rewardsExp
          ? _self.rewardsExp
          : rewardsExp // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      difficultyLabel: freezed == difficultyLabel
          ? _self.difficultyLabel
          : difficultyLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      completion_criteria_days: null == completion_criteria_days
          ? _self.completion_criteria_days
          : completion_criteria_days // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: null == durationDays
          ? _self.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _self.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesId: freezed == categoriesId
          ? _self._categoriesId
          : categoriesId // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

// dart format on

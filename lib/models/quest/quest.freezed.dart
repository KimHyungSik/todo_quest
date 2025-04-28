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
  String get id;
  int get completion_criteria_days;
  String get description;
  int get difficulty;
  String get difficulty_label;
  int get duration_days;
  Map<String, dynamic> get rewards;
  String get short_description;
  String get title;
  List<QuestCategory> get categories;
  RewardTitle get rewardTitle;
  bool get isCompleted;

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
      ..add(DiagnosticsProperty(
          'completion_criteria_days', completion_criteria_days))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('difficulty_label', difficulty_label))
      ..add(DiagnosticsProperty('duration_days', duration_days))
      ..add(DiagnosticsProperty('rewards', rewards))
      ..add(DiagnosticsProperty('short_description', short_description))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('rewardTitle', rewardTitle))
      ..add(DiagnosticsProperty('isCompleted', isCompleted));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Quest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.completion_criteria_days, completion_criteria_days) ||
                other.completion_criteria_days == completion_criteria_days) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.difficulty_label, difficulty_label) ||
                other.difficulty_label == difficulty_label) &&
            (identical(other.duration_days, duration_days) ||
                other.duration_days == duration_days) &&
            const DeepCollectionEquality().equals(other.rewards, rewards) &&
            (identical(other.short_description, short_description) ||
                other.short_description == short_description) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.rewardTitle, rewardTitle) ||
                other.rewardTitle == rewardTitle) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      completion_criteria_days,
      description,
      difficulty,
      difficulty_label,
      duration_days,
      const DeepCollectionEquality().hash(rewards),
      short_description,
      title,
      const DeepCollectionEquality().hash(categories),
      rewardTitle,
      isCompleted);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quest(id: $id, completion_criteria_days: $completion_criteria_days, description: $description, difficulty: $difficulty, difficulty_label: $difficulty_label, duration_days: $duration_days, rewards: $rewards, short_description: $short_description, title: $title, categories: $categories, rewardTitle: $rewardTitle, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class $QuestCopyWith<$Res> {
  factory $QuestCopyWith(Quest value, $Res Function(Quest) _then) =
      _$QuestCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int completion_criteria_days,
      String description,
      int difficulty,
      String difficulty_label,
      int duration_days,
      Map<String, dynamic> rewards,
      String short_description,
      String title,
      List<QuestCategory> categories,
      RewardTitle rewardTitle,
      bool isCompleted});

  $RewardTitleCopyWith<$Res> get rewardTitle;
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
    Object? completion_criteria_days = null,
    Object? description = null,
    Object? difficulty = null,
    Object? difficulty_label = null,
    Object? duration_days = null,
    Object? rewards = null,
    Object? short_description = null,
    Object? title = null,
    Object? categories = null,
    Object? rewardTitle = null,
    Object? isCompleted = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      completion_criteria_days: null == completion_criteria_days
          ? _self.completion_criteria_days
          : completion_criteria_days // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty_label: null == difficulty_label
          ? _self.difficulty_label
          : difficulty_label // ignore: cast_nullable_to_non_nullable
              as String,
      duration_days: null == duration_days
          ? _self.duration_days
          : duration_days // ignore: cast_nullable_to_non_nullable
              as int,
      rewards: null == rewards
          ? _self.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      short_description: null == short_description
          ? _self.short_description
          : short_description // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      rewardTitle: null == rewardTitle
          ? _self.rewardTitle
          : rewardTitle // ignore: cast_nullable_to_non_nullable
              as RewardTitle,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RewardTitleCopyWith<$Res> get rewardTitle {
    return $RewardTitleCopyWith<$Res>(_self.rewardTitle, (value) {
      return _then(_self.copyWith(rewardTitle: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Quest extends Quest with DiagnosticableTreeMixin {
  const _Quest(
      {required this.id,
      this.completion_criteria_days = 1,
      this.description = '',
      this.difficulty = 1,
      this.difficulty_label = '쉬움',
      this.duration_days = 7,
      required final Map<String, dynamic> rewards,
      this.short_description = '',
      required this.title,
      final List<QuestCategory> categories = const [],
      required this.rewardTitle,
      this.isCompleted = false})
      : _rewards = rewards,
        _categories = categories,
        super._();
  factory _Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final int completion_criteria_days;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int difficulty;
  @override
  @JsonKey()
  final String difficulty_label;
  @override
  @JsonKey()
  final int duration_days;
  final Map<String, dynamic> _rewards;
  @override
  Map<String, dynamic> get rewards {
    if (_rewards is EqualUnmodifiableMapView) return _rewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rewards);
  }

  @override
  @JsonKey()
  final String short_description;
  @override
  final String title;
  final List<QuestCategory> _categories;
  @override
  @JsonKey()
  List<QuestCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final RewardTitle rewardTitle;
  @override
  @JsonKey()
  final bool isCompleted;

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
      ..add(DiagnosticsProperty(
          'completion_criteria_days', completion_criteria_days))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('difficulty_label', difficulty_label))
      ..add(DiagnosticsProperty('duration_days', duration_days))
      ..add(DiagnosticsProperty('rewards', rewards))
      ..add(DiagnosticsProperty('short_description', short_description))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('rewardTitle', rewardTitle))
      ..add(DiagnosticsProperty('isCompleted', isCompleted));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Quest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.completion_criteria_days, completion_criteria_days) ||
                other.completion_criteria_days == completion_criteria_days) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.difficulty_label, difficulty_label) ||
                other.difficulty_label == difficulty_label) &&
            (identical(other.duration_days, duration_days) ||
                other.duration_days == duration_days) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards) &&
            (identical(other.short_description, short_description) ||
                other.short_description == short_description) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.rewardTitle, rewardTitle) ||
                other.rewardTitle == rewardTitle) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      completion_criteria_days,
      description,
      difficulty,
      difficulty_label,
      duration_days,
      const DeepCollectionEquality().hash(_rewards),
      short_description,
      title,
      const DeepCollectionEquality().hash(_categories),
      rewardTitle,
      isCompleted);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quest(id: $id, completion_criteria_days: $completion_criteria_days, description: $description, difficulty: $difficulty, difficulty_label: $difficulty_label, duration_days: $duration_days, rewards: $rewards, short_description: $short_description, title: $title, categories: $categories, rewardTitle: $rewardTitle, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class _$QuestCopyWith<$Res> implements $QuestCopyWith<$Res> {
  factory _$QuestCopyWith(_Quest value, $Res Function(_Quest) _then) =
      __$QuestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int completion_criteria_days,
      String description,
      int difficulty,
      String difficulty_label,
      int duration_days,
      Map<String, dynamic> rewards,
      String short_description,
      String title,
      List<QuestCategory> categories,
      RewardTitle rewardTitle,
      bool isCompleted});

  @override
  $RewardTitleCopyWith<$Res> get rewardTitle;
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
    Object? completion_criteria_days = null,
    Object? description = null,
    Object? difficulty = null,
    Object? difficulty_label = null,
    Object? duration_days = null,
    Object? rewards = null,
    Object? short_description = null,
    Object? title = null,
    Object? categories = null,
    Object? rewardTitle = null,
    Object? isCompleted = null,
  }) {
    return _then(_Quest(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      completion_criteria_days: null == completion_criteria_days
          ? _self.completion_criteria_days
          : completion_criteria_days // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty_label: null == difficulty_label
          ? _self.difficulty_label
          : difficulty_label // ignore: cast_nullable_to_non_nullable
              as String,
      duration_days: null == duration_days
          ? _self.duration_days
          : duration_days // ignore: cast_nullable_to_non_nullable
              as int,
      rewards: null == rewards
          ? _self._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      short_description: null == short_description
          ? _self.short_description
          : short_description // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      rewardTitle: null == rewardTitle
          ? _self.rewardTitle
          : rewardTitle // ignore: cast_nullable_to_non_nullable
              as RewardTitle,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RewardTitleCopyWith<$Res> get rewardTitle {
    return $RewardTitleCopyWith<$Res>(_self.rewardTitle, (value) {
      return _then(_self.copyWith(rewardTitle: value));
    });
  }
}

// dart format on

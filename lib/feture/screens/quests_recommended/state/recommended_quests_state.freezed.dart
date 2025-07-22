// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommended_quests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendedQuestsState {
  List<Quest> get recommendedQuests;
  List<QuestCategory> get categories;
  QuestCategory? get selectedCategory;
  bool get isLoading;
  bool get isSelectingQuest;
  String? get successMessage;
  String? get errorMessage;

  /// Create a copy of RecommendedQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecommendedQuestsStateCopyWith<RecommendedQuestsState> get copyWith =>
      _$RecommendedQuestsStateCopyWithImpl<RecommendedQuestsState>(
          this as RecommendedQuestsState, _$identity);

  /// Serializes this RecommendedQuestsState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecommendedQuestsState &&
            const DeepCollectionEquality()
                .equals(other.recommendedQuests, recommendedQuests) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSelectingQuest, isSelectingQuest) ||
                other.isSelectingQuest == isSelectingQuest) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recommendedQuests),
      const DeepCollectionEquality().hash(categories),
      selectedCategory,
      isLoading,
      isSelectingQuest,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'RecommendedQuestsState(recommendedQuests: $recommendedQuests, categories: $categories, selectedCategory: $selectedCategory, isLoading: $isLoading, isSelectingQuest: $isSelectingQuest, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $RecommendedQuestsStateCopyWith<$Res> {
  factory $RecommendedQuestsStateCopyWith(RecommendedQuestsState value,
          $Res Function(RecommendedQuestsState) _then) =
      _$RecommendedQuestsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Quest> recommendedQuests,
      List<QuestCategory> categories,
      QuestCategory? selectedCategory,
      bool isLoading,
      bool isSelectingQuest,
      String? successMessage,
      String? errorMessage});

  $QuestCategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class _$RecommendedQuestsStateCopyWithImpl<$Res>
    implements $RecommendedQuestsStateCopyWith<$Res> {
  _$RecommendedQuestsStateCopyWithImpl(this._self, this._then);

  final RecommendedQuestsState _self;
  final $Res Function(RecommendedQuestsState) _then;

  /// Create a copy of RecommendedQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedQuests = null,
    Object? categories = null,
    Object? selectedCategory = freezed,
    Object? isLoading = null,
    Object? isSelectingQuest = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      recommendedQuests: null == recommendedQuests
          ? _self.recommendedQuests
          : recommendedQuests // ignore: cast_nullable_to_non_nullable
              as List<Quest>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as QuestCategory?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelectingQuest: null == isSelectingQuest
          ? _self.isSelectingQuest
          : isSelectingQuest // ignore: cast_nullable_to_non_nullable
              as bool,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RecommendedQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestCategoryCopyWith<$Res>? get selectedCategory {
    if (_self.selectedCategory == null) {
      return null;
    }

    return $QuestCategoryCopyWith<$Res>(_self.selectedCategory!, (value) {
      return _then(_self.copyWith(selectedCategory: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _RecommendedQuestsState extends RecommendedQuestsState {
  _RecommendedQuestsState(
      {final List<Quest> recommendedQuests = const [],
      final List<QuestCategory> categories = const [],
      this.selectedCategory,
      this.isLoading = false,
      this.isSelectingQuest = false,
      this.successMessage,
      this.errorMessage})
      : _recommendedQuests = recommendedQuests,
        _categories = categories,
        super._();
  factory _RecommendedQuestsState.fromJson(Map<String, dynamic> json) =>
      _$RecommendedQuestsStateFromJson(json);

  final List<Quest> _recommendedQuests;
  @override
  @JsonKey()
  List<Quest> get recommendedQuests {
    if (_recommendedQuests is EqualUnmodifiableListView)
      return _recommendedQuests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedQuests);
  }

  final List<QuestCategory> _categories;
  @override
  @JsonKey()
  List<QuestCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final QuestCategory? selectedCategory;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSelectingQuest;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  /// Create a copy of RecommendedQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecommendedQuestsStateCopyWith<_RecommendedQuestsState> get copyWith =>
      __$RecommendedQuestsStateCopyWithImpl<_RecommendedQuestsState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecommendedQuestsStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecommendedQuestsState &&
            const DeepCollectionEquality()
                .equals(other._recommendedQuests, _recommendedQuests) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSelectingQuest, isSelectingQuest) ||
                other.isSelectingQuest == isSelectingQuest) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recommendedQuests),
      const DeepCollectionEquality().hash(_categories),
      selectedCategory,
      isLoading,
      isSelectingQuest,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'RecommendedQuestsState(recommendedQuests: $recommendedQuests, categories: $categories, selectedCategory: $selectedCategory, isLoading: $isLoading, isSelectingQuest: $isSelectingQuest, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$RecommendedQuestsStateCopyWith<$Res>
    implements $RecommendedQuestsStateCopyWith<$Res> {
  factory _$RecommendedQuestsStateCopyWith(_RecommendedQuestsState value,
          $Res Function(_RecommendedQuestsState) _then) =
      __$RecommendedQuestsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Quest> recommendedQuests,
      List<QuestCategory> categories,
      QuestCategory? selectedCategory,
      bool isLoading,
      bool isSelectingQuest,
      String? successMessage,
      String? errorMessage});

  @override
  $QuestCategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class __$RecommendedQuestsStateCopyWithImpl<$Res>
    implements _$RecommendedQuestsStateCopyWith<$Res> {
  __$RecommendedQuestsStateCopyWithImpl(this._self, this._then);

  final _RecommendedQuestsState _self;
  final $Res Function(_RecommendedQuestsState) _then;

  /// Create a copy of RecommendedQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recommendedQuests = null,
    Object? categories = null,
    Object? selectedCategory = freezed,
    Object? isLoading = null,
    Object? isSelectingQuest = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_RecommendedQuestsState(
      recommendedQuests: null == recommendedQuests
          ? _self._recommendedQuests
          : recommendedQuests // ignore: cast_nullable_to_non_nullable
              as List<Quest>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as QuestCategory?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelectingQuest: null == isSelectingQuest
          ? _self.isSelectingQuest
          : isSelectingQuest // ignore: cast_nullable_to_non_nullable
              as bool,
      successMessage: freezed == successMessage
          ? _self.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RecommendedQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestCategoryCopyWith<$Res>? get selectedCategory {
    if (_self.selectedCategory == null) {
      return null;
    }

    return $QuestCategoryCopyWith<$Res>(_self.selectedCategory!, (value) {
      return _then(_self.copyWith(selectedCategory: value));
    });
  }
}

// dart format on

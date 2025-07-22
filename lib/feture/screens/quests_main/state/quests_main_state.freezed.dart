// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quests_main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestsMainState {
  List<Quest> get recommendedQuests;
  List<UserQuestInfo> get activeQuests;
  QuestCategory? get selectedCategory;
  bool get isLoading;
  bool get isRefreshing;
  bool get isSelectingQuest;
  bool get isLoadingActiveQuests;
  String? get successMessage;
  String? get errorMessage;

  /// Create a copy of QuestsMainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestsMainStateCopyWith<QuestsMainState> get copyWith =>
      _$QuestsMainStateCopyWithImpl<QuestsMainState>(
          this as QuestsMainState, _$identity);

  /// Serializes this QuestsMainState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestsMainState &&
            const DeepCollectionEquality()
                .equals(other.recommendedQuests, recommendedQuests) &&
            const DeepCollectionEquality()
                .equals(other.activeQuests, activeQuests) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.isSelectingQuest, isSelectingQuest) ||
                other.isSelectingQuest == isSelectingQuest) &&
            (identical(other.isLoadingActiveQuests, isLoadingActiveQuests) ||
                other.isLoadingActiveQuests == isLoadingActiveQuests) &&
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
      const DeepCollectionEquality().hash(activeQuests),
      selectedCategory,
      isLoading,
      isRefreshing,
      isSelectingQuest,
      isLoadingActiveQuests,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'QuestsMainState(recommendedQuests: $recommendedQuests, activeQuests: $activeQuests, selectedCategory: $selectedCategory, isLoading: $isLoading, isRefreshing: $isRefreshing, isSelectingQuest: $isSelectingQuest, isLoadingActiveQuests: $isLoadingActiveQuests, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $QuestsMainStateCopyWith<$Res> {
  factory $QuestsMainStateCopyWith(
          QuestsMainState value, $Res Function(QuestsMainState) _then) =
      _$QuestsMainStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Quest> recommendedQuests,
      List<UserQuestInfo> activeQuests,
      QuestCategory? selectedCategory,
      bool isLoading,
      bool isRefreshing,
      bool isSelectingQuest,
      bool isLoadingActiveQuests,
      String? successMessage,
      String? errorMessage});

  $QuestCategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class _$QuestsMainStateCopyWithImpl<$Res>
    implements $QuestsMainStateCopyWith<$Res> {
  _$QuestsMainStateCopyWithImpl(this._self, this._then);

  final QuestsMainState _self;
  final $Res Function(QuestsMainState) _then;

  /// Create a copy of QuestsMainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedQuests = null,
    Object? activeQuests = null,
    Object? selectedCategory = freezed,
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? isSelectingQuest = null,
    Object? isLoadingActiveQuests = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      recommendedQuests: null == recommendedQuests
          ? _self.recommendedQuests
          : recommendedQuests // ignore: cast_nullable_to_non_nullable
              as List<Quest>,
      activeQuests: null == activeQuests
          ? _self.activeQuests
          : activeQuests // ignore: cast_nullable_to_non_nullable
              as List<UserQuestInfo>,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as QuestCategory?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _self.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelectingQuest: null == isSelectingQuest
          ? _self.isSelectingQuest
          : isSelectingQuest // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingActiveQuests: null == isLoadingActiveQuests
          ? _self.isLoadingActiveQuests
          : isLoadingActiveQuests // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of QuestsMainState
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
class _QuestsMainState extends QuestsMainState {
  _QuestsMainState(
      {final List<Quest> recommendedQuests = const [],
      final List<UserQuestInfo> activeQuests = const [],
      this.selectedCategory,
      this.isLoading = false,
      this.isRefreshing = false,
      this.isSelectingQuest = false,
      this.isLoadingActiveQuests = false,
      this.successMessage,
      this.errorMessage})
      : _recommendedQuests = recommendedQuests,
        _activeQuests = activeQuests,
        super._();
  factory _QuestsMainState.fromJson(Map<String, dynamic> json) =>
      _$QuestsMainStateFromJson(json);

  final List<Quest> _recommendedQuests;
  @override
  @JsonKey()
  List<Quest> get recommendedQuests {
    if (_recommendedQuests is EqualUnmodifiableListView)
      return _recommendedQuests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedQuests);
  }

  final List<UserQuestInfo> _activeQuests;
  @override
  @JsonKey()
  List<UserQuestInfo> get activeQuests {
    if (_activeQuests is EqualUnmodifiableListView) return _activeQuests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeQuests);
  }

  @override
  final QuestCategory? selectedCategory;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  @JsonKey()
  final bool isSelectingQuest;
  @override
  @JsonKey()
  final bool isLoadingActiveQuests;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  /// Create a copy of QuestsMainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestsMainStateCopyWith<_QuestsMainState> get copyWith =>
      __$QuestsMainStateCopyWithImpl<_QuestsMainState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestsMainStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestsMainState &&
            const DeepCollectionEquality()
                .equals(other._recommendedQuests, _recommendedQuests) &&
            const DeepCollectionEquality()
                .equals(other._activeQuests, _activeQuests) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.isSelectingQuest, isSelectingQuest) ||
                other.isSelectingQuest == isSelectingQuest) &&
            (identical(other.isLoadingActiveQuests, isLoadingActiveQuests) ||
                other.isLoadingActiveQuests == isLoadingActiveQuests) &&
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
      const DeepCollectionEquality().hash(_activeQuests),
      selectedCategory,
      isLoading,
      isRefreshing,
      isSelectingQuest,
      isLoadingActiveQuests,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'QuestsMainState(recommendedQuests: $recommendedQuests, activeQuests: $activeQuests, selectedCategory: $selectedCategory, isLoading: $isLoading, isRefreshing: $isRefreshing, isSelectingQuest: $isSelectingQuest, isLoadingActiveQuests: $isLoadingActiveQuests, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$QuestsMainStateCopyWith<$Res>
    implements $QuestsMainStateCopyWith<$Res> {
  factory _$QuestsMainStateCopyWith(
          _QuestsMainState value, $Res Function(_QuestsMainState) _then) =
      __$QuestsMainStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Quest> recommendedQuests,
      List<UserQuestInfo> activeQuests,
      QuestCategory? selectedCategory,
      bool isLoading,
      bool isRefreshing,
      bool isSelectingQuest,
      bool isLoadingActiveQuests,
      String? successMessage,
      String? errorMessage});

  @override
  $QuestCategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class __$QuestsMainStateCopyWithImpl<$Res>
    implements _$QuestsMainStateCopyWith<$Res> {
  __$QuestsMainStateCopyWithImpl(this._self, this._then);

  final _QuestsMainState _self;
  final $Res Function(_QuestsMainState) _then;

  /// Create a copy of QuestsMainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recommendedQuests = null,
    Object? activeQuests = null,
    Object? selectedCategory = freezed,
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? isSelectingQuest = null,
    Object? isLoadingActiveQuests = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_QuestsMainState(
      recommendedQuests: null == recommendedQuests
          ? _self._recommendedQuests
          : recommendedQuests // ignore: cast_nullable_to_non_nullable
              as List<Quest>,
      activeQuests: null == activeQuests
          ? _self._activeQuests
          : activeQuests // ignore: cast_nullable_to_non_nullable
              as List<UserQuestInfo>,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as QuestCategory?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _self.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelectingQuest: null == isSelectingQuest
          ? _self.isSelectingQuest
          : isSelectingQuest // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingActiveQuests: null == isLoadingActiveQuests
          ? _self.isLoadingActiveQuests
          : isLoadingActiveQuests // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of QuestsMainState
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

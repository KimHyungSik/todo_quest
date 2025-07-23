// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestDetailState {
  UserQuestInfo? get currentQuest;
  List<UserQuestInfo> get completionHistory;
  int get totalCompletions;
  bool get isLoading;
  bool get isUpdatingStatus;
  bool get isLoadingHistory;
  String? get successMessage;
  String? get errorMessage;

  /// Create a copy of QuestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestDetailStateCopyWith<QuestDetailState> get copyWith =>
      _$QuestDetailStateCopyWithImpl<QuestDetailState>(
          this as QuestDetailState, _$identity);

  /// Serializes this QuestDetailState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestDetailState &&
            (identical(other.currentQuest, currentQuest) ||
                other.currentQuest == currentQuest) &&
            const DeepCollectionEquality()
                .equals(other.completionHistory, completionHistory) &&
            (identical(other.totalCompletions, totalCompletions) ||
                other.totalCompletions == totalCompletions) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdatingStatus, isUpdatingStatus) ||
                other.isUpdatingStatus == isUpdatingStatus) &&
            (identical(other.isLoadingHistory, isLoadingHistory) ||
                other.isLoadingHistory == isLoadingHistory) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentQuest,
      const DeepCollectionEquality().hash(completionHistory),
      totalCompletions,
      isLoading,
      isUpdatingStatus,
      isLoadingHistory,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'QuestDetailState(currentQuest: $currentQuest, completionHistory: $completionHistory, totalCompletions: $totalCompletions, isLoading: $isLoading, isUpdatingStatus: $isUpdatingStatus, isLoadingHistory: $isLoadingHistory, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $QuestDetailStateCopyWith<$Res> {
  factory $QuestDetailStateCopyWith(
          QuestDetailState value, $Res Function(QuestDetailState) _then) =
      _$QuestDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {UserQuestInfo? currentQuest,
      List<UserQuestInfo> completionHistory,
      int totalCompletions,
      bool isLoading,
      bool isUpdatingStatus,
      bool isLoadingHistory,
      String? successMessage,
      String? errorMessage});

  $UserQuestInfoCopyWith<$Res>? get currentQuest;
}

/// @nodoc
class _$QuestDetailStateCopyWithImpl<$Res>
    implements $QuestDetailStateCopyWith<$Res> {
  _$QuestDetailStateCopyWithImpl(this._self, this._then);

  final QuestDetailState _self;
  final $Res Function(QuestDetailState) _then;

  /// Create a copy of QuestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuest = freezed,
    Object? completionHistory = null,
    Object? totalCompletions = null,
    Object? isLoading = null,
    Object? isUpdatingStatus = null,
    Object? isLoadingHistory = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      currentQuest: freezed == currentQuest
          ? _self.currentQuest
          : currentQuest // ignore: cast_nullable_to_non_nullable
              as UserQuestInfo?,
      completionHistory: null == completionHistory
          ? _self.completionHistory
          : completionHistory // ignore: cast_nullable_to_non_nullable
              as List<UserQuestInfo>,
      totalCompletions: null == totalCompletions
          ? _self.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _self.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingHistory: null == isLoadingHistory
          ? _self.isLoadingHistory
          : isLoadingHistory // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of QuestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserQuestInfoCopyWith<$Res>? get currentQuest {
    if (_self.currentQuest == null) {
      return null;
    }

    return $UserQuestInfoCopyWith<$Res>(_self.currentQuest!, (value) {
      return _then(_self.copyWith(currentQuest: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _QuestDetailState extends QuestDetailState {
  _QuestDetailState(
      {this.currentQuest,
      final List<UserQuestInfo> completionHistory = const [],
      this.totalCompletions = 0,
      this.isLoading = false,
      this.isUpdatingStatus = false,
      this.isLoadingHistory = false,
      this.successMessage,
      this.errorMessage})
      : _completionHistory = completionHistory,
        super._();
  factory _QuestDetailState.fromJson(Map<String, dynamic> json) =>
      _$QuestDetailStateFromJson(json);

  @override
  final UserQuestInfo? currentQuest;
  final List<UserQuestInfo> _completionHistory;
  @override
  @JsonKey()
  List<UserQuestInfo> get completionHistory {
    if (_completionHistory is EqualUnmodifiableListView)
      return _completionHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completionHistory);
  }

  @override
  @JsonKey()
  final int totalCompletions;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdatingStatus;
  @override
  @JsonKey()
  final bool isLoadingHistory;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  /// Create a copy of QuestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestDetailStateCopyWith<_QuestDetailState> get copyWith =>
      __$QuestDetailStateCopyWithImpl<_QuestDetailState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestDetailStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestDetailState &&
            (identical(other.currentQuest, currentQuest) ||
                other.currentQuest == currentQuest) &&
            const DeepCollectionEquality()
                .equals(other._completionHistory, _completionHistory) &&
            (identical(other.totalCompletions, totalCompletions) ||
                other.totalCompletions == totalCompletions) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdatingStatus, isUpdatingStatus) ||
                other.isUpdatingStatus == isUpdatingStatus) &&
            (identical(other.isLoadingHistory, isLoadingHistory) ||
                other.isLoadingHistory == isLoadingHistory) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentQuest,
      const DeepCollectionEquality().hash(_completionHistory),
      totalCompletions,
      isLoading,
      isUpdatingStatus,
      isLoadingHistory,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'QuestDetailState(currentQuest: $currentQuest, completionHistory: $completionHistory, totalCompletions: $totalCompletions, isLoading: $isLoading, isUpdatingStatus: $isUpdatingStatus, isLoadingHistory: $isLoadingHistory, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$QuestDetailStateCopyWith<$Res>
    implements $QuestDetailStateCopyWith<$Res> {
  factory _$QuestDetailStateCopyWith(
          _QuestDetailState value, $Res Function(_QuestDetailState) _then) =
      __$QuestDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserQuestInfo? currentQuest,
      List<UserQuestInfo> completionHistory,
      int totalCompletions,
      bool isLoading,
      bool isUpdatingStatus,
      bool isLoadingHistory,
      String? successMessage,
      String? errorMessage});

  @override
  $UserQuestInfoCopyWith<$Res>? get currentQuest;
}

/// @nodoc
class __$QuestDetailStateCopyWithImpl<$Res>
    implements _$QuestDetailStateCopyWith<$Res> {
  __$QuestDetailStateCopyWithImpl(this._self, this._then);

  final _QuestDetailState _self;
  final $Res Function(_QuestDetailState) _then;

  /// Create a copy of QuestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentQuest = freezed,
    Object? completionHistory = null,
    Object? totalCompletions = null,
    Object? isLoading = null,
    Object? isUpdatingStatus = null,
    Object? isLoadingHistory = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_QuestDetailState(
      currentQuest: freezed == currentQuest
          ? _self.currentQuest
          : currentQuest // ignore: cast_nullable_to_non_nullable
              as UserQuestInfo?,
      completionHistory: null == completionHistory
          ? _self._completionHistory
          : completionHistory // ignore: cast_nullable_to_non_nullable
              as List<UserQuestInfo>,
      totalCompletions: null == totalCompletions
          ? _self.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _self.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingHistory: null == isLoadingHistory
          ? _self.isLoadingHistory
          : isLoadingHistory // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of QuestDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserQuestInfoCopyWith<$Res>? get currentQuest {
    if (_self.currentQuest == null) {
      return null;
    }

    return $UserQuestInfoCopyWith<$Res>(_self.currentQuest!, (value) {
      return _then(_self.copyWith(currentQuest: value));
    });
  }
}

// dart format on

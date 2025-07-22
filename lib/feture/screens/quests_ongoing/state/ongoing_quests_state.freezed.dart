// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ongoing_quests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OngoingQuestsState {
  List<UserQuestInfo> get activeQuests;
  bool get isLoading;
  String? get successMessage;
  String? get errorMessage;

  /// Create a copy of OngoingQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OngoingQuestsStateCopyWith<OngoingQuestsState> get copyWith =>
      _$OngoingQuestsStateCopyWithImpl<OngoingQuestsState>(
          this as OngoingQuestsState, _$identity);

  /// Serializes this OngoingQuestsState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OngoingQuestsState &&
            const DeepCollectionEquality()
                .equals(other.activeQuests, activeQuests) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activeQuests),
      isLoading,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'OngoingQuestsState(activeQuests: $activeQuests, isLoading: $isLoading, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $OngoingQuestsStateCopyWith<$Res> {
  factory $OngoingQuestsStateCopyWith(
          OngoingQuestsState value, $Res Function(OngoingQuestsState) _then) =
      _$OngoingQuestsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<UserQuestInfo> activeQuests,
      bool isLoading,
      String? successMessage,
      String? errorMessage});
}

/// @nodoc
class _$OngoingQuestsStateCopyWithImpl<$Res>
    implements $OngoingQuestsStateCopyWith<$Res> {
  _$OngoingQuestsStateCopyWithImpl(this._self, this._then);

  final OngoingQuestsState _self;
  final $Res Function(OngoingQuestsState) _then;

  /// Create a copy of OngoingQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeQuests = null,
    Object? isLoading = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      activeQuests: null == activeQuests
          ? _self.activeQuests
          : activeQuests // ignore: cast_nullable_to_non_nullable
              as List<UserQuestInfo>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
@JsonSerializable()
class _OngoingQuestsState extends OngoingQuestsState {
  _OngoingQuestsState(
      {final List<UserQuestInfo> activeQuests = const [],
      this.isLoading = false,
      this.successMessage,
      this.errorMessage})
      : _activeQuests = activeQuests,
        super._();
  factory _OngoingQuestsState.fromJson(Map<String, dynamic> json) =>
      _$OngoingQuestsStateFromJson(json);

  final List<UserQuestInfo> _activeQuests;
  @override
  @JsonKey()
  List<UserQuestInfo> get activeQuests {
    if (_activeQuests is EqualUnmodifiableListView) return _activeQuests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeQuests);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  /// Create a copy of OngoingQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OngoingQuestsStateCopyWith<_OngoingQuestsState> get copyWith =>
      __$OngoingQuestsStateCopyWithImpl<_OngoingQuestsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OngoingQuestsStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OngoingQuestsState &&
            const DeepCollectionEquality()
                .equals(other._activeQuests, _activeQuests) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeQuests),
      isLoading,
      successMessage,
      errorMessage);

  @override
  String toString() {
    return 'OngoingQuestsState(activeQuests: $activeQuests, isLoading: $isLoading, successMessage: $successMessage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$OngoingQuestsStateCopyWith<$Res>
    implements $OngoingQuestsStateCopyWith<$Res> {
  factory _$OngoingQuestsStateCopyWith(
          _OngoingQuestsState value, $Res Function(_OngoingQuestsState) _then) =
      __$OngoingQuestsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<UserQuestInfo> activeQuests,
      bool isLoading,
      String? successMessage,
      String? errorMessage});
}

/// @nodoc
class __$OngoingQuestsStateCopyWithImpl<$Res>
    implements _$OngoingQuestsStateCopyWith<$Res> {
  __$OngoingQuestsStateCopyWithImpl(this._self, this._then);

  final _OngoingQuestsState _self;
  final $Res Function(_OngoingQuestsState) _then;

  /// Create a copy of OngoingQuestsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeQuests = null,
    Object? isLoading = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_OngoingQuestsState(
      activeQuests: null == activeQuests
          ? _self._activeQuests
          : activeQuests // ignore: cast_nullable_to_non_nullable
              as List<UserQuestInfo>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
}

// dart format on

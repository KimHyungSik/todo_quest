// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileState {
  UserInfo? get userInfo;
  List<QuestCategory> get allCategories;
  List<QuestCategory> get selectedCategories;
  bool get isLoading;
  bool get isSaving;
  String? get errorMessage;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      _$ProfileStateCopyWithImpl<ProfileState>(
          this as ProfileState, _$identity);

  /// Serializes this ProfileState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileState &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            const DeepCollectionEquality()
                .equals(other.allCategories, allCategories) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategories, selectedCategories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userInfo,
      const DeepCollectionEquality().hash(allCategories),
      const DeepCollectionEquality().hash(selectedCategories),
      isLoading,
      isSaving,
      errorMessage);

  @override
  String toString() {
    return 'ProfileState(userInfo: $userInfo, allCategories: $allCategories, selectedCategories: $selectedCategories, isLoading: $isLoading, isSaving: $isSaving, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) _then) =
      _$ProfileStateCopyWithImpl;
  @useResult
  $Res call(
      {UserInfo? userInfo,
      List<QuestCategory> allCategories,
      List<QuestCategory> selectedCategories,
      bool isLoading,
      bool isSaving,
      String? errorMessage});

  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = freezed,
    Object? allCategories = null,
    Object? selectedCategories = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      userInfo: freezed == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      allCategories: null == allCategories
          ? _self.allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      selectedCategories: null == selectedCategories
          ? _self.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_self.userInfo!, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileState extends ProfileState {
  _ProfileState(
      {this.userInfo,
      final List<QuestCategory> allCategories = const [],
      final List<QuestCategory> selectedCategories = const [],
      this.isLoading = false,
      this.isSaving = false,
      this.errorMessage})
      : _allCategories = allCategories,
        _selectedCategories = selectedCategories,
        super._();
  factory _ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);

  @override
  final UserInfo? userInfo;
  final List<QuestCategory> _allCategories;
  @override
  @JsonKey()
  List<QuestCategory> get allCategories {
    if (_allCategories is EqualUnmodifiableListView) return _allCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCategories);
  }

  final List<QuestCategory> _selectedCategories;
  @override
  @JsonKey()
  List<QuestCategory> get selectedCategories {
    if (_selectedCategories is EqualUnmodifiableListView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategories);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final String? errorMessage;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileState &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            const DeepCollectionEquality()
                .equals(other._allCategories, _allCategories) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategories, _selectedCategories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userInfo,
      const DeepCollectionEquality().hash(_allCategories),
      const DeepCollectionEquality().hash(_selectedCategories),
      isLoading,
      isSaving,
      errorMessage);

  @override
  String toString() {
    return 'ProfileState(userInfo: $userInfo, allCategories: $allCategories, selectedCategories: $selectedCategories, isLoading: $isLoading, isSaving: $isSaving, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(
          _ProfileState value, $Res Function(_ProfileState) _then) =
      __$ProfileStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserInfo? userInfo,
      List<QuestCategory> allCategories,
      List<QuestCategory> selectedCategories,
      bool isLoading,
      bool isSaving,
      String? errorMessage});

  @override
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userInfo = freezed,
    Object? allCategories = null,
    Object? selectedCategories = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_ProfileState(
      userInfo: freezed == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      allCategories: null == allCategories
          ? _self._allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      selectedCategories: null == selectedCategories
          ? _self._selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<QuestCategory>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _self.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_self.userInfo!, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTitleInfo {
  @JsonKey(name: 'user_title_id')
  String get userTitleId;
  @JsonKey(name: 'title_id')
  String get titleId;
  @JsonKey(name: 'title_name')
  String get titleName;
  @JsonKey(name: 'title_description')
  String? get titleDescription;
  @JsonKey(name: 'acquired_at')
  DateTime? get acquiredAt;

  /// Create a copy of UserTitleInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserTitleInfoCopyWith<UserTitleInfo> get copyWith =>
      _$UserTitleInfoCopyWithImpl<UserTitleInfo>(
          this as UserTitleInfo, _$identity);

  /// Serializes this UserTitleInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserTitleInfo &&
            (identical(other.userTitleId, userTitleId) ||
                other.userTitleId == userTitleId) &&
            (identical(other.titleId, titleId) || other.titleId == titleId) &&
            (identical(other.titleName, titleName) ||
                other.titleName == titleName) &&
            (identical(other.titleDescription, titleDescription) ||
                other.titleDescription == titleDescription) &&
            (identical(other.acquiredAt, acquiredAt) ||
                other.acquiredAt == acquiredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userTitleId, titleId, titleName,
      titleDescription, acquiredAt);

  @override
  String toString() {
    return 'UserTitleInfo(userTitleId: $userTitleId, titleId: $titleId, titleName: $titleName, titleDescription: $titleDescription, acquiredAt: $acquiredAt)';
  }
}

/// @nodoc
abstract mixin class $UserTitleInfoCopyWith<$Res> {
  factory $UserTitleInfoCopyWith(
          UserTitleInfo value, $Res Function(UserTitleInfo) _then) =
      _$UserTitleInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_title_id') String userTitleId,
      @JsonKey(name: 'title_id') String titleId,
      @JsonKey(name: 'title_name') String titleName,
      @JsonKey(name: 'title_description') String? titleDescription,
      @JsonKey(name: 'acquired_at') DateTime? acquiredAt});
}

/// @nodoc
class _$UserTitleInfoCopyWithImpl<$Res>
    implements $UserTitleInfoCopyWith<$Res> {
  _$UserTitleInfoCopyWithImpl(this._self, this._then);

  final UserTitleInfo _self;
  final $Res Function(UserTitleInfo) _then;

  /// Create a copy of UserTitleInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTitleId = null,
    Object? titleId = null,
    Object? titleName = null,
    Object? titleDescription = freezed,
    Object? acquiredAt = freezed,
  }) {
    return _then(_self.copyWith(
      userTitleId: null == userTitleId
          ? _self.userTitleId
          : userTitleId // ignore: cast_nullable_to_non_nullable
              as String,
      titleId: null == titleId
          ? _self.titleId
          : titleId // ignore: cast_nullable_to_non_nullable
              as String,
      titleName: null == titleName
          ? _self.titleName
          : titleName // ignore: cast_nullable_to_non_nullable
              as String,
      titleDescription: freezed == titleDescription
          ? _self.titleDescription
          : titleDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      acquiredAt: freezed == acquiredAt
          ? _self.acquiredAt
          : acquiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserTitleInfo extends UserTitleInfo {
  _UserTitleInfo(
      {@JsonKey(name: 'user_title_id') required this.userTitleId,
      @JsonKey(name: 'title_id') required this.titleId,
      @JsonKey(name: 'title_name') required this.titleName,
      @JsonKey(name: 'title_description') this.titleDescription,
      @JsonKey(name: 'acquired_at') this.acquiredAt})
      : super._();
  factory _UserTitleInfo.fromJson(Map<String, dynamic> json) =>
      _$UserTitleInfoFromJson(json);

  @override
  @JsonKey(name: 'user_title_id')
  final String userTitleId;
  @override
  @JsonKey(name: 'title_id')
  final String titleId;
  @override
  @JsonKey(name: 'title_name')
  final String titleName;
  @override
  @JsonKey(name: 'title_description')
  final String? titleDescription;
  @override
  @JsonKey(name: 'acquired_at')
  final DateTime? acquiredAt;

  /// Create a copy of UserTitleInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserTitleInfoCopyWith<_UserTitleInfo> get copyWith =>
      __$UserTitleInfoCopyWithImpl<_UserTitleInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserTitleInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserTitleInfo &&
            (identical(other.userTitleId, userTitleId) ||
                other.userTitleId == userTitleId) &&
            (identical(other.titleId, titleId) || other.titleId == titleId) &&
            (identical(other.titleName, titleName) ||
                other.titleName == titleName) &&
            (identical(other.titleDescription, titleDescription) ||
                other.titleDescription == titleDescription) &&
            (identical(other.acquiredAt, acquiredAt) ||
                other.acquiredAt == acquiredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userTitleId, titleId, titleName,
      titleDescription, acquiredAt);

  @override
  String toString() {
    return 'UserTitleInfo(userTitleId: $userTitleId, titleId: $titleId, titleName: $titleName, titleDescription: $titleDescription, acquiredAt: $acquiredAt)';
  }
}

/// @nodoc
abstract mixin class _$UserTitleInfoCopyWith<$Res>
    implements $UserTitleInfoCopyWith<$Res> {
  factory _$UserTitleInfoCopyWith(
          _UserTitleInfo value, $Res Function(_UserTitleInfo) _then) =
      __$UserTitleInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_title_id') String userTitleId,
      @JsonKey(name: 'title_id') String titleId,
      @JsonKey(name: 'title_name') String titleName,
      @JsonKey(name: 'title_description') String? titleDescription,
      @JsonKey(name: 'acquired_at') DateTime? acquiredAt});
}

/// @nodoc
class __$UserTitleInfoCopyWithImpl<$Res>
    implements _$UserTitleInfoCopyWith<$Res> {
  __$UserTitleInfoCopyWithImpl(this._self, this._then);

  final _UserTitleInfo _self;
  final $Res Function(_UserTitleInfo) _then;

  /// Create a copy of UserTitleInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userTitleId = null,
    Object? titleId = null,
    Object? titleName = null,
    Object? titleDescription = freezed,
    Object? acquiredAt = freezed,
  }) {
    return _then(_UserTitleInfo(
      userTitleId: null == userTitleId
          ? _self.userTitleId
          : userTitleId // ignore: cast_nullable_to_non_nullable
              as String,
      titleId: null == titleId
          ? _self.titleId
          : titleId // ignore: cast_nullable_to_non_nullable
              as String,
      titleName: null == titleName
          ? _self.titleName
          : titleName // ignore: cast_nullable_to_non_nullable
              as String,
      titleDescription: freezed == titleDescription
          ? _self.titleDescription
          : titleDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      acquiredAt: freezed == acquiredAt
          ? _self.acquiredAt
          : acquiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on

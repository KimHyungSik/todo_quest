// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RewardTitle {
  int get id;
  String get name;
  String get description;

  /// Create a copy of RewardTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RewardTitleCopyWith<RewardTitle> get copyWith =>
      _$RewardTitleCopyWithImpl<RewardTitle>(this as RewardTitle, _$identity);

  /// Serializes this RewardTitle to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RewardTitle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @override
  String toString() {
    return 'RewardTitle(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class $RewardTitleCopyWith<$Res> {
  factory $RewardTitleCopyWith(
          RewardTitle value, $Res Function(RewardTitle) _then) =
      _$RewardTitleCopyWithImpl;
  @useResult
  $Res call({int id, String name, String description});
}

/// @nodoc
class _$RewardTitleCopyWithImpl<$Res> implements $RewardTitleCopyWith<$Res> {
  _$RewardTitleCopyWithImpl(this._self, this._then);

  final RewardTitle _self;
  final $Res Function(RewardTitle) _then;

  /// Create a copy of RewardTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RewardTitle extends RewardTitle {
  const _RewardTitle(
      {required this.id, required this.name, required this.description})
      : super._();
  factory _RewardTitle.fromJson(Map<String, dynamic> json) =>
      _$RewardTitleFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;

  /// Create a copy of RewardTitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RewardTitleCopyWith<_RewardTitle> get copyWith =>
      __$RewardTitleCopyWithImpl<_RewardTitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RewardTitleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RewardTitle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @override
  String toString() {
    return 'RewardTitle(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$RewardTitleCopyWith<$Res>
    implements $RewardTitleCopyWith<$Res> {
  factory _$RewardTitleCopyWith(
          _RewardTitle value, $Res Function(_RewardTitle) _then) =
      __$RewardTitleCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String description});
}

/// @nodoc
class __$RewardTitleCopyWithImpl<$Res> implements _$RewardTitleCopyWith<$Res> {
  __$RewardTitleCopyWithImpl(this._self, this._then);

  final _RewardTitle _self;
  final $Res Function(_RewardTitle) _then;

  /// Create a copy of RewardTitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_RewardTitle(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

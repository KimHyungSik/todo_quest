// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestCategory {
  int get id;
  String get name;
  String? get description;

  /// Create a copy of QuestCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestCategoryCopyWith<QuestCategory> get copyWith =>
      _$QuestCategoryCopyWithImpl<QuestCategory>(
          this as QuestCategory, _$identity);

  /// Serializes this QuestCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestCategory &&
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
    return 'QuestCategory(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class $QuestCategoryCopyWith<$Res> {
  factory $QuestCategoryCopyWith(
          QuestCategory value, $Res Function(QuestCategory) _then) =
      _$QuestCategoryCopyWithImpl;
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class _$QuestCategoryCopyWithImpl<$Res>
    implements $QuestCategoryCopyWith<$Res> {
  _$QuestCategoryCopyWithImpl(this._self, this._then);

  final QuestCategory _self;
  final $Res Function(QuestCategory) _then;

  /// Create a copy of QuestCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
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
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuestCategory extends QuestCategory {
  const _QuestCategory({required this.id, required this.name, this.description})
      : super._();
  factory _QuestCategory.fromJson(Map<String, dynamic> json) =>
      _$QuestCategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;

  /// Create a copy of QuestCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestCategoryCopyWith<_QuestCategory> get copyWith =>
      __$QuestCategoryCopyWithImpl<_QuestCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestCategory &&
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
    return 'QuestCategory(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$QuestCategoryCopyWith<$Res>
    implements $QuestCategoryCopyWith<$Res> {
  factory _$QuestCategoryCopyWith(
          _QuestCategory value, $Res Function(_QuestCategory) _then) =
      __$QuestCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class __$QuestCategoryCopyWithImpl<$Res>
    implements _$QuestCategoryCopyWith<$Res> {
  __$QuestCategoryCopyWithImpl(this._self, this._then);

  final _QuestCategory _self;
  final $Res Function(_QuestCategory) _then;

  /// Create a copy of QuestCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_QuestCategory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

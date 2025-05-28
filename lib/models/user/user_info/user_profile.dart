import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

// ============================================================================
// User Info Model (get_user_info 함수 결과)
// ============================================================================
@freezed
abstract class UserInfo with _$UserInfo {
  const UserInfo._();

  factory UserInfo({
    required String id,
    required String email,
    String? nickname,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'last_sign_in_at') DateTime? lastSignInAt,
    @JsonKey(name: 'email_confirmed_at') DateTime? emailConfirmedAt,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  // Helper methods
  String get displayName => nickname ?? email.split('@').first;
  bool get isEmailConfirmed => emailConfirmedAt != null;
  bool get hasNickname => nickname != null && nickname!.isNotEmpty;
  bool get hasProfileImage => profileImage != null && profileImage!.isNotEmpty;

  // 가입 후 경과 시간
  Duration? get timeSinceCreated => createdAt != null
      ? DateTime.now().difference(createdAt!)
      : null;

  // 마지막 로그인 후 경과 시간  
  Duration? get timeSinceLastSignIn => lastSignInAt != null
      ? DateTime.now().difference(lastSignInAt!)
      : null;
}

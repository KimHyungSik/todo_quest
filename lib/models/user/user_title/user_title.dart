// ============================================================================
// User Title Model (get_user_titles 함수 결과)
// ============================================================================
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_title.freezed.dart';
part 'user_title.g.dart';

@freezed
abstract class UserTitleInfo with _$UserTitleInfo {
  const UserTitleInfo._();

  factory UserTitleInfo({
    @JsonKey(name: 'user_title_id') required String userTitleId,
    @JsonKey(name: 'title_id') required String titleId,
    @JsonKey(name: 'title_name') required String titleName,
    @JsonKey(name: 'title_description') String? titleDescription,
    @JsonKey(name: 'acquired_at') DateTime? acquiredAt,
  }) = _UserTitleInfo;

  factory UserTitleInfo.fromJson(Map<String, dynamic> json) => _$UserTitleInfoFromJson(json);

  // Helper methods
  Duration? get timeSinceAcquired => acquiredAt != null
      ? DateTime.now().difference(acquiredAt!)
      : null;

  // 최근 획득한 타이틀 여부 (7일 이내)
  bool get isRecentlyAcquired {
    final time = timeSinceAcquired;
    return time != null && time.inDays <= 7;
  }

  // 타이틀 설명이 있는지 확인
  bool get hasDescription => titleDescription != null && titleDescription!.isNotEmpty;

  // 표시용 설명 (없으면 기본 메시지)
  String get displayDescription => titleDescription ?? '특별한 업적을 달성하여 획득한 타이틀입니다.';
}

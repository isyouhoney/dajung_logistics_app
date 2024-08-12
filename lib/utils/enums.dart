import 'package:freezed_annotation/freezed_annotation.dart';

enum Role {
  @JsonValue('MASTER')
  MASTER("마스터", ""),
  @JsonValue('MAIN')
  MAIN("메인", "생산점"),
  @JsonValue('DIRECT')
  DIRECT("직영", "직영점"),
  @JsonValue('SUB')
  SUB("가맹", "가맹점"),
  @JsonValue('DELIVERY')
  DELIVERY("배달", "배송요원");

  final String kor;
  final String view;
  const Role(this.kor, this.view);

  static Role? fromView(String view) {
    for (Role role in Role.values) {
      if (role.view == view) {
        return role;
      }
    }
    return null;
  }

  static Role? fromKor(String kor) {
    for (Role role in Role.values) {
      if (role.kor == kor) {
        return role;
      }
    }
    return null;
  }
}

enum JoinStatus {
  request('가입요청'),
  approved('가입승인'),
  denied('가입거부');

  final String kor;
  const JoinStatus(this.kor);

  static JoinStatus? fromKor(String kor) {
    for (JoinStatus joinStatus in JoinStatus.values) {
      if (joinStatus.kor == kor) {
        return joinStatus;
      }
    }
    return null;
  }
}

enum ItemStatus {
  onSale('판매중'),
  endOfSale('판매종료');

  final String kor;
  const ItemStatus(this.kor);
}

enum OrderStatus {
  ordered('주문완료'),
  delivered('배송완료'),
  deliveryChecked('배송확인');

  final String kor;
  const OrderStatus(this.kor);
}

enum RequestStatus {
  requested('요청중'),
  requestCanceled('요청취소'),
  requestAccepted('요청수락'),
  delivering('배송중'),
  delivered('배송완료');

  final String kor;
  const RequestStatus(this.kor);

  static Role? fromKor(String kor) {
    for (Role role in Role.values) {
      if (role.kor == kor) {
        return role;
      }
    }
    return null;
  }
}

enum RequestedBy {
  byMe('내가한요청'),
  byOthers('타지점요청');

  final String kor;
  const RequestedBy(this.kor);
}

enum DayOfWeek {
  mon('월'),
  tue('화'),
  wed('수'),
  tur('목'),
  fri('금'),
  sat('토'),
  sun('일');

  final String kor;
  const DayOfWeek(this.kor);

  static DayOfWeek? fromKor(String kor) {
    for (DayOfWeek dayOfWeek in DayOfWeek.values) {
      if (dayOfWeek.kor == kor) {
        return dayOfWeek;
      }
    }
    return null;
  }
}

enum DeliveryStatus{
  all('전체'),
  delivering('주문완료'),
  complete('배송완료'),
  checked('배송확인');

  final String kor;
  const DeliveryStatus(this.kor);

  static DeliveryStatus? fromKor(String kor) {
    for (DeliveryStatus status in DeliveryStatus.values) {
      if (status.kor == kor) {
        return status;
      }
    }
    return null;
  }
}
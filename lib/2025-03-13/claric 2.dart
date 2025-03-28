import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  //이름은 필수, 나머지는 설정 가능
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp})


  //mp를 5 소비 후 자신의 HP를 최대 HP 까지 회복 가능
  void selfAid() {
    //mp가 5 이상인지 확인
    if (mp >= 5) {
      //mp 5 사용
      mp = mp - 5;
      // hp 를 최대로 회복
      hp = maxHp;

      print('셀프 에이드를 사용했습니다.');
    } else {
      print('mp가 부족합니다.');
    }
  }

  //자신의 MP를 회복 (3초미만 0~2MP,3초이상 3~5MP 회복), seconds = 기도 시간
  int pray(int seconds) {
    //기도 전 mp 저장
    int beforeMP = mp;

    //랜덤 객체 생성
    Random random = Random();

    //회복량 계산
    int recovery;
    if (seconds < 3) {
      //3초 미만 기도 : 0~2 회복
      recovery = random.nextInt(3); //0, 1, 2 중 하나
    } else {
      // 3초 이상 기도: 3~5 회복
      recovery = 3 + random.nextInt(3); // 3, 4, 5 중 하나
    }

    //MP 회복 최대값
    if (mp + recovery > maxMp) {
      mp = maxMp;
    } else {
      mp = mp + recovery;
    }
    //실제 회복된 양 계산
    int actualRecovery = mp - beforeMP;
    return actualRecovery;
  }
}
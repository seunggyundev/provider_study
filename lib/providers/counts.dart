import 'package:flutter/material.dart';

//Provider는 크게 생성 부분과 소비 부분으로 나누어 생각하면 된다.
// 생성 부분에서는 사용할 데이터 타입을 결정하고 해당 데이터에 대한 Provider를 만들고,
// 소비 부분에서는 Provider를 통해 데이터를 불러오거나 수정하는 등의 작업을 진행한다.

//Provider에는 watch, read, select 기능을 제공하고 있습니다.
//
// read: 해당 위젯은 상태값을 읽습니다. 하지만 변경을 감시하지 않습니다.
// watch: 해당 위젯이 상태값의 변경을 감시합니다.
// select: 해당 위젯은 상태값의 특정 부분만을 감시합니다.
// 보통 Provider의 값을 변경하기 위한 함수는 read를 통해 접근하며, 상태값을 사용할 때에는 watch를 사용합니다.
// 변경된 상태값을 표시하기 위해 re-build가 발생하는데, 이 re-build는 많은 비용을 사용합니다.
// 따라서, select를 통해 특정 값의 변경만을 감시하여 re-build를 최적화 할 수 있습니다.


//Provider를 사용하기 위해서는 ChangeNotifier를 사용해서 클래스를 생성해야 함
class Counts with ChangeNotifier {
  //앱 내에서 공유할 상태 변수를 선언, 해당 변수를 외부에서 접근할 수 있도록 getter도 생성
  int _count = 0;
  int get count => _count;

  //그런 다음, 해당 상태 변수를 변경하는 함수를 생성
  //중요한 점은 변수를 수정하였다면, notifyListeners()를 실행하여, 데이터가 갱신되었음을 통보함
  //마치 Stateful Widget에서 값이 변경되었음을 알리기 위해 setState 함수를 사용하는 것과 동일한 원리
  //notifyListeners 함수를 실행하지 않으면, 다른 위젯들에서 해당 값이 변경되었는지 인식하지 못함
  // 여기서는 값을 증가시키는 add함수와 값을 감소시키는 remove 함수를 생성함
  void add() {
    _count++;
    notifyListeners();
  }

  void remove() {
    _count--;
    notifyListeners();
  }

  //이것으로 Provider를 사용하여 앱 전체에서 사용될 전역 상태를 생성하였음
}
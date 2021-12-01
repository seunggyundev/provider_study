import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/providers/counts.dart';


//Buttons 위젯에서 add 또는 remove 함수가 호출되면, Provider에서 해당 변수를 변경한 후, notifyListeners() 함수를 호출하여 값이 변경되었음을 알립니다.
// 이렇게 값이 변경되면,Provider의 context.watch 또는 context.select로 해당 값을 사용하는 위젯들은 값의 변경에 따라 re-build가 발생하고
// 위젯이 새로운 값과 함께 다시 표시되게 됩니다.
class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            //context.read<T>()는 T의 데이터 값이 변경되었을 때 위젯을 재빌드하지 않는다.
            //context.read<T>()의 경우, T의 데이터 값을 변경하는 등의 이벤트들을 위한 용도로 사용한다.
            context.read<Counts>().add();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: 40,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<Counts>().remove();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

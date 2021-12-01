import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/providers/counts.dart';

//provider를 사용하는 위젯

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('counter');

    return Text(
      //context.watch<Counts>().count를 사용하여 Provider의 count 값이 변경되는지를 감시하고,
      // 변경이 발생하면 화면에 변경된 값을 표시하도록 함
      context.watch<Counts>().count.toString(),  //context.watch<T>()는 T의 데이터 값이 변경되었을 때 위젯을 재빌드한다. (context.read<T>()등도 있음)
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

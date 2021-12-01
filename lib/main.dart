import 'package:flutter/material.dart';

//앞에서 생성한 전역 상태를 사용하기 위해 flutter_proivder 패키지와 상태 클래스를 가져왔
import 'package:provider/provider.dart';
import 'package:provider_study/providers/counts.dart';
import 'package:provider_study/widget/buttons.dart';
import 'package:provider_study/widget/counter.dart';

//상태를 표시하기 위해 불필요한 위젯들이 Re-build되면서 성능 이슈가 나타날 수 있습니다.
//Provider는 이 문제를 해결하기 위해 등장했으며, 이렇게 동일한 상태(데이터)를 전역적으로 다른 위젯들과 공유할 때 사용합니다.
//Provider를 사용할 때에는, 위젯 트리와 상관없이 상태(데이터)를 저장할 클래스를 생성하고,
// 해당 상태를 공유하는 공통 부모 위젯에 Provider를 제공(Provide)하고, 상태를 사용하는 곳에는 Provider의 데이터를 읽어서 사용하게 됨

//이번 예제에서는 최상단 위젯에 Provider를 제공하였 보통 하나의 앱을 개발할 때, 하나 이상의 Provider를 사용하므로,
//MultiProvider를 사용하여 여러 Provider를 제공할 수 있도록 함void main() {
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counts()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => Counts(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Counter(), //provider를 사용할 위젯
              Buttons(), //provider를 사용할 위젯
            ],
          ),
        ),
      ),
    );
  }
}

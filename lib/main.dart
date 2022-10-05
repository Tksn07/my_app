/// Flutter関係のインポート
import 'package:flutter/material.dart';

// 各ページのインポート
import 'package:my_app/normal_counter_page.dart';
import 'package:my_app/random_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
     home: const MyHomePage(title: 'ホームページ')
    );
  }
}

// ホーム画面
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          ),

          const _PagePushButton(
            buttonTitle: 'ノーマルカウンター',
            pagename: NormalCounterPage(),
          ),

          const Padding(
            padding: EdgeInsets.all(10),
          ),

          const _PagePushButton(
            buttonTitle: 'ランダムワード',
            pagename: RandomWords(),
          ),
        ],
      ),
    );
  }
}


// ページ遷移のボタン
class _PagePushButton extends StatelessWidget {
  const _PagePushButton({
    Key? key,
    required this.buttonTitle,
    required this.pagename,
    this.bgColor = Colors.blue,
  }) : super(key: key);

  final String buttonTitle;
  final dynamic pagename;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(buttonTitle),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pagename),
        );
      },
    );
  }
}
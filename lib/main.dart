import 'package:flutter/material.dart';
import 'package:networ_test/http/http.dart';
import 'package:networ_test/testApi.dart';

import 'http/api_response.dart';
import 'http/sp.dart';

Future<void> main() async {
  runApp(MyApp());
  await SpUtil.getInstance();
  Https().init(baseUrl: "http://1.15.188.149:8080/member/");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()async{
          ApiResponse<List<Advertise>> res =
          await TestApi.getScienceArticle();
         res.data!.map((e) => print(e.cover)).toList();
          if (res.status != Status.COMPLETED) return;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

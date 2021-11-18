import 'package:flutter/material.dart';
import 'package:networ_test/http/http.dart';
import 'package:networ_test/testApi.dart';
import 'package:http/http.dart' as http;
import 'http/api_response.dart';
import 'http/sp.dart';

Future<void> main() async {
  runApp(MyApp());
  await SpUtil.getInstance();
  Https().init(baseUrl: "http://jtechback.ectg.net/users/v1");
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
          await TestApi.getScienceArticle();
          // var url = Uri.parse('http://jtechback.ectg.net/users/v1/login');
          // var response = await http.put(url, body: {'email': 'users1_pop_crm.com', 'password': '123456'});
          // print('Response status: ${response.statusCode}');
          // print('Response body: ${response.body}');
         //  ApiResponse<List<Advertise>> res =
         //  await TestApi.getScienceArticle();
         // res.data!.map((e) => print(e.cover)).toList();
         //  if (res.status != Status.COMPLETED) return;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

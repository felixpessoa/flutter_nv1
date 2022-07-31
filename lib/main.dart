import 'package:flutter/material.dart';
import 'package:flutter_nv1/pages/home_page.dart';
import 'package:flutter_nv1/pages/pageViews/two_page.dart';
import 'package:flutter_nv1/pages/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (_) {
          return HomePage();
        },
        '/twoPage':(_) {
          return TwoPage();
        },
        '/list': (_) {
          return TodoListPage();
        },
      },
    );
  }
}

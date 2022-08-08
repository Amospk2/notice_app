import 'package:flutter/material.dart';
import 'package:notice_app/pages/details_page.dart';
import 'package:notice_app/pages/home_page.dart';
import 'package:notice_app/pages/login_page.dart';
import 'package:notice_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home':(_) => const HomePage(),
        '/details':(_) => const DetailsPage(),
      },
    );
  }
}

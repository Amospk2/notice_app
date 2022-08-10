import 'package:flutter/material.dart';
import 'package:notice_app/services/prefs_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      PrefsServices.isAuth(),
      Future.delayed(const Duration(seconds: 2)),
      ]).then((value) => value[0] ? Navigator.of(context).pushReplacementNamed('/home')
    : Navigator.of(context).pushReplacementNamed('/login'));
    

    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 144, 134, 224),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  size: MediaQuery.of(context).size.height * 0.3,
                ),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ));
  }
}

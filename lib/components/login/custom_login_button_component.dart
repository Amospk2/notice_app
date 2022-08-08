import 'package:flutter/material.dart';
import '../../controllers/login_controller.dart';

class CustomLoginButtomComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtomComponent({Key? key, required this.loginController})
      : super(key: key);

  final snackBar = const SnackBar(
    content: Text('Falha ao realizar login!'),
    duration: Duration(seconds: 5),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.InLoader,
      // ignore: non_constant_identifier_names
      builder: (_, InLoader, __) => InLoader
          ? const CircularProgressIndicator()
          // ignore: sized_box_for_whitespace
          : Container(
              height: MediaQuery.of(context).size.height * 0.063,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                  onPressed: () {
                    loginController.auth().then((resultado) {
                      if (resultado) {
                        Navigator.of(context).popAndPushNamed('/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  },
                  child: const Text("Login")),
            ),
    );
  }
}

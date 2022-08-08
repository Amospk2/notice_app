import 'package:flutter/material.dart';
import 'package:notice_app/components/login/custom_login_button_component.dart';
import 'package:notice_app/controllers/login_controller.dart';
import 'package:notice_app/widgets/custom_text_fild_widget.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 134, 224),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Icon(
                Icons.people,
                size: MediaQuery.of(context).size.height * 0.3,
              ),
              CustomTextFildWidget(
                  onChanged: _controller.setLogin, label: 'Login'),
              CustomTextFildWidget(
                onChanged: _controller.setSenha,
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 15),
              CustomLoginButtomComponent(loginController: _controller),
            ]),
      ),
    );
  }
}

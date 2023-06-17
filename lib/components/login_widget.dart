import 'package:flutter/material.dart';
import 'package:red_eyes_app/components/progress_indicator_widget.dart';
import 'package:rive/rive.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // Создание контроллеров текстовых полей и состояний виджета.
  final _hostController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordObscured = true;
  bool _loggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Вывод анимации EyeAnim, если происходит вход или пустой контейнер для отступа в других случаях.
          _loggingIn ? _eyeAnim() : SizedBox(height: 100),
          // Текстовые поля для хоста, логина и пароля.
          _buildTextField(
            controller: _hostController,
            hintText: 'Host',
          ),
          _buildTextField(
            controller: _loginController,
            hintText: 'Login',
          ),
          _buildTextField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: _passwordObscured,
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                _passwordObscured = !_passwordObscured;
              }),
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                // Иконка для показа/скрытия пароля.
                child: _passwordObscured
                    ? Icon(
                        Icons.visibility_off,
                        key: UniqueKey(),
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(
                        Icons.visibility,
                        key: UniqueKey(),
                        color: Theme.of(context).primaryColor,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Кнопка для входа с возможностью отображения индикатора загрузки.
          ElevatedButton(
            onPressed: _loggingIn
                ? null
                : () async {
                    final host = _hostController.text;
                    final login = _loginController.text;
                    final password = _passwordController.text;

                    setState(() {
                      _loggingIn = true;
                    });

                    await Future.delayed(const Duration(seconds: 10));

                    setState(() {
                      _loggingIn = false;
                    });

                    // Вывод введенных данных в консоль.
                    print('Host: $host');
                    print('Login: $login');
                    print('Password: $password');
                  },
            child: _loggingIn
                ? AppProgressIndicatorWidget()
                : Text(
                    'Вход',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Создание текстового поля с контроллером, подсказкой и возможностью скрытия пароля.
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

//анимация с глазом
Widget _eyeAnim() {
  return const Center(
    child: SizedBox(
      height: 100.0,
      width: 200,
      child: RiveAnimation.asset(
        "assets/animations/eye.riv",
        fit: BoxFit.cover,
      ),
    ),
  );
}

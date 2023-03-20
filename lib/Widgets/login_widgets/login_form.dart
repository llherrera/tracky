import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Data/user.dart';
import '../../UI/home_page.dart';
import '../../UI/register_page.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {

  String _username = '';
  String _password = '';

  get username => _username;
  get password => _password;
  
  void setUsername(String username) {
    _username = username;
  }
  void setPassword(String password){
    _password = password;
  }

  Future<void> _submitForm() async {
    final user = Provider.of<User>(context, listen: false);
    if (_username.isNotEmpty || _password.isNotEmpty) {
      UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
      final User? userLog = user.checkUser(_username, _password);
      if (userLog != null) {
        userProvider.login(userLog);
        Get.off(() => const HomePage());
        return;
      } else {
        return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
          AlertDialog(
            title: const Text('Error'),
            content: const Text('Username or password is incorrect'),
            actions: <Widget>[
              TextButton(
                onPressed: () {Get.back();},
                child: const Text('OK'),
              )
            ],
          )
        );
      }
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all the fields'),
          actions: <Widget>[
            TextButton(
              onPressed: () {Get.back();},
              child: const Text('OK'),
            )
          ],
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text(
          'Login info',
          style: TextStyle(color: Color(0xFF858484), fontSize: 12),
        ),
        usernameField(),
        passwordField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: forgotPasswordBtn(),
            )
          ],
        ),
        const CheckBox(),
        loginButton(),
        const Center(child: Text('-------------------------or-------------------------')),
        registerButton()
      ],
    );
  }

  Widget loginButton() {
    final loginBtn = ElevatedButton(
      onPressed: () {
        _submitForm();
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2F7694),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: const Text('Log in',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
    return loginBtn;
  }

  Widget registerButton() {
    final btn = ElevatedButton(
      onPressed: () {
        Get.off(() => const SignupPage());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: const Text('Sign up',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
    return btn;
  }

  Widget forgotPasswordBtn() {
    final btn = TextButton(
      onPressed: () {},
      child: const Text('Forgot password?',
          style: TextStyle(
              color: Color(0xFF858484),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline)),
    );
    return btn;
  }

  Widget usernameField() {
    return TextField(
      //obscureText: false,
      style: const TextStyle(color: Color(0xFF505050)),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF505050)),
        hintText: 'Username',
        hintStyle: TextStyle(color: Color(0xFF505050)),
      ),
      onChanged: (value) => setUsername(value),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      style: const TextStyle(color: Color(0xFF505050)),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF505050)),
        hintText: 'password',
        hintStyle: TextStyle(color: Color(0xFF505050)),
      ),
      onChanged: (value) => setPassword(value),
    );
  }

}

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value!;
          });
        },
        title: const Text('Keep me logged in',
            style: TextStyle(color: Color(0xFF505050), fontSize: 14)),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.transparent,
        checkColor: const Color(0xFF505050),
        side: const BorderSide(color: Color(0xFF505050)));
  }
}

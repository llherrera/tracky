import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Data/user.dart';
import '../../UI/login_page.dart';
import '../../UI/home_page.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupForm();
}

class _SignupForm extends State<SignupForm> {

  String _username = '';
  String _password = '';
  String _email = '';

  get username => _username;
  get password => _password;
  get email => _email;

  void setUsername(String username) {
    _username = username;
  }
  void setPassword(String password){
    _password = password;
  }
  void setEmail(String email) {
    _email = email;
  }

  Future<void> _submitForm() async {
    final user = Provider.of<User>(context, listen: false);
   // print(user.users);
    if (_username.isNotEmpty || _password.isNotEmpty || _email.isNotEmpty) {
      UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
      User _user = User(_username, _email, _password);
      user.addUser(_user);
      userProvider.login(_user);
      Get.off(() => const HomePage());
      return;
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
        usernameField(),
        emailField(),
        passwordField(),
        signupButton(),
        const Center(child: Text('----------or-----------')),
        loginButton(),
      ],
    );
  }

  Widget emailField() {
    return TextField(
      //obscureText: false,
      style: const TextStyle(color: Color(0xFF505050)),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Color(0xFF505050)),
        hintText: 'Email',
        hintStyle: TextStyle(color: Color(0xFF505050)),
      ),
      onChanged: (value) {
        setEmail(value);
      },
    );
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

  Widget signupButton() {
    final btn = ElevatedButton(
      onPressed: () {_submitForm();},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2F7694),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: const Text('Sign up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );
    return btn;
  }

  Widget loginButton() {
    final btn = ElevatedButton(
      onPressed: () {Get.off(() => const LoginPage());},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: const Text('Log in',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );
    return btn;
  }
}

import 'package:flutter/material.dart';
import '../../UI/home_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const <Widget>[
        Text('Login info', style: TextStyle(color: Color(0xFF858484), fontSize: 10),),
        UsernameField(),
        UsernameField(),
        ForgotPasswordBtn(),
        CheckBox(),
        LoginButton(),
//        ElevatedButton(onPressed: onPressed, child: child)
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBtn = ElevatedButton(
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2F7694),
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
    return loginBtn;
  }
}

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
//        foregroundColor: const Color(0xFF858484),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: const Text('Forgot password?',
        style: TextStyle(
          color: Color(0xFF858484),
          fontSize: 8,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline
        )
      ),
    );
    return btn;
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      //obscureText: false,
      style: TextStyle(color: Color(0xFF505050)),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF505050)),
        hintText: 'Username',
        hintStyle: TextStyle(color: Color(0xFF505050)),
      )
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
        setState( () {
          _selected = value!;
        });
      },
      title: const Text('Keep me logged in', 
        style: TextStyle(color: Color(0xFF505050), fontSize: 15)),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.transparent,
      checkColor: const Color(0xFF505050),
      side: const BorderSide(color: Color(0xFF505050))
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../UI/home_page.dart';
import '../../UI/register_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text('Login info', style: TextStyle(color: Color(0xFF858484), fontSize: 10),),
        const UsernameField(),
        const PasswordField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            /*Flexible(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('espacio', style: TextStyle(color: Colors.transparent),)
              )
            ),*/
            Flexible(
              child: ForgotPasswordBtn(),
            )
          ],
        ),
        const CheckBox(),
        const LoginButton(),
        const Center(child: Text('----------or-----------')),
        const RegisterButton()
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
      onPressed: () {Get.off(() => const HomePage());},
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: () {Get.off(() => const SignupPage());},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
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
}

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final btn = TextButton(
      onPressed: () {},
      child: const Text('Forgot password?',
        style: TextStyle(
          color: Color(0xFF858484),
          fontSize: 12,
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

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      style: TextStyle(color: Color(0xFF505050)),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color(0xFF505050)),
        hintText: 'password',
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
import 'package:flutter/material.dart';
import './TabBar_Screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isLoadind = false;

  var email = '';

  var pass = '';

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  final passFN = FocusNode();

  final buttonFN = FocusNode();

  void onSaved(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      setState(() {
        email = emailController.text;
        pass = passController.text;
      });
      login(context);
    }
  }

  login(BuildContext context) async {
    try {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const TabBarScreen()));
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    // icon: ,
                    //prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    label: Text('Email'),
                    hintText: 'Example@gmail.com'),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passFN);
                },
                validator: (emailValue) {
                  if (!emailValue!.contains('@')) {
                    return 'invalid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                textInputAction: TextInputAction.next,
                focusNode: passFN,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(buttonFN);
                },
                validator: (pass) {
                  if (pass!.length < 8) {
                    return 'maximum password char > 8';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    focusNode: buttonFN,
                    onPressed: () => onSaved(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

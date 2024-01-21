import 'package:flutter/material.dart';

import 'authservice.dart';
import 'profile.dart';
import 'package:fitness/SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            children: [
              SizedBox(height: 70),
              //Giving space between logo and text
              const SizedBox(
                height: 20,
              ),
              //Space
              const Text('Log In',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold)),

              SizedBox(height: 60),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.purple, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.purple, width: 1)),
                  hintText: 'Username',
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextField(
                controller: passwordController,
                obscureText: changeObscureText,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeObscureText = !changeObscureText;
                      });
                    },
                    child: Icon(Icons.remove_red_eye_outlined),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.purple, width: 1)),
                  hintText: 'Password',
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text('Forget Password?'),
              ),

              SizedBox(
                height: 50,
              ),

              TextButton(
                onPressed: () async {
                  String result = await AuthService()
                      .signIn(emailController.text, passwordController.text);
                  if (result == "Success") {
                    print("Sign In");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return classtask(title: 'anish');
                    }));
                  } else {
                    print("Failed");
                  }
                },
                child: Text('Log In',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 155, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),



              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SignUpPage();
                    }));
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

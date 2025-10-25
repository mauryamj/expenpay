import 'package:expenpay/data/auth/auth_service.dart';
import 'package:expenpay/ui/pages/forgot_password.dart';
import 'package:expenpay/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  signin() {
    try {
      authService.value.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.deepPurple,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Login to an existing account on ExpenPay",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hint: Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hint: Text("password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    ),
                    child: Text("forgot password"),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () => signin(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

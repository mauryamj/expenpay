import 'package:expenpay/data/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  String? errorMessage;

  changePassword() {
    try {
      authService.value.forgotPassword(email: emailController.text);
      Navigator.pop(context);
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
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Enter an existing account to change password",
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
                  Text(errorMessage ?? "", style: TextStyle(color: Colors.red)),
                  ElevatedButton(
                    onPressed: () => changePassword(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    child: Text(
                      "Send Email",
                      style: TextStyle(color: Colors.white),
                    ),
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

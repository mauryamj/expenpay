import 'package:expenpay/ui/pages/welcome_page.dart';
import 'package:expenpay/data/auth/auth_service.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notification"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Notification settings"),
              ),
            ),
            Text("Support"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Terms & Conditions"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Privacy Policy"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Help")),
            ),

            Text("Devices"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Authorized Devices"),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel"),
                          ),
                          FilledButton(
                            onPressed: () {
                              // authService.value.signOut().then((_) {
                              //   Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //       builder: (context) => Welcomepage(),
                              //     ),
                              //     (Route<dynamic> route) => false,
                              //   );
                              // });
                            },
                            child: Text("Sign Out"),
                          ),
                        ],
                        title: Text("Sign Out", textAlign: TextAlign.center),
                      );
                    },
                  );
                  //
                },
                child: Text("Sign Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:expenpay/ui/pages/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int spending = 2000;
  final int income = 10000;
  final int balance = 8000;
  final String name = "Amit Sharma";
  final String dayparts = "Afternoon";
  @override
  Widget build(BuildContext context) {
    final users = [
      {"name": "Amit Sharma", "image": "assets/images/people/u1.jpg"},
      {"name": "Priya Singh", "image": "assets/images/people/u2.jpg"},
      {"name": "Rahul Verma", "image": "assets/images/people/u3.jpg"},
      {"name": "Sneha Patel", "image": "assets/images/people/u4.jpg"},
      {"name": "Vikram Joshi", "image": "assets/images/people/u5.jpg"},
      {"name": "Neha Gupta", "image": "assets/images/people/u6.jpg"},
      {"name": "Rohan Mehta", "image": "assets/images/people/u7.jpg"},
      {"name": "Simran Kaur", "image": "assets/images/people/u8.jpg"},
    ];
    final historys = [
      {"name": "Amit Sharma", "amount": 200, "color": "green[400]"},
      {"name": "Youtube Ad", "amount": 245, "color": "red[400]"},
      {"name": "Rahul Verma", "amount": 199, "color": "green[400]"},
      {"name": "Sneha Patel", "amount": 600, "color": "green[400]"},
      {"name": "Vikram Joshi", "amount": 220, "color": "red[400]"},
      {"name": "Neha Gupta", "amount": 230, "color": "red[400]"},
      {"name": "Rohan Mehta", "amount": 500, "color": "green[400]"},
      {"name": "Simran Kaur", "amount": 100, "color": "red[400]"},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpenPay"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingPage();
                  },
                ),
              );
            },
            icon: Icon((Icons.settings)),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("good $dayparts"),
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text("This Month", style: TextStyle(fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        foregroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_arrow_up),

                          Column(
                            children: [Text("spending "), Text("₹$spending")],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        foregroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Icon(Icons.keyboard_arrow_down),
                          Column(children: [Text("Income "), Text("₹$income")]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 30,
                child: Expanded(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white12,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Balance: ₹$balance", style: TextStyle()),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                width: 1000,
                height: 100,
                child: Card(
                  color: Colors.white12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: Text("Send")),
                      TextButton(onPressed: () {}, child: Text("Recieve")),
                      TextButton(
                        onPressed: () {},
                        child: Text("Bank Transfer"),
                      ),
                    ],
                  ),
                ),
              ),
              Text("Send Again"),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var user in users)
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: ResizeImage(AssetImage(user["image"]!),width:100 ),
                              radius: 18,
                            ),
                            SizedBox(width: 12),
                            Text(user["name"]!),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Transaction History"),
              for (var history in historys)
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Card(
                    color: Colors.white12,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text("${history["name"]}"),
                          Spacer(), // Pushes the next widget to the end
                          Text(
                            "${history["amount"]}",
                            style: TextStyle(color: Colors.red[400]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 120,
            child: Card(
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.qr_code),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

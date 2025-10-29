import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenpay/data/database/db_service.dart';
import 'package:expenpay/data/models/transaction_model.dart';
import 'package:expenpay/data/repositories/transaction_repository.dart';
import 'package:expenpay/logic/home_bloc/home_bloc.dart';
import 'package:expenpay/ui/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final DbService dbService = DbService();
  final List user = [
    {"name": "Amit Sharma", "image": "assets/images/people/u1.jpg"},
    {"name": "Priya Singh", "image": "assets/images/people/u2.jpg"},
    {"name": "Rahul Verma", "image": "assets/images/people/u3.jpg"},
    {"name": "Sneha Patel", "image": "assets/images/people/u4.jpg"},
    {"name": "Vikram Joshi", "image": "assets/images/people/u5.jpg"},
    {"name": "Neha Gupta", "image": "assets/images/people/u6.jpg"},
    {"name": "Rohan Mehta", "image": "assets/images/people/u7.jpg"},
    {"name": "Simran Kaur", "image": "assets/images/people/u8.jpg"},
  ];
  final String name = "Amit Sharma";
  final String dayparts = "Afternoon";

  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _amountController = TextEditingController();
  late final TextEditingController _categoryController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(TransactionRepository())..add(LoadTransactions()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoaded) {
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
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("good $dayparts"),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
                                  children: [Text("spending "), Text("₹")],
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
                                Column(children: [Text("Income "), Text("₹")]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white12,
                            foregroundColor: Colors.white,
                          ),
                          child: Text("Balance: ₹", style: TextStyle()),
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
                            TextButton(
                              onPressed: () =>
                                  _diaplayTextInputDialog(context, -1),
                              child: Text("Send"),
                            ),
                            TextButton(
                              onPressed: () =>
                                  _diaplayTextInputDialog(context, 1),
                              child: Text("Recieve"),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Bank Transfer"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text("Send Again"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children: user
                                .map(
                                  (u) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            u["image"]!,
                                          ),
                                          radius: 25,
                                        ),
                                        Text(u["name"]!),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Transaction History"),
                    SizedBox(
                      height: 200,
                      child: StreamBuilder(
                        stream: dbService.getTransactions(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return const Center(
                                  child: Text("Something went wrong"),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              List transaction = snapshot.data?.docs ?? [];
                              if (transaction.isEmpty) {
                                return const Center(child: Text("empty"));
                              }
                              return ListView.builder(
                                itemCount: transaction.length,
                                itemBuilder: (context, index) {
                                  final tx = transaction[index].data();
                                  String txid = transaction[index].id;
                                  final color = tx.amount > 0
                                      ? Colors.green[400]
                                      : Colors.red[400];
                                  return Card(
                                    color: Colors.white12,
                                    child: ListTile(
                                      title: Text(tx.name),
                                      subtitle: Text(tx.category),
                                      trailing: Text(
                                        "${tx.amount}",
                                        style: TextStyle(color: color),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                      ),
                    ),
                  ],
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
                        onPressed: () => _diaplayTextInputDialog(context, -1),
                        child: Icon(Icons.qr_code),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }

  void _diaplayTextInputDialog(BuildContext context, num? type) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Transactions"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,

                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  hintText: "Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  hintText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                final transaction = TransactionModel(
                  name: _nameController.text,
                  amount: type! * num.tryParse(_amountController.text)! ?? 0.0,
                  date: Timestamp.now(),
                  category: _categoryController.text,
                );
                dbService.addTransaction(transaction);
                Navigator.pop(context);
                _nameController.clear();
                _amountController.clear();
                _categoryController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}

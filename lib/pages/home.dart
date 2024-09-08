import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import '../provider/balance.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Balance balance;
  double _balance = 0;
  bool _opacity = false;

  void deposit() {
    setState(() {
      _balance += 100;
    });
  }

  void withdraw(context) {
    if (_balance >= 50) {
      setState(() {
        _balance -= 50;
      });
    } else {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
         content: Text("Saldo insuficiente")
       ));
    }
  }

  void toggleHide() {
    setState(() {
      _opacity = !_opacity;
    });
  }

  @override
  Widget build(BuildContext context){
    // balance = Provider.of<Balance>(context) as Balance;
    // balance = context.watch<Balance>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Conta Corrente",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: ListView(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black87),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Saldo disponível",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "R\$",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    !_opacity ? "$_balance" : "--------",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => {toggleHide()},
                          style: TextButton.styleFrom(iconColor: Colors.white),
                          child: !_opacity
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => {
                            // balance.deposit()
                            deposit()
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            foregroundColor: Colors.white,
                            fixedSize: const Size(120, 30),
                          ),
                          child: const Text(
                            "Despositar",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            // balance.withdraw(context)
                            withdraw(context)
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            fixedSize: const Size(120, 30),
                          ),
                          child: const Text(
                            "Sacar",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../balanceController/balance.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _opacity = false;

  void toggleHide() {
    setState(() {
      _opacity = !_opacity;
    });
  }

  @override
  Widget build(BuildContext context){

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
                                  child: Consumer<BalanceController>(
                                    builder: (BuildContext context, BalanceController value, Widget? child) {
                                      return Text(
                                        !_opacity ? "${value.balance}" : "--------",
                                        style: const TextStyle(fontSize: 20),
                                      );
                                    },
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
                            Provider.of<BalanceController>(context, listen: false).deposit()
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
                            Provider.of<BalanceController>(context, listen: false).withdraw(context)
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

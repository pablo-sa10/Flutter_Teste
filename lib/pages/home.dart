import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Conta Corrente",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
        child: ListView(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.blueGrey
              ),
              child: Column(
                children: [
                  Row(
                    children: [Text("Saldo disponivel"),],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

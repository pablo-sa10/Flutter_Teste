import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/balanceController/balance.dart';
import 'pages/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BalanceController()),
      ],
      child: const MyApp(),
    ), // const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Flutter',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
      },
    );
  }
}

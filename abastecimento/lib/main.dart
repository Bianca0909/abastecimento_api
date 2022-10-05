import 'package:abastecimento/paginas/abastecimentos.dart';
import 'package:abastecimento/paginas/combustivel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MyWidgetState();
}

//enum SingingCharacter { Gasolina, Alcool }

class _MyWidgetState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/abastecimentos',
      routes: {
        '/abastecimentos': (context) => const Abastecimentos(),
        '/combustivel': (context) => const Combustivel(),
      },
    );
  }
}

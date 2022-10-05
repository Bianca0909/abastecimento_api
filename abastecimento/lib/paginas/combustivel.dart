import 'package:abastecimento/util/componentes.dart';
import 'package:flutter/material.dart';

class Combustivel extends StatefulWidget {
  const Combustivel({super.key});

  @override
  State<Combustivel> createState() => _CombustivelState();
}

class _CombustivelState extends State<Combustivel> {
  @override
  Widget build(BuildContext context) {
    TextEditingController valorAlcoolController = TextEditingController();
    TextEditingController valorGasolinaController = TextEditingController();
    String mensagem = " ";
    calcular() {
      double valorAlcool = double.parse(valorAlcoolController.text);
      double valorGasolina = double.parse(valorGasolinaController.text);

      if (valorAlcool / valorGasolina < 0.7) {
        print('Álcool');
      } else {
        print('Gasolina');
      }
    }

    return Scaffold(
        body: ListView(
      children: [
        Componentes().criaAppBar('Qual abastecer?', null),
        Componentes().criaTextField('Valor do álcool', false,
            TextInputType.number, valorAlcoolController),
        Componentes().criaTextField('Valor da gasolina', false,
            TextInputType.number, valorGasolinaController),
        Componentes().criaBotao('Calcular', calcular, 40, 5)
      ],
    ));
  }
}

import 'package:abastecimento/classes/abastecimento.dart';
import 'package:abastecimento/paginas/cadAbastecimento.dart';
import 'package:abastecimento/util/componentes.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Abastecimentos extends StatefulWidget {
  const Abastecimentos({Key? key}) : super(key: key);

  @override
  State<Abastecimentos> createState() => _AbastecimentosState();
}

class _AbastecimentosState extends State<Abastecimentos> {
  List<Abastecimento> listaAbastecimentos = [];

  atualizaPagina() {
    setState(() {});
  }

  limpar() {
    setState(() {
      listaAbastecimentos = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Componentes().criaAppBar("Abastecimentos", limpar),
      body: ListView.builder(
        itemCount: listaAbastecimentos.length,
        itemBuilder: (context, indice) {
          return Componentes().criaItemAbastecimento(
            listaAbastecimentos[indice],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => CadAbastecimento(
                listaAbastecimentos: listaAbastecimentos,
                atualizaPagina: atualizaPagina),
          );
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}

//INSTALAR MODAL_BOTTON_SHEET

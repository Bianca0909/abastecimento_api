import 'package:abastecimento/classes/abastecimento.dart';
import 'package:abastecimento/util/componentes.dart';
import 'package:flutter/cupertino.dart';

class CadAbastecimento extends StatefulWidget {
  List<Abastecimento>? listaAbastecimentos;
  Function? atualizaPagina;
  CadAbastecimento({Key? key, this.listaAbastecimentos, this.atualizaPagina})
      : super(key: key);

  @override
  State<CadAbastecimento> createState() => _CadAbastecimentoState();
}

class _CadAbastecimentoState extends State<CadAbastecimento> {
  TextEditingController dataController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController combustivelController = TextEditingController();
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    cadastrar() {
      String data = dataController.text;
      double valor = double.parse(valorController.text);
      String combustivel = combustivelController.text;
      Abastecimento a = Abastecimento(data, valor, combustivel);
      widget.listaAbastecimentos!.add(a); // Adiciona a lista não nula
      widget.atualizaPagina!();
      Navigator.pop(context); // Desempilha
    }

    viabilidade() {
      Navigator.of(context).pushNamed('/combustivel');
    }

    return Container(
      height: MediaQuery.of(context).size.height *
          0.7, //Traz as informações do dispositivo
      // Divide a tela pela em 70%
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            Componentes().criaTexto("Cadastrar abastecimento", 20),
            Componentes().criaTextField(
                "Data", false, TextInputType.datetime, dataController),
            Componentes().criaTextField(
                "Valor", false, TextInputType.number, valorController),
            Componentes().criarRadioButton(),
            const SizedBox(height: 10),
            Componentes()
                .criaBotao("Cadastrar", cadastrar, 50, double.infinity),
            const SizedBox(height: 10),
            Componentes()
                .criaBotao("Viabilidade", viabilidade, 50, double.infinity),
          ],
        ),
      ),
    );
  }
}

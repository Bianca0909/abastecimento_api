import 'package:abastecimento/classes/abastecimento.dart';
import 'package:abastecimento/util/enumTipoCombustivel.dart';
import 'package:flutter/material.dart';

class Componentes {
  EnumTipoCombustivel tipoCombustivel = EnumTipoCombustivel.GASOLINA;
  criaAppBar(texto, acao) {
    return AppBar(
      title: criaTexto(texto, 30),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: acao,
        )
      ],
    );
  }

  criaTexto(conteudo, tamanho) {
    return Text(
      conteudo,
      style: TextStyle(
        fontSize: tamanho,
      ),
    );
  }

  criaTextField(titulo, senha, tipoTeclado, controlador) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controlador,
        keyboardType: tipoTeclado,
        obscureText: senha,
        decoration: InputDecoration(
          labelText: titulo,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  criarRadioButton() {
    return Column(children: <Widget>[
      RadioListTile<EnumTipoCombustivel>(
        title: const Text('Gasolina'),
        value: EnumTipoCombustivel.GASOLINA,
        groupValue: tipoCombustivel,
        onChanged: (EnumTipoCombustivel? value) {
          setState() {
            tipoCombustivel = EnumTipoCombustivel.GASOLINA;
          }
        },
      ),
      RadioListTile<EnumTipoCombustivel>(
        title: const Text('Álcool'),
        value: EnumTipoCombustivel.ALCOOL,
        groupValue: tipoCombustivel,
        onChanged: (EnumTipoCombustivel? value) {
          setState() {
            tipoCombustivel = EnumTipoCombustivel.ALCOOL;
          }
        },
      )
    ]);
  }

  criaBotao(rotulo, funcao, altura, largura) {
    return SizedBox(
      height: altura,
      width: largura,
      child: ElevatedButton(
        onPressed: funcao,
        child: criaTexto(rotulo, 20),
      ),
    );
  }

  criaItemAbastecimento(Abastecimento a) {
    Color cor = a.combustivel == 'Gasolina' ? Colors.red : Colors.blue;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: cor,
      ),
      title: Text(a.data),
      subtitle: Text(a.combustivel),
      trailing: Text('R\$ ${a.valor}'),
    );
  }
}

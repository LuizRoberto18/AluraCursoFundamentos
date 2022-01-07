import 'package:byte_bank/compnoents/editor.dart';
import 'package:byte_bank/main.dart';
import 'package:byte_bank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "criando transferencias";

const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "00.0";

const _rotuloNumeroconta = "Numero da Conta";
const _dicaNumeroConta = '0000';

const _textoBotaoComfirar = "confirmar";

class FormularioTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencias> {
  final TextEditingController _controladorCampoumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                _controladorCampoumeroConta, _dicaNumeroConta, _rotuloNumeroconta, null),
            Editor(
                _controladorCampoValor, _rotuloCampoValor, _dicaCampoValor, Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criarTransferencia(context),
              child: Text(_textoBotaoComfirar ),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      Transferencia(valor, numeroConta);
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

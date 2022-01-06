import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencias extends StatelessWidget {
  final TextEditingController _controladorCampoumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("criando transferencias"),
      ),
      body: Column(
        children: [
          Editor(_controladorCampoumeroConta, "Numero da Conta", "0000", null),
          Editor(
              _controladorCampoValor, "Valor", "00.0", Icons.monetization_on),
          ElevatedButton(
            onPressed: () => _criarTransferencia(),
            child: Text("confirmar"),
          ),
        ],
      ),
    );
  }

  void _criarTransferencia() {
    final int? numeroConta = int.tryParse(_controladorCampoumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      Transferencia(valor, numeroConta);
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint("$transferenciaCriada");
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor(this.controlador, this.rotulo, this.dica, this.icone);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100, 100)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(400, 4000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencias();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        subtitle: Text(transferencia.valor.toString()),
        title: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

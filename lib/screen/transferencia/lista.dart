import 'package:byte_bank/models/transferencia.dart';
import 'package:byte_bank/screen/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloappBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  final List _transferencias = [];

  @override
  _ListaTransferenciasState createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloappBar),
      ),
      body: ListView.builder(
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
        itemCount: widget._transferencias.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencias();
          })).then(
              (transferenciaRecebida) => _atualiza(transferenciaRecebida!));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
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

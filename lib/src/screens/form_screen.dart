import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secrets_app/src/providers/secrets_provider.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _name = "";
  String _description = "";
  String _date = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  TextEditingController _inputFieldDateController = new TextEditingController();
  final secretProvider = new SecretProvider();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createName(),
          Divider(),
          _createDescription(),
          Divider(),
          ElevatedButton(onPressed: (){
            secretProvider.addSecret(_name, _date, _description, '', '');
            Navigator.of(context).pop();
          }, child: Text('Crear secreto'))
        ],
      ),
    );
  }

  _createName() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          hintText: "Nombre del secreto",
          labelText: "Nombre",
          icon: Icon(Icons.bookmark)
      ),
      onChanged: (valor){
        setState(() {
          _name = valor;
          print(_name);
        });
      },
    );
  }
  _createDescription() {
    return TextField(
      maxLines: 5,
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          hintText: "Descripcion del secreto",
      ),
      onChanged: (valor){
        setState(() {
          _description = valor;
          print(_description);
        });
      },
    );
  }
}

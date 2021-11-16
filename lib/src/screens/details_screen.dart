import 'package:flutter/material.dart';
import 'package:secrets_app/src/models/secrets_model.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> secret;
  DetailsPage({Key key, this.secret}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Secret App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Expanded(child:Text(widget.secret['name'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                  Expanded(child:Text(widget.secret['description'], style: TextStyle(fontSize: 18),)),
                ],
              )),
      ),
    );
  }
}


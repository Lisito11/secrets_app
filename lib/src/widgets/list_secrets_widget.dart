import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secrets_app/src/models/secrets_model.dart';

class ListviewSecret  extends StatefulWidget {
  final List<Secret> itemsSecrets;
  ListviewSecret({ @required this.itemsSecrets});
  @override
  _ListviewSecretState createState() => _ListviewSecretState();
}

class _ListviewSecretState extends State<ListviewSecret> {
  @override
  Widget build(BuildContext context) {
    // final switchProvider = Provider.of<SwitchProvider>(context);

    return ListView.builder(
      itemCount: widget.itemsSecrets.length,
      itemBuilder: (context, index) {
        return Visibility(
          // visible: (switchProvider.isSwitched && widget.itemsNaves[index].active == false)? false: true,
          child:  ListTile(
            leading: Icon(Icons.airplanemode_on),
            title: Text(widget.itemsSecrets[index].name),
            subtitle: Text(widget.itemsSecrets[index].description),
            // trailing: Checkbox(
            //   value: widget.itemsSecrets[index].active,
            //   onChanged: (value) {
            //     setState(() {
            //       widget.itemsSecrets[index].active = !widget.itemsNaves[index].active;
            //     });
            //   },
            // ),
          ),
        );
      },
    );
  }
}
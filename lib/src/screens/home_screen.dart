import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secrets_app/src/providers/secrets_provider.dart';
import 'package:secrets_app/src/screens/details_screen.dart';

class HomePage extends StatelessWidget {
  final secretProvider = new SecretProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: Icon(Icons.delete),
              onPressed: () {
                  secretProvider.batchDelete();
              },
              backgroundColor: Colors.red,
            ),
          ),
          Divider(height: 10,),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, 'form');
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Secret App'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => SecretProvider(),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: secrets()),
          ],
        )),
      ), //center
    );
  }

  Widget secrets() {
    return StreamBuilder<QuerySnapshot>(
        stream: secretProvider.getSecrets(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                height: 400.0, child: Center(child: CircularProgressIndicator()));
          }

          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['description']),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(secret: data),
                    ),
                  );
                },
              );
            }).toList(),
          );
        });
  }
}



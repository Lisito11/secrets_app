import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_database/firebase_database.dart' ;
import 'package:provider/provider.dart';
import 'package:secrets_app/src/providers/secrets_provider.dart';
import 'package:secrets_app/src/routes/routes.dart';
import 'package:secrets_app/src/screens/home_screen.dart';
import 'package:secrets_app/src/widgets/camera_widget.dart';
import 'package:secrets_app/src/widgets/list_secrets_widget.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secrets App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: getApplicationRoutes(),
    );
  }
}

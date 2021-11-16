import 'package:flutter/cupertino.dart';
import 'package:secrets_app/src/screens/details_screen.dart';
import 'package:secrets_app/src/screens/form_screen.dart';
import 'package:secrets_app/src/screens/home_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String,WidgetBuilder>{
    "/": (context) => HomePage(),
    "form": (context) => FormPage(),
    "details": (context) => DetailsPage(),
  };
}
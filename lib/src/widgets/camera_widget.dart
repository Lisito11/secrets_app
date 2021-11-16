// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CameraWidget extends StatefulWidget{
//   @override
//   State createState() {
//     return CameraWidgetState();
//   }
//
// }
//
// class CameraWidgetState extends State{
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pick Image Camera"),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Card(
//                 child:( imageFile==null)?Text("Choose Image"): Image.file( File(imageFile.path)),
//               ),
//               MaterialButton(
//                 textColor: Colors.white,
//                 color: Colors.pink,
//                 onPressed: (){
//                   _showChoiceDialog(context);
//                 },
//                 child: Text("Select Image"),
//
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myplugin/widget/takepicture_screen.dart';
// import 'package:myplugin/red_text_widget.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: TakepictureScreen(
      camera: firstCamera,
    ),
    debugShowCheckedModeBanner: false,
  ));
}

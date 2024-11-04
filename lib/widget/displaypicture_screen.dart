import 'package:flutter/material.dart';
import 'dart:io';

class DisplaypictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplaypictureScreen({Key? key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Display The Picture'),
        ),
        body: Center(
          child: Image.file(File(imagePath)),
        ));
  }
}

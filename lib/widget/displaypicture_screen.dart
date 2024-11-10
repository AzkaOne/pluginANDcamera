import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:myplugin/widget/filter_selector.dart';

class DisplaypictureScreen extends StatefulWidget {
  // final String imagePath;
  final Uint8List imageBytes;
  const DisplaypictureScreen({super.key, required this.imageBytes});

  @override
  State<DisplaypictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplaypictureScreen> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Photo')),
      body: Material(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: _buildPhotoWithFilter(),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: _buildFilterSelector(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        return Image.memory(
          (widget.imageBytes),
          fit: BoxFit.cover,
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemoView extends StatefulWidget {
  ImagePickerDemoView({super.key, required this.pickedFile});
  XFile? pickedFile;

  @override
  State<ImagePickerDemoView> createState() => _ImagePickerDemoViewState();
}

class _ImagePickerDemoViewState extends State<ImagePickerDemoView> {
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickFromGallery() async {
    final XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (!mounted) return;
    setState(() {
      widget.pickedFile = file;
    });
  }

  Future<void> _pickFromCamera() async {
    final XFile? file = await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 85);
    if (!mounted) return;
    setState(() {
      widget.pickedFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: widget.pickedFile == null
                    ? const Text('No image selected')
                    : Image.file(File(widget.pickedFile!.path)),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _pickFromGallery,
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Gallery'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _pickFromCamera,
                    icon: const Icon(Icons.photo_camera_outlined),
                    label: const Text('Camera'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

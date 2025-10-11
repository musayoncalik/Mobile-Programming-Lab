import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File? _image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fotoğraf Çekme Uygulaması"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImage(),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _takePhoto, child: const Text("Fotoğraf Çek")),
          ],
        ),
      ),
    );
  }

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path); //image yolunun atama işlemini yapan fonk.
      });
    }
  }

  Widget buildImage() {
    if (_image != null) {
      return Image.file(
        _image!,
        width: 300,
        height: 300,
      );
    } else {
      return const Text("Henüz Fotoğraf Çekilmedi");
    }
  }
}

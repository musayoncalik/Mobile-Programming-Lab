import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Picker Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ImagePickerScreen(),
    );
  }
}

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedFile;
  Uint8List? _imageBytes; // Web için resim bytes

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image == null) return;

      if (kIsWeb) {
        // Web: bytes olarak al
        final bytes = await image.readAsBytes();
        setState(() {
          _imageBytes = bytes;
          _pickedFile = image;
        });
      } else {
        // Mobil: File olarak al
        setState(() {
          _pickedFile = image;
        });
      }
    } catch (e) {
      debugPrint('Resim seçme hatası: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (_pickedFile != null) {
      if (kIsWeb) {
        imageWidget = Image.memory(_imageBytes!, fit: BoxFit.cover);
      } else {
        imageWidget = Image.file(File(_pickedFile!.path), fit: BoxFit.cover);
      }
    } else {
      imageWidget = const Center(
        child: Text(
          "Henüz bir resim seçilmedi.",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamera / Galeri Uygulaması'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageWidget,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo),
              label: const Text("Galeriden Seç"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Kameradan Çek"),
            ),
          ],
        ),
      ),
    );
  }
}

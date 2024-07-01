import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class SignUpPictureScreen extends StatefulWidget {
  const SignUpPictureScreen({super.key});

  @override
  State<SignUpPictureScreen> createState() => _SignUpPictureScreenState();
}

class _SignUpPictureScreenState extends State<SignUpPictureScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _initializeControllerCamera();
  }

  Future<void> _initializeControllerCamera() async {
    try {
      var cameras = await availableCameras();
      CameraDescription camera = cameras.first;
      _controller = CameraController(camera, ResolutionPreset.medium);
      await _controller.initialize();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture a Picture'),
        backgroundColor: Colors.purple,
      ),
      body: _controller != null && _controller.value.isInitialized
          ? CameraPreview(_controller)
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () async {
          try {
            if (_controller != null && _controller.value.isInitialized) {
              XFile file = await _controller.takePicture();
              Navigator.of(context).pop(file.path);
            }
          } catch (e) {
            print('Error taking picture: $e');
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}

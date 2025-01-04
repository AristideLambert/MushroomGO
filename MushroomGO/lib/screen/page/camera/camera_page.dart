import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    try {
      final cameras = await availableCameras();
      // Sélectionner la caméra arrière
      final firstCamera = cameras.first;
      _controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();
      setState(() {}); // Met à jour l'interface une fois la caméra initialisée
    } catch (e) {
      print('Erreur lors de l\'initialisation de la caméra : $e');
    }
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final image = await _controller.takePicture();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Photo capturée : ${image.path}')),
      );
    } catch (e) {
      print('Erreur lors de la capture de la photo : $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Libérer les ressources de la caméra
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initializeControllerFuture == null
          ? const Center(child: CircularProgressIndicator())
          : FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(children:[
              Center(child: CameraPreview(_controller,)),
              SafeArea(child: Icon(Icons.camera))
            ] );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: Icon(CupertinoIcons.camera_fill),
      ),
    );
  }
}

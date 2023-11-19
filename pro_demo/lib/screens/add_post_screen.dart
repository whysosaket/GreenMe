import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras[0],
      ResolutionPreset.medium,
    );

    await _cameraController.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _toggleFlash() async {
    if (_cameraController.value.isInitialized) {
      final bool currentFlashMode =
          _cameraController.value.flashMode == FlashMode.torch;
      await _cameraController.setFlashMode(
        currentFlashMode ? FlashMode.off : FlashMode.torch,
      );
    }
  }

  Future<void> _flipCamera() async {
    if (_cameras.length > 1 && _cameraController.value.isInitialized) {
      final CameraDescription newCamera =
          (_cameraController.description == _cameras[0])
              ? _cameras[1]
              : _cameras[0];
      await _cameraController.dispose();
      _cameraController = CameraController(
        newCamera,
        ResolutionPreset.medium,
      );
      await _cameraController.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 255, 232),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_cameraController),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.flash_off),
                    onPressed: () async {
                      await _toggleFlash();
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        final XFile image =
                            await _cameraController.takePicture();
                        print('Image captured: ${image.path}');
                      } catch (e) {
                        print('Error capturing image: $e');
                      }
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 217, 227, 219),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.flip_camera_ios),
                    onPressed: () async {
                      await _flipCamera();
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Add a caption...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

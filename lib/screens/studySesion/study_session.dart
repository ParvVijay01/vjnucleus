import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class SessionScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const SessionScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  CameraController? _controller;
  bool _isRecording = false;
  String? _selectedSubject;
  List<Map<String, dynamic>> _pastSessions = [];

  final List<String> _subjects = ["Math", "Science", "History", "English"];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    await [
      Permission.camera,
      Permission.microphone,
      Permission.storage,
    ].request();

    final frontCamera = widget.cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => widget.cameras.first,
    );

    _controller = CameraController(frontCamera, ResolutionPreset.medium);

    await _controller!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _startSession() async {
    if (_selectedSubject == null ||
        _controller == null ||
        !_controller!.value.isInitialized)
      return;

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath =
        '$videoDirectory/${_selectedSubject}_$currentTime.mp4';

    await _controller!.startVideoRecording();

    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _endSession() async {
    if (_controller == null || !_controller!.value.isRecordingVideo) return;

    final XFile videoFile = await _controller!.stopVideoRecording();
    final File file = File(videoFile.path);
    final int durationInSeconds = await _getVideoDuration(file);

    final sessionData = {
      'subject': _selectedSubject,
      'filePath': videoFile.path,
      'duration': durationInSeconds,
      'timestamp': DateTime.now(),
    };

    setState(() {
      _isRecording = false;
      _pastSessions.insert(0, sessionData);
    });
  }

  Future<int> _getVideoDuration(File file) async {
    final VideoPlayerController controller = VideoPlayerController.file(file);
    await controller.initialize();
    final duration = controller.value.duration.inSeconds;
    controller.dispose();
    return duration;
  }

  String _formatDuration(int seconds) {
    final Duration duration = Duration(seconds: seconds);
    return duration.toString().split('.').first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Study Session",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedSubject,
              items:
                  _subjects
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
              hint: const Text("Select Subject"),
              onChanged: (value) => setState(() => _selectedSubject = value),
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            if (_controller != null && _controller!.value.isInitialized)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: CameraPreview(_controller!),
                  ),
                ),
              ),

            const SizedBox(height: 16),

            Center(
              child:
                  _isRecording
                      ? ElevatedButton(
                        onPressed: _endSession,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("End Session"),
                      )
                      : ElevatedButton(
                        onPressed: _startSession,
                        child: const Text("Start Session"),
                      ),
            ),

            const SizedBox(height: 24),

            if (_pastSessions.isNotEmpty)
              const Text(
                "Previous Sessions",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            const SizedBox(height: 8),

            Expanded(
              child:
                  _pastSessions.isEmpty
                      ? const Center(
                        child: Text(
                          "No sessions yet.",
                          style: TextStyle(color: Colors.black54),
                        ),
                      )
                      : ListView.builder(
                        itemCount: _pastSessions.length,
                        itemBuilder: (context, index) {
                          final session = _pastSessions[index];
                          return Card(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              title: Text(
                                "${session['subject']} (${_formatDuration(session['duration'])})",
                                style: const TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                session['timestamp'].toString(),
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

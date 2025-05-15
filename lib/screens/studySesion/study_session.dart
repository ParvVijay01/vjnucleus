import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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
  bool _isPaused = false;
  Timer? _timer;
  int _elapsedSeconds = 0;

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
    _timer?.cancel();
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

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _elapsedSeconds = 0;
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

    _startTimer();

    setState(() {
      _isRecording = true;
      _isPaused = false;
    });
  }

  Future<void> _pauseResumeTimer() async {
    setState(() {
      _isPaused = !_isPaused;
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

    _stopTimer();

    setState(() {
      _isRecording = false;
      _isPaused = false;
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

  // ... imports and other code remain unchanged

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Study Session",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Dropdown - Subject Selector
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: DropdownButtonFormField<String>(
                    value: _selectedSubject,
                    items:
                        _subjects
                            .map(
                              (s) => DropdownMenuItem(value: s, child: Text(s)),
                            )
                            .toList(),
                    hint: const Text("Select Subject"),
                    onChanged:
                        (value) => setState(() => _selectedSubject = value),
                    decoration: const InputDecoration.collapsed(hintText: ''),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Camera Preview
              if (_controller != null && _controller!.value.isInitialized)
                Center(
                  child: ClipOval(
                    child: SizedBox(
                      width: 150, // Diameter = 2 * radius
                      height: 150,
                      child: CameraPreview(_controller!),
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              /// Timer Display
              if (_isRecording)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.timer, color: Colors.black87),
                    const SizedBox(width: 8),
                    Text(
                      _formatDuration(_elapsedSeconds),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              /// Session Controls
              /// Session Controls
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!_isRecording)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _startSession,
                            icon: const Icon(Icons.play_arrow),
                            label: const Text("Start Session"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      if (_isRecording) ...[
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _pauseResumeTimer,
                            icon: Icon(
                              _isPaused ? Icons.play_arrow : Icons.pause,
                            ),
                            label: Text(_isPaused ? "Resume" : "Pause"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _endSession,
                            icon: const Icon(Icons.stop),
                            label: const Text("End Session"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Past Sessions Title
              if (_pastSessions.isNotEmpty)
                const Text(
                  "Previous Sessions",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),

              const SizedBox(height: 8),

              /// Past Sessions List
              _pastSessions.isEmpty
                  ? const Center(
                    child: Text(
                      "No sessions yet.",
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _pastSessions.length,
                    itemBuilder: (context, index) {
                      final session = _pastSessions[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(
                            Icons.videocam,
                            color: Colors.blue,
                          ),
                          title: Text(
                            "${session['subject']} (${_formatDuration(session['duration'])})",
                            style: const TextStyle(color: Colors.black87),
                          ),
                          subtitle: Text(
                            session['timestamp'].toString(),
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ),
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

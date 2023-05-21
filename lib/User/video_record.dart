import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:raabta_fyp/User/home_user.dart';
import 'package:raabta_fyp/User/navbar_user.dart';
import '../Models/user/video_response_model.dart';
import '../controllers/user/user_provider.dart';
import '../helper/Dialogs.dart';

class VideoRecorder extends StatefulWidget {
  final CameraDescription camera;

  const VideoRecorder({required this.camera, Key? key}) : super(key: key);

  @override
  _VideoRecorderState createState() => _VideoRecorderState();
}

class _VideoRecorderState extends State<VideoRecorder> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late String _videoPath;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: true,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      await _initializeControllerFuture;

      final Directory appDirectory = await getTemporaryDirectory();
      final String videoDirectory = '${appDirectory.path}/Videos';
      await Directory(videoDirectory).create(recursive: true);
      final String currentTime =
          DateTime.now().millisecondsSinceEpoch.toString();
      final String filePath = '$videoDirectory/$currentTime.mp4';
      //filePath
      await _controller.startVideoRecording();

      setState(() {
        _videoPath = filePath;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopRecording() async {
    try {
      Dialogs.showProgressBar(context);
      XFile tempvideo = await _controller.stopVideoRecording();
      print(tempvideo.path);

      if (_videoPath.isNotEmpty) {
        File file = File(tempvideo.path);
        final FirebaseStorage storage = FirebaseStorage.instance;
        if (file.existsSync()) {
          // Upload the file to Firebase Storage
          final storageRef =
              storage.ref().child('videos/${DateTime.now().toString()}.mp4');
          await storageRef.putFile(file);
          final url = await storageRef.getDownloadURL();
          print(url);
          sendVideo(url);
          Future.delayed(Duration(seconds: 30),(){
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder:(context)=>NavBarUser()));
          });
        } else {
          print('File does not exist');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendVideo(String videoUrl) async {
    var url = Uri.parse('https://zohair101.pythonanywhere.com/analyze_video');
    var response = await http.post(url,
        body: jsonEncode({'video_path': videoUrl}),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      Map<String,dynamic> videoResponse=json.decode(response.body)['emotions'];
      await context.read<UserProvider>().addVideoResponse(new VideoResponse(userId: context.read<UserProvider>().user.id.toString(), videoLink: videoUrl, emotions: videoResponse));
      // var emotions = jsonDecode(response.body);

      //print(emotions.type);
      // return emotions;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isRecordingVideo) {
            _stopRecording();
          } else {
            _startRecording();
          }
        },
        child: Icon(
          _controller.value.isRecordingVideo
              ? Icons.stop
              : Icons.fiber_manual_record,
        ),
      ),
    );
  }
}

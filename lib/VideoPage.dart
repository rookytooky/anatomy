import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مشاهدة الفيديوهات'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // إضافة صور مرتبطة بالفيديوهات أو أي محتوى آخر
              buildImageRow(context, [
                /*   {
                  'path': 'images/image.png',
                  'title': 'integumentary system',
                  'videoPath': 'assets/videos/vidmuc.mp4'
                },*/
                {
                  'path': 'images/skill.jpg',
                  'title': 'skill System',
                  'videoPath': 'images/vidsk.mp4'
                },
                {
                  'path': 'images/mucc.jpg',
                  'title': 'Muscular System',
                  'videoPath': 'images/vidmuc.mp4'
                },
                {
                  'path': 'images/جهاز الدوران.jpg',
                  'title': 'Cardiovascular System',
                  'videoPath': 'images/heart.mp4'
                },
              ]),
              /*  const SizedBox(height: 20),
              buildImageRow(context, [
                {
                  'path': 'images/nerv2.jpg',
                  'title': 'nervous System',
                  'videoPath': 'assets/videos/nervous_system.mp4'
                },
                {
                  'path': 'images/جهاز_الهضمي-removebg-preview.png',
                  'title': 'Digestive System',
                  'videoPath': 'assets/videos/vidmuc.mp4'
                },
                {
                  'path': 'images/mal.png',
                  'title': 'skill vid',
                  'videoPath': 'assets/videos/vidmuc.mp4'
                },
                {
                  'path': 'images/fem.png',
                  'title': 'skill vid',
                  'videoPath': 'assets/videos/vidmuc.mp4'
                },
              ]),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageRow(BuildContext context, List<Map<String, String>> images) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: images.map((image) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              // عندما يتم الضغط على الصورة، نعرض الفيديو
              _showVideoPlayer(context, image['videoPath']!);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 130, 130, 130)
                        .withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الصورة في الأعلى
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image['path']!,
                      width: 120, // عرض الصورة أصغر
                      height: 100, // ارتفاع الصورة أصغر
                      fit: BoxFit.contain, // الصورة ستتناسق مع الحاوية
                    ),
                  ),
                  const SizedBox(height: 10),
                  // العنوان
                  Text(
                    image['title']!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 84, 202, 157),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // دالة لعرض مشغل الفيديو
  void _showVideoPlayer(BuildContext context, String videoPath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: VideoPlayerScreen(videoPath: videoPath),
        );
      },
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

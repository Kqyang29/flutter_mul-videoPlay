import 'package:flutter/material.dart';
import 'package:mul_video_play/video_screen.dart';

var VideoList = [
  {
    "name": "Big Buck Bunny",
    "videoUrl":
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "thumbnailUrl":
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
  },
  {
    "name": "For Bigger Blazes",
    "videoUrl":
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "thumbnailUrl":
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"
  },
  {
    "name": "For Bigger Escape",
    "videoUrl":
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "thumbnailUrl":
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"
  }
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mul_vido"),
      ),
      body: ListView(
        children: VideoList.map((e) => GestureDetector(
              onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>VideoScreen(
                  name:e["name"]!,
                  videoUrl:e["videoUrl"]!,
                ))
              ),
              child: Image.network(e["thumbnailUrl"]!),
            )).toList(),
      ),
    );
  }
}

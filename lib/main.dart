import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mul_video_play/models/video_model.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
  DatabaseReference dbRef=FirebaseDatabase.instance.ref().child("Video");
  List<Video> videoList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
      print(VideoList);
  }

  void getData(){
    dbRef.onChildAdded.listen((data) {
      VideoData videoData=VideoData.fromJson(data.snapshot.value as Map);
      Video video = Video(key: data.snapshot.key,videoData: videoData);
      videoList.add(video);
      setState(() {});
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mul_vido"),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: videoList.map((e) => GestureDetector(
                onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>VideoScreen(
                    name:e.videoData!.name!,
                    videoUrl:e.videoData!.mediaurl!,
                  ))
                );
                },
                child: Image.network(e.videoData!.thumbnail!),
                // child: Text('1'),
              )).toList(),
        ),
      ),
    );
  }
}

class Video{
  String?key;
  VideoData?videoData;
  

  Video({this.key,this.videoData});

}

class VideoData{
  String?mediaurl;
  String?name;
  String?thumbnail;

  VideoData({this.mediaurl,this.name,this.thumbnail});

  VideoData.fromJson(Map<dynamic,dynamic>json){
    mediaurl=json['mediaurl'];
    name=json['name'];
    thumbnail=json['thumbnail'];

  }
}
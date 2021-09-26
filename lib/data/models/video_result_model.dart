import 'video_model.dart';

class VideoResultModel {
  late int id;
  late List<VideoModel> videos;

  VideoResultModel({required this.id, required this.videos});

  VideoResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      videos = <VideoModel>[];
      json['results'].forEach((v) {
        videos.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['results'] = videos.map((v) => v.toJson()).toList();
    return data;
  }
}

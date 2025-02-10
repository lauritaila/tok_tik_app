
import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  final List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //Todo: donload videos
    notifyListeners();
  }
  
}
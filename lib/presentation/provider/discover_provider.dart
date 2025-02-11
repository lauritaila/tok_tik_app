
import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRespository;

  DiscoverProvider({required this.videoPostsRespository});

  bool initialLoading = true;
  final List<VideoPost> videos = [];


  Future<void> loadNextPage() async {
    final newVideos = await videoPostsRespository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
  
}
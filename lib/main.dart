import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/config/theme/app_theme.dart';
import 'package:tok_tik_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik_app/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tok_tik_app/presentation/provider/discover_provider.dart';
import 'package:tok_tik_app/presentation/screens/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepository = VideoPostsRepositoryImpl(
      videoPostsDatasource: LocalVideoDatasource()
    );


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy:false, 
          create: (_) => DiscoverProvider(videoPostsRespository: videoPostsRepository)..loadNextPage()
          ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}

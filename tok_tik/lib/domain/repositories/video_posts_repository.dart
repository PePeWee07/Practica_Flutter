import 'package:tok_tik/domain/etities/video_post.dart';

abstract class VideoPostsRepository {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}

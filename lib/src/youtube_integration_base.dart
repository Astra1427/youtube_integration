import 'package:dio/dio.dart';
import 'package:youtube_integration/models/channel_details/channel_details.dart';
import 'package:youtube_integration/models/playlist/playlist_model.dart';
import 'package:youtube_integration/models/playlist_video/playlist_video_item.dart';
import 'package:youtube_integration/models/search_video/search_videos.dart';
import 'package:youtube_integration/models/video_comments/video_comments_models.dart';
import 'package:youtube_integration/models/video_details/video_details_model.dart';
import 'package:youtube_integration/src/youtube_exception.dart';

class YouTubeIntegration {
  final String apiKey;
  YouTubeIntegration({required this.apiKey});
  final String _baseUrl = 'https://www.googleapis.com/youtube/v3';

  Future<Map<String, dynamic>> _get({
    required String url,
  }) async {
    final response = await Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ).get(
      url,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('${response.statusMessage} ${response.statusCode}');
    }
  }

  // Fetch videos from a specific channel
  Future<List<SearchVideosModel>> fetchChannelVideosByID({
    required String channelId,
    int maxResults = 50,
    String order = 'date',
    String? pageToken,
    String? publishedAfter,
    String? publishedBefore,
  }) async {
    try {
      final url =
          '$_baseUrl/search?part=snippet&channelId=$channelId&maxResults=$maxResults&order=$order&type=video&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}${publishedAfter != null ? '&publishedAfter=$publishedAfter' : ''}${publishedBefore != null ? '&publishedBefore=$publishedBefore' : ''}';
      final response = await _get(url: url);
      final List items = response['items'];
      final List<SearchVideosModel> videoItems =
          items.map((item) => SearchVideosModel.fromJson(item)).toList();
      return videoItems;
    } catch (e) {
      throw FetchChannelVideosException(e.toString());
    }
  }

  // Fetch playlists from a specific channel
  Future<List<PlaylistModel>> fetchAllPlaylists({
    required String channelId,
    int maxResults = 50,
    String? pageToken,
  }) async {
    try {
      final url =
          '$_baseUrl/playlists?part=snippet&channelId=$channelId&maxResults=$maxResults&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}';
      final response = await _get(url: url);
      final List items = response['items'];
      final List<PlaylistModel> playlistItems =
          items.map((item) => PlaylistModel.fromJson(item)).toList();
      return playlistItems;
    } catch (e) {
      throw FetchPlaylistsException(e.toString());
    }
  }

  // Fetch videos from a specific playlist
  Future<List<PlaylistVideoModel>> fetchPlaylistVideos({
    required String playlistId,
    int maxResults = 50,
    String? pageToken,
  }) async {
    try {
      final url =
          '$_baseUrl/playlistItems?part=snippet&playlistId=$playlistId&maxResults=$maxResults&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}';
      final response = await _get(url: url);
      final List items = response['items'];
      final List<PlaylistVideoModel> playlistItems =
          items.map((item) => PlaylistVideoModel.fromJson(item)).toList();
      return playlistItems;
    } catch (e) {
      throw FetchPlaylistVideosException(e.toString());
    }
  }

  // Fetch video details
  Future<List<VideoDetailsModel>> fetchVideoDetails({
    required String videoId,
    String part = 'snippet,statistics',
  }) async {
    try {
      final url = '$_baseUrl/videos?part=$part&id=$videoId&key=$apiKey';
      final response = await _get(url: url);
      final List items = response['items'];
      final List<VideoDetailsModel> videoDetails =
          items.map((item) => VideoDetailsModel.fromJson(item)).toList();
      return videoDetails;
    } catch (e) {
      throw FetchVideoDetailsException(e.toString());
    }
  }

  // Fetch comments for a specific video
  Future<List<VideoCommentsModels>> fetchVideoComments({
    required String videoId,
    int maxResults = 50,
    String? pageToken,
  }) async {
    try {
      final url =
          '$_baseUrl/commentThreads?part=snippet&videoId=$videoId&maxResults=$maxResults&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}';
      final response = await _get(url: url);
      final List items = response['items'];
      final List<VideoCommentsModels> videoComments =
          items.map((item) => VideoCommentsModels.fromJson(item)).toList();
      return videoComments;
    } catch (e) {
      throw FetchVideoCommentsException(e.toString());
    }
  }

  // Fetch video categories
  Future<SearchVideosModel> searchVideos({
    required String query,
    int maxResults = 50,
    String order = 'relevance',
  }) async {
    try {
      final url =
          '$_baseUrl/search?part=snippet&q=$query&maxResults=$maxResults&order=$order&type=video&key=$apiKey';
      final response = await _get(url: url);
      return SearchVideosModel.fromJson(response);
    } catch (e) {
      throw SearchVideosException(e.toString());
    }
  }

  // Fetch channel details
  Future<ChannelDetailsModel> fetchChannelDetails({
    required String channelId,
    String part = 'snippet,statistics',
  }) async {
    try {
      final url = '$_baseUrl/channels?part=$part&id=$channelId&key=$apiKey';
      final response = await _get(url: url);
      return ChannelDetailsModel.fromJson(response);
    } catch (e) {
      throw FetchChannelDetailsException(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:youtube_integration/models/channel_details_model/channel_details_model.dart';
import 'package:youtube_integration/models/channel_playlists_model/channel_playlists_model.dart';
import 'package:youtube_integration/models/channel_video_model/channel_video_model.dart';
import 'package:youtube_integration/models/playlist_videos_model/playlist_videos_model.dart';
import 'package:youtube_integration/models/search_videos_model/search_video_model.dart';
import 'package:youtube_integration/models/video_comments_model/video_comments_model.dart';
import 'package:youtube_integration/models/video_details_model/video_details_model.dart';
import 'package:youtube_integration/src/youtube_exception.dart';

/// The main class that provides access to YouTube Data API services.
class YouTubeIntegration {
  final String apiKey;
  YouTubeIntegration({required this.apiKey});
  final String _baseUrl = 'https://www.googleapis.com/youtube/v3';

  Future<Map<String, dynamic>> _get({
    required String url,
    List<Interceptor>? interceptors,
  }) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    if (interceptors != null) dio.interceptors.addAll(interceptors);
    final response = await dio.get(
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

  /// Fetch videos from a specific channel
  Future<ChannelVideoModel> fetchChannelVideosByID({
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
      return ChannelVideoModel.fromJson(response);
    } catch (e) {
      throw FetchChannelVideosException(e.toString());
    }
  }

  /// Fetch playlists from a specific channel
  Future<ChannelPlaylistsModel> fetchAllPlaylists({
    required String channelId,
    int maxResults = 50,
    String? pageToken,
  }) async {
    try {
      final url =
          '$_baseUrl/playlists?part=snippet&channelId=$channelId&maxResults=$maxResults&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}';
      final response = await _get(url: url);
      return ChannelPlaylistsModel.fromJson(response);
    } catch (e) {
      throw FetchPlaylistsException(e.toString());
    }
  }

  /// Fetch videos from a specific playlist
  Future<PlaylistVideosModel> fetchPlaylistVideos({
    required String playlistId,
    int maxResults = 50,
    String? pageToken,
  }) async {
    try {
      final url =
          '$_baseUrl/playlistItems?part=snippet&playlistId=$playlistId&maxResults=$maxResults&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}';
      final response = await _get(url: url);
      return PlaylistVideosModel.fromJson(response);
    } catch (e) {
      throw FetchPlaylistVideosException(e.toString());
    }
  }

  /// Fetch video details
  Future<VideoDetailsModel> fetchVideoDetails({
    required String videoId,
    String part = 'snippet,statistics',
  }) async {
    try {
      final url = '$_baseUrl/videos?part=$part&id=$videoId&key=$apiKey';
      final response = await _get(url: url);
      return VideoDetailsModel.fromJson(response);
    } catch (e) {
      throw FetchVideoDetailsException(e.toString());
    }
  }

  /// Fetch comments for a specific video
  Future<VideoCommentsModel> fetchVideoComments({
    required String videoId,
    int maxResults = 50,
    String? pageToken,
  }) async {
    try {
      final url =
          '$_baseUrl/commentThreads?part=snippet&videoId=$videoId&maxResults=$maxResults&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}';
      final response = await _get(url: url);
      return VideoCommentsModel.fromJson(response);
    } catch (e) {
      throw FetchVideoCommentsException(e.toString());
    }
  }

  // Fetch video categories
  Future<SearchVideosModel> searchVideos({
    required String query,
    int maxResults = 50,
    String order = 'relevance',
    String? pageToken,
    List<Interceptor>? interceptors,
  }) async {
    try {
      final url =
          '$_baseUrl/search?part=snippet&q=$query&maxResults=$maxResults&order=$order&type=video&key=$apiKey${pageToken != null ? '&pageToken=$pageToken' : ''}';
      final response = await _get(url: url, interceptors: interceptors);
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

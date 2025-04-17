import 'dart:developer';

import 'package:youtube_integration/models/channel_playlists_model/playlist.dart';
import 'package:youtube_integration/youtube_integration.dart';

void main() async {
  // TODO: Replace with your actual YouTube Data API key
  const apiKey = 'YOUR_API_KEY_HERE';

  // Initialize the YouTubeIntegration class
  final youTube = YouTubeIntegration(apiKey: apiKey);

  try {
    // Example 1: Fetch videos from a specific channel
    final channelVideos = await youTube.fetchChannelVideosByID(
      channelId: 'UC_x5XG1OV2P6uZZ5FSM9Ttw', // Google Developers channel ID
      maxResults: 3,
    );
    log('--- Channel Videos ---');
    for (var video in channelVideos.videos ?? []) {
      log('Title: ${video.snippet?.title}');
    }

    // Example 2: Fetch playlists from a specific channel
    final playlists = await youTube.fetchAllPlaylists(
      channelId: 'UC_x5XG1OV2P6uZZ5FSM9Ttw',
      maxResults: 2,
    );
    log('\n--- Playlists ---');
    for (Playlist playlist in playlists.playlists ?? []) {
      log('Playlist: ${playlist.snippet?.title}');
    }

    // Example 3: Fetch videos from a specific playlist
    if (playlists.playlists?.isNotEmpty ?? false) {
      final playlistId = playlists.playlists?.first.id ?? '';
      final playlistVideos = await youTube.fetchPlaylistVideos(
        playlistId: playlistId,
        maxResults: 2,
      );
      log('\n--- Videos from Playlist ---');
      for (var video in playlistVideos.videos ?? []) {
        log('Video: ${video.snippet?.title}');
      }
    }

    // Example 4: Fetch details of a specific video
    if (channelVideos.videos?.isNotEmpty ?? false) {
      final videoId = channelVideos.videos?.first.id?.videoId ?? '';
      final videoDetails = await youTube.fetchVideoDetails(videoId: videoId);
      log('\n--- Video Details ---');
      for (var detail in videoDetails.items ?? []) {
        log('Title: ${detail.snippet?.title}');
        log('Views: ${detail.statistics?.viewCount}');
      }

      // Example 5: Fetch comments for a video
      final data = await youTube.fetchVideoComments(videoId: videoId);
      log('\n--- Video Comments ---');
      for (var comment in data.comments ?? []) {
        log(
          'Comment: ${comment.snippet?.topLevelComment?.snippet?.textDisplay}',
        );
      }
    }

    // Example 6: Search for videos using a keyword
    final searchResult = await youTube.searchVideos(query: 'Flutter');
    log('\n--- Search Result ---');
    log('Searched Video Title: ${searchResult.kind}');

    // Example 7: Fetch channel details
    final channelDetails = await youTube.fetchChannelDetails(
      channelId: 'UC_x5XG1OV2P6uZZ5FSM9Ttw',
    );
    log('\n--- Channel Details ---');
    log('Title: ${channelDetails.items?.first.snippet?.title}');
    log(
      'Subscribers: ${channelDetails.items?.first.statistics?.subscriberCount}',
    );
  } catch (e) {
    log('\n⚠️ Error occurred: $e');
  }
}

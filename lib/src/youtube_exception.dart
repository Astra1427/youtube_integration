class FetchPlaylistVideosException implements Exception {
  final String message;

  FetchPlaylistVideosException([
    this.message = 'Failed to fetch playlist videos',
  ]);
}

class FetchPlaylistsException implements Exception {
  final String message;

  FetchPlaylistsException([this.message = 'Failed to fetch playlists']);
}

class FetchChannelVideosException implements Exception {
  final String message;

  FetchChannelVideosException([
    this.message = 'Failed to fetch channel videos',
  ]);
}

class FetchVideoDetailsException implements Exception {
  final String message;

  FetchVideoDetailsException([this.message = 'Failed to fetch video details']);
}

class FetchVideoCommentsException implements Exception {
  final String message;

  FetchVideoCommentsException([
    this.message = 'Failed to fetch video comments',
  ]);
}

class SearchVideosException implements Exception {
  final String message;

  SearchVideosException([this.message = 'Failed to search videos']);
}

class FetchChannelDetailsException implements Exception {
  final String message;

  FetchChannelDetailsException([
    this.message = 'Failed to fetch channel details',
  ]);
}

# 📺 youtube_integration

A Dart package that simplifies integration with the **YouTube Data API**.  
Easily fetch videos, playlists, channel details, comments, and more — all in a clean and developer-friendly way.

---

## ✨ Features

- 🔍 Search for YouTube videos.
- 📺 Fetch videos from a specific channel.
- 📂 Retrieve playlists of a channel.
- 🎞️ Get all videos from a playlist.
- 🧾 Fetch video details (statistics, title, etc).
- 💬 Fetch comments on a video.
- 📊 Get full channel details.

---

## 🚀 Getting Started

### 1. Add dependency to `pubspec.yaml`:

```yaml
dependencies:
  youtube_integration: <LATEST_VERSION>
```

### 2. Enable the YouTube Data API:

Go to [Google Cloud Console](https://console.cloud.google.com/apis/library/youtube.googleapis.com)  
→ Enable the **YouTube Data API v3**.

### 3. Create an API key:

Generate an API key from [API Credentials Page](https://console.developers.google.com/apis/credentials).

---

## 🧪 Usage

```dart
import 'package:youtube_integration/youtube_integration.dart';

final youtube = YouTubeIntegration(apiKey: 'YOUR_API_KEY');

// Fetch videos from a channel
final videos = await youtube.fetchChannelVideosByID(channelId: 'CHANNEL_ID');

// Search videos
final results = await youtube.searchVideos(query: 'flutter tutorials');
```

You can also:
- Fetch channel details
- Get playlist videos
- Get video details
- Fetch video comments

---

## 📘 Documentation

Check the full documentation in the [GitHub repo](https://github.com/YousefMohamed6/youtube_integration).

---

## 💡 Tip

You can paginate results using `nextPageToken` available in the API responses.

---

## 📄 License

This package is open-source and licensed under the [MIT License](LICENSE).

---

## 🙌 Contributing

Pull requests and issues are welcome!  
Feel free to open an issue or submit a PR on [GitHub](https://github.com/YousefMohamed6/youtube_integration).

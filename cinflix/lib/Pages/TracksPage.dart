import 'package:cineflix/data/song_data.dart';
import 'package:cineflix/Pages/root_page.dart';
import 'package:cineflix/widget/MusicPlayer/mp_inherited.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

class TrcksPage extends StatefulWidget {
  @override
  _TrackPageState createState() => new _TrackPageState();
}

class _TrackPageState extends State<TrcksPage> {
  SongData songData;
  bool _isLoading = true;
  MusicFinder audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = new MusicFinder();
    initPlatformState();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer = null;
    songData.audioPlayer.stop();
  }

  initPlatformState() async {
    _isLoading = true;

    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print("Failed to get songs: '${e.message}'.");
    }

    print(songs);
    if (!mounted) return;

    if (songs.isNotEmpty) {
      audioPlayer.play(songs.first.uri);
    }

    setState(() {
      songData = new SongData((songs));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MPInheritedWidget(songData, _isLoading, new RootPage());
  }
}

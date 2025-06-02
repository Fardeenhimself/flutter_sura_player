import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(AzanApp());

class AzanApp extends StatelessWidget {
  AzanApp({super.key});

  late AudioPlayer player = AudioPlayer();

  // void setAudioSource() {
  //   player.setSource(AssetSource('azan1.mp3'));
  // }

  void playAzan(int soundNumber) {
    player.play(AssetSource('sura$soundNumber.mp3'));
  }

  void stopAzan() {
    player.stop();
  }

  void resumeAzan() {
    player.resume();
  }

  Card makeAzan({required int soundNumber, required String name}) {
    return Card(
      color: Colors.green[400],
      child: ListTile(
        leading: TextButton(
          onPressed: () {
            playAzan(soundNumber);
          },
          child: Icon(Icons.play_arrow, color: Colors.white),
        ),
        title: Text(name, style: TextStyle(color: Colors.white)),
        trailing: TextButton(
          onPressed: () {
            stopAzan();
          },
          child: Icon(Icons.stop, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Text(
            'Play Surah',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              makeAzan(soundNumber: 1, name: 'Sura Kafirun'),
              makeAzan(soundNumber: 2, name: 'Sura Al-Qariyah'),
              makeAzan(soundNumber: 3, name: 'Sura Ad-Duha'),
            ],
          ),
        ),
      ),
    );
  }
}

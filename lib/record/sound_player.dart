import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';

class SoundPlayer {
  // Declare FlutterSoundPlayer
  FlutterSoundPlayer? _audioPlayer;
  // Set recorder initislised is false
  bool _isPlayerInitialised = false;
  // isPlayer => get status of player (whether is playing)
  bool get isPlaying => _audioPlayer!.isPlaying;

  // initialize player
  Future init() async {
    // Get FlutterSoundPlayer
    _audioPlayer = FlutterSoundPlayer();
    // Open audiosession
    await _audioPlayer!.openAudioSession();
    // set player initislised is true
    _isPlayerInitialised = true;
  }

  // release player
  Future dispose() async {
    // if Recorder isn't initialised => return
    if (!_isPlayerInitialised) return;
    // close audiosession
    await _audioPlayer!.closeAudioSession();
    // set audioplayer is null
    _audioPlayer = null;
    // set player initislised is true
    _isPlayerInitialised = false;
  }

  //start player
  Future play(String pathToReadAudio) async {
    await _audioPlayer!.startPlayer(
      fromURI: pathToReadAudio,
    );
  }

  // stop player
  Future stop() async {
    // if player isn't initialised => return
    if (!_isPlayerInitialised) return;
    // stop player
    await _audioPlayer!.stopPlayer();
  }
}

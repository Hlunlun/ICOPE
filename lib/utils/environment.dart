

class Environment {

    static const String stt_token = String.fromEnvironment(
      'STT_TOKEN',
      defaultValue: '',
    );

    static const String  tts_token = String.fromEnvironment(
      'TTS_TOKEN',
      defaultValue: '',
    );

    static const String api = String.fromEnvironment(
      'API_HOST',
      defaultValue:'',
    );




}
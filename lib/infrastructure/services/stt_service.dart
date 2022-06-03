import 'package:logging/logging.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SttService {
  final SpeechToText speech = SpeechToText();

  Future<bool> start(SpeechCallback callback,
      {int numSecondsListen = 6}) async {
    final bool available = await speech.initialize(
      onStatus: (String status) {
        _logger.fine('speech status $status');
      },
      onError: (SpeechRecognitionError errorNotification) {
        _logger.fine('speech error notification $errorNotification');
      },
    );
    if (available) {
      await speech.listen(
        listenFor: Duration(seconds: numSecondsListen),
        onResult: (SpeechRecognitionResult result) {
          _logger.fine('speech result $result');
          callback(result.recognizedWords);
        },
      );
      return true;
    } else {
      _logger.fine('The user has denied the use of speech recognition.');
      return false;
    }
  }

  void stop() {
    speech.stop();
  }
}

typedef SpeechCallback = void Function(String recognizedText);

// ignore: unused_element
final Logger _logger = Logger('SttService');

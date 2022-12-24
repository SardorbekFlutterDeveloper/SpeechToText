// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// class SpeechToText extends StatefulWidget {
//   const SpeechToText({super.key});

//   @override
//   State<SpeechToText> createState() => _SpeechToTextState();
// }

// class _SpeechToTextState extends State<SpeechToText> {
//   bool _hasSpeech = false;
//   bool _logEvents = false;
//   bool _onDevice = false;
//   final TextEditingController _pauseForController =
//       TextEditingController(text: '3');
//   final TextEditingController _listenForController =
//       TextEditingController(text: '30');
//   double level = 0.0;
//   double minSoundLevel = 50000;
//   double maxSoundLevel = -50000;
//   String lastWords = '';
//   String lastError = '';
//   String lastStatus = '';
//   String _currentLocaleId = '';
//   List<LocaleName> _localeNames = [];
//   final SpeechToText speech = SpeechToText();

//   @override
//   void initState() {
//     super.initState();

//     Future<void> initSpeechState() async {
//       _logEvent('Initialize');
//       try {
//         var hasSpeech = await speech.initialize(
//           onError: errorListener,
//           onStatus: statusListener,
//           debugLogging: _logEvents,
//         );
//         if (hasSpeech) {
//           // Get the list of languages installed on the supporting platform so they
//           // can be displayed in the UI for selection by the user.
//           _localeNames = await speech.locales();

//           var systemLocale = await speech.systemLocale();
//           _currentLocaleId = systemLocale?.localeId ?? '';
//         }
//         if (!mounted) return;

//         setState(() {
//           _hasSpeech = hasSpeech;
//         });
//       } catch (e) {
//         setState(() {
//           lastError = 'Speech recognition failed: ${e.toString()}';
//           _hasSpeech = false;
//         });
//       }
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   'Recognized words:',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(16),
//                   child: Text(
//                     // If listening is active show the recognized words
//                     _speechToText.isListening
//                         ? '$_lastWords'
//                         // If listening isn't active but could be tell the user
//                         // how to start it, otherwise indicate that speech
//                         // recognition is not yet ready or not supported on
//                         // the target device
//                         : _speechEnabled
//                             ? 'Tap the microphone to start listening...'
//                             : 'Speech not available',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed:
//               // If not yet listening for speech start, otherwise stop
//               _speechToText.isNotListening ? _startListening : _stopListening,
//           tooltip: 'Listen',
//           child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
//         ),
//       );
//     }
//   }
// }

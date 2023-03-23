import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/divide_sentence_by_words.dart';
import 'package:four_hours_client/utils/extensions.dart';
import 'package:go_router/go_router.dart';

class TextBlurTestPage extends StatefulWidget {
  const TextBlurTestPage({Key? key}) : super(key: key);
  static const String path = '/blur';

  @override
  State<TextBlurTestPage> createState() => _TextBlurTestPageState();
}

const String testSentence = 'The best application in the world is 4hours';
const String testWord1 = 'application';
const String testWord2 = 'world';
const String testWord3 = '4hours';
List<String> targetWordsFromApi = [testWord1, testWord2, testWord3];
List<String> targetWords = [];

class _TextBlurTestPageState extends State<TextBlurTestPage> {
  @override
  Widget build(BuildContext context) {
    final dividedWords = divideSentenceByWords(
        sentence: testSentence, targetWords: targetWordsFromApi);

//! 블러처리
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RichText(
            text: TextSpan(
                children: dividedWords.map((words) {
              return TextSpan(
                text: words,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white,
                  foreground: Paint()
                    ..maskFilter = MaskFilter.blur(BlurStyle.normal,
                        words.containsString(targetWords) ? 5.0 : 0),
                ),
              );
            }).toList()),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (targetWords.isEmpty) {
                  targetWords = targetWordsFromApi;
                } else {
                  targetWords = [];
                }
              });
            },
            child: const Text('blur')),
        ElevatedButton(
            onPressed: () => context.go('/rectangle'),
            child: const Text('Next'))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/divide_sentence_by_words.dart';
import 'package:four_hours_client/utils/extensions.dart';
import 'package:go_router/go_router.dart';

class TextRectangleTestPage extends StatefulWidget {
  const TextRectangleTestPage({Key? key}) : super(key: key);
  static const String path = '/rectangle';

  @override
  State<TextRectangleTestPage> createState() => _TextRectangleTestPageState();
}

const String testSentence = 'The best application in the world is 4hours';
const String testWord1 = 'application';
const String testWord2 = 'world';
const String testWord3 = '4hours';
List<String> targetWordsFromApi = [testWord1, testWord2, testWord3];
List<String> targetWords = [];

class _TextRectangleTestPageState extends State<TextRectangleTestPage> {
  @override
  Widget build(BuildContext context) {
    final dividedWords = divideSentenceByWords(
        sentence: testSentence, targetWords: targetWordsFromApi);

//! 박스처리
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
                  color: words.containsString(targetWords)
                      ? Colors.red
                      : Colors.black,
                  backgroundColor: words.containsString(targetWords)
                      ? Colors.red
                      : Colors.white,
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
            child: const Text('Rectangle')),
        ElevatedButton(
            onPressed: () => context.go('/blur'), child: const Text('Back'))
      ],
    );
  }
}

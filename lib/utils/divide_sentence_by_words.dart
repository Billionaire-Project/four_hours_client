List<String> divideSentenceByWords(
    {required String sentence, required List<String> targetWords}) {
  List<String> sentenceWords = sentence.split(" ");

  List<int> excludedWordIndices = [];
  for (int i = 0; i < sentenceWords.length; i++) {
    if (targetWords.contains(sentenceWords[i])) {
      excludedWordIndices.add(i);
    }
  }

  List<List<String>> dividedWords = [];
  int startIndex = 0;
  for (int index in excludedWordIndices) {
    List<String> subWords = sentenceWords.sublist(startIndex, index);
    if (subWords.isNotEmpty) {
      dividedWords.add(subWords);
    }
    dividedWords.add([sentenceWords[index]]);
    startIndex = index + 1;
  }

  List<String> lastWords = sentenceWords.sublist(startIndex);
  if (lastWords.isNotEmpty) {
    dividedWords.add(lastWords);
  }

  List<String> dividedAndJoinWords = [];
  for (int index = 0; index < dividedWords.length; index++) {
    List<String> words = dividedWords[index];

    if (words.length == 1) {
      dividedAndJoinWords = [...dividedAndJoinWords, '${words[0]} '];
    } else {
      dividedAndJoinWords = [...dividedAndJoinWords, '${words.join(' ')} '];
    }
  }

  return dividedAndJoinWords;
}

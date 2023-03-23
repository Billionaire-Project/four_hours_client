extension StringListExtensions on String {
  bool containsString(List<String> targets) {
    for (int i = 0; i < targets.length; i++) {
      if (contains(targets[i])) {
        return contains(targets[i]);
      }
    }
    return false;
  }
}

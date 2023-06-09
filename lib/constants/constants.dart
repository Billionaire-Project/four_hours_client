class LocalStorageKey {
  static const token = 'token';
  static const tokenTimeout = 'tokenTimeout';
  static const uid = 'uid';
}

class SharedPreferenceKey {
  static const temporaryText = 'temporaryText';
}

const int postTextLimit = 9999;

const int autoSaveTime = 3;

const loadMoreOffset = 200;

const Duration skeletonDelay = Duration(milliseconds: 300);

const double writeTimerTotalSeconds = 4 * 60 * 60;

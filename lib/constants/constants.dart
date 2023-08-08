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

const Duration likeAnimationDuration = Duration(milliseconds: 500);

const Duration likeAndSavedHideDuration = Duration(seconds: 3);

const Duration splashScreenDuration = Duration(seconds: 2);

final Uri privacyPolicyUrl =
    Uri.parse('https://sites.google.com/view/4hoursprivacy');

final Uri termsOfUseUrl =
    Uri.parse('https://sites.google.com/view/4hoursuseterm');

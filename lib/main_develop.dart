import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/firebase_options_staging.dart';
import 'package:four_hours_client/my_app.dart';
import 'package:four_hours_client/network/endpoints.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  //안드로이드 기종 상태바, 네비게이션바 투명화
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black.withOpacity(0.002),
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  var child = const Endpoints(
    baseUrl: 'http://lukaid.iptime.org:8000/api/v1',
    child: MyApp(),
  );

  //splash화면을 일정시간 노출시키기 위해 추가
  await Future.delayed(splashScreenDuration);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: child,
    ),
  );
}

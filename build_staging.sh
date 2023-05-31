# echo '============================'
# echo 'copy staging firebase config'
# echo '============================'
# cp ./assets/firebase/staging/firebase_app_id_file.json ./ios/firebase_app_id_file.json

echo '==========='
echo 'archive ios'
echo '==========='
# flutter build ios --flavor staging -t lib/main_staging.dart
flutter build ios -t lib/main_staging.dart

echo '==============='
echo 'archive android'
echo '==============='
# flutter build appbundle --flavor staging -t lib/main_staging.dart
flutter build appbundle -t lib/main_staging.dart
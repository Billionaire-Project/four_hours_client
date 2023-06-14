echo '==============================='
echo 'copy production firebase config'
echo '==============================='
cp ./assets/firebase/production/firebase_app_id_file.json ./ios/firebase_app_id_file.json

echo '==========='
echo 'archive ios'
echo '==========='
flutter build ios --flavor production -t lib/main_production.dart

echo '==============='
echo 'archive android'
echo '==============='
flutter build appbundle --flavor production -t lib/main_production.dart

echo '===================='
echo 'build apk debug'
flutter build apk --debug --target-platform=android-arm64
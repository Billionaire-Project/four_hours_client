flutter build apk --flavor staging --target-platform=android-arm64

flutter run --release --flavor production -t lib/main_production.dart 
flutter run --flavor staging -t lib/main_staging.dart 
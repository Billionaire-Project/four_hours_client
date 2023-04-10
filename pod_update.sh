# clean flutter and pod install of xcode
flutter clean
flutter pub get
cd ./ios
pod install --repo-update
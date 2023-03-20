# clean flutter and pod install of xcode
flutter clean
flutter pub upgrade
flutter pub get
cd ./ios
ls -ls
pod repo update
pod install
pod update

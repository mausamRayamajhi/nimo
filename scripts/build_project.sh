cd packages
for dir in *; do
  if [ -d $dir ]; then
    cd $dir
    flutter clean
    flutter pub get
    cd ..
  fi
done
cd ..
flutter clean
flutter pub get
flutter pub global activate intl_utils
flutter pub global run intl_utils:generate
dart run build_runner build --delete-conflicting-outputs

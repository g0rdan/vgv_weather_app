#!/bin/sh

echo '[cleaning core package]:'
cd core
flutter clean
flutter pub get
cd ..

echo '[cleaning city selection package]:'
cd features/city
flutter clean
flutter pub get
cd ../..

echo '[cleaning temperature switch package]:'
cd features/temperature_switch
flutter clean
flutter pub get
cd ../..

echo '[cleaning theme package]:'
cd features/theme
flutter clean
flutter pub get
cd ../..

echo '[cleaning weather package]:'
cd features/weather
flutter clean
flutter pub get
cd ../..

echo '[cleaning main app]:'
cd ..
flutter clean
flutter pub get

echo -n "Enter enviroment [development, staging, production]: "
read VAR

if [[ "$VAR" = "production" ]]
then
  echo "[build app for production]"
  flutter run --flavor production --target lib/main_production.dart
elif [[ "$VAR" = "staging" ]]
then
  echo "[build app for staging]"
  flutter run --flavor staging --target lib/main_staging.dart
else
  echo "[build app for development]"
  flutter run --flavor development --target lib/main_development.dart
fi
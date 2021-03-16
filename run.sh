#!/bin/sh

echo '[cleaning core package]:'
cd lib/core
flutter clean
flutter pub get
cd ../..

echo '[cleaning city selection package]:'
cd lib/features/city
flutter clean
flutter pub get
cd ../../..

echo '[cleaning measurement system package]:'
cd lib/features/measurement_system
flutter clean
flutter pub get
cd ../../..

echo '[cleaning theme package]:'
cd lib/features/theme
flutter clean
flutter pub get
cd ../../..

echo '[cleaning weather package]:'
cd lib/features/weather
flutter clean
flutter pub get
cd ../../..

echo '[cleaning main app]:'
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
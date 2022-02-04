# brainjogging

A new Flutter project.

Train your brain by playing mini games. Brainjogging provides a collection of mini games, which aim to train your brain, for exampe by solving math tasks or by remembering a sequence of numbers. 

[<img src="https://f-droid.org/badge/get-it-on.png"
      alt="Get it on F-Droid"
      height="80">](https://f-droid.org/packages/de.telefongarten.brainjogging/)
[<img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png"
      alt="Get it on Google Play"
      height="80">](https://play.google.com/store/apps/details?id=de.telefongarten.brainjogging)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Release 

### Android code signing
https://docs.flutter.dev/deployment/android
- create android/key.properties
- flutter build appbundle

### Fastlane metadata
- for f-droid the meta data has to be in fastlane/metadata
- cp -rf android/fastlane/metadata fastlane

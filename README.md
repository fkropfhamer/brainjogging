# brainjogging

A new Flutter project.

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
- for f-droid the meta data hast to be in fastlane/metadata
- cp -rf android/fastlane/metadata fastlane
# brainjogging

A new Flutter project.

Train your brain by playing mini games. Brainjogging provides a collection of mini games, which aim to train your brain, for example by solving math tasks or by remembering a sequence of numbers.

[<img src="https://f-droid.org/badge/get-it-on.png"
      alt="Get it on F-Droid"
      height="80">](https://f-droid.org/packages/de.telefongarten.brainjogging/)

## Release 

### Android code signing
https://docs.flutter.dev/deployment/android
- create android/key.properties
- flutter build appbundle

### Fastlane metadata
- for f-droid the meta data has to be in fastlane/metadata
- cp -rf android/fastlane/metadata fastlane

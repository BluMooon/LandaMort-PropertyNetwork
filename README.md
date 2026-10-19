# LandaMort Frontend Prototype

A Flutter frontend prototype based on the supplied LandaMort concept, activity flow, marketplace, AI, verification, and investment screens.

## Quick start

If you already have a Flutter project:
1. Replace your `lib/main.dart` with this project's `lib/main.dart`.
2. Copy `assets/images/landamort_logo.png` into the same path in your project.
3. Copy the `assets:` section from `pubspec.yaml`.
4. Run:
   ```bash
   flutter pub get
   flutter run
   ```

If you want to use this folder directly:
1. Open the extracted `landamort_frontend` folder in VS Code.
2. In the terminal run:
   ```bash
   flutter create .
   flutter pub get
   flutter run
   ```
   `flutter create .` adds the Android/iOS/Web platform folders and keeps `lib/main.dart`.

## APK

After testing:
```bash
flutter build apk --release
```
APK output is normally under `build/app/outputs/flutter-apk/app-release.apk`.

## Important

This is **frontend/demo code**. Government integrations, OCR, authentication, payments, KYC, live maps, AI APIs, databases and real investment workflows are represented as safe prototype/demo states only. Connect them in the backend phase using authorized APIs and applicable legal/compliance requirements.

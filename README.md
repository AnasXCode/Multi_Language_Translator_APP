# 🌐 Multi Language Translator

A simple and clean Flutter app that translates text between 10 popular languages using Google Translate.

---

## ✨ Features

- Translate text between **10 languages**: English, Spanish, French, Hindi, Urdu, Arabic, Chinese, Japanese, Korean and Russian
- Choose both the source and target language from dropdown menus
- Input validation, so you can't translate an empty field
- Read-only output box for the translated text
- Error message shown if the translation fails (e.g. no internet)
- Clean Material UI with a scrollable layout that adapts when the keyboard opens

---

## 🛠 Tech stack

| Layer | Technology |
|---|---|
| Framework | [Flutter](https://flutter.dev) (Dart) |
| Translation | [translator](https://pub.dev/packages/translator) package |
| UI | Material Design |

---

## 🚀 Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- An Android/iOS device or emulator
- An active internet connection (translation needs it)

### Setup

```bash
# Clone the repo
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Dependencies

Make sure these are in your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  translator: ^1.0.0

flutter:
  assets:
    - assets/images/pic.png
```

---

## 📂 Project structure

```
lib/
└── main.dart        # App entry point, translation screen and logic
assets/
└── images/
    └── pic.png      # App logo shown on the home screen
```

---

## 🧠 How it works

1. Type the text you want to translate.
2. Pick the source and target languages.
3. Tap **Translate**.
4. The result appears in the **Translated Text** box.

Each language is stored as a `code- Name` string (e.g. `ur- Urdu`). The app takes the code before the `-` and passes it to `GoogleTranslator().translate()` as the `from` and `to` language.

---

## ⚠️ Notes

- The `translator` package uses Google Translate's free, unofficial endpoint, so it may be rate-limited or stop working without notice. Use the official Google Cloud Translation API for production apps.
- Requires an internet connection.

---

## 🗺 Roadmap

- [ ] Swap source and target languages with one tap
- [ ] Copy translated text to clipboard
- [ ] Text-to-speech for the translated text
- [ ] Voice input
- [ ] Auto-detect source language
- [ ] More languages
- [ ] Translation history

---

## 🤝 Contributing

Issues and pull requests are welcome. For larger changes, please open an issue first to discuss what you'd like to change.

## 👤 Author

**Malik Anas Ahmed** — [@AnasXCode](https://github.com/AnasXCode)

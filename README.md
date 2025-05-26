
# 🖌️ dual_tone_text

[![Pub Version](https://img.shields.io/pub/v/dual_tone_text)](https://pub.dev/packages/dual_tone_text_codespark)
[![GitHub](https://img.shields.io/badge/GitHub-Katayath--Sai--Kiran%2Fdual__tone__text_codespark-blue?logo=github)](https://github.com/Katayath-Sai-Kiran/dual_tone_text_codespark)


Render sharp dual-colored text in Flutter — vertically, horizontally, or radially split with **solid cutoff** (not gradient). Perfect for high-impact UIs, headers, or artistic effects.

> ✨ Fully **null-safe** and supports **international text**.


## 🚀 Features

✅ Sharp **vertical split** (top/bottom)  
✅ Solid **horizontal split** (left/right)  
✅ Powerful **radial center-out split**  
✅ No blending — **hard color switch**  
✅ Custom percentage-based control  
✅ Works with any `Text` widget  
✅ Designed for performance  


## 🔧 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  dual_tone_text: ^0.0.1
````

Then run:

```bash
flutter pub get
```


## 🧪 Usage

### 🔽 Vertical Split (Top–Bottom)

```dart
DualToneText(
  text: Text(
    'WELCOME',
    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black),
  ),
  bottomColor: Colors.orange,
  splitPercentage: 0.5, // Half black, half orange
  splitType: SplitType.vertical,
)
```

### ➡ Horizontal Split (Left–Right)

```dart
DualToneText(
  text: Text(
    'WELCOME',
    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.blue),
  ),
  bottomColor: Colors.green,
  splitPercentage: 0.6, // 60% blue (left), 40% green (right)
  splitType: SplitType.horizontal,
)
```

### 🌀 Radial Split (Center Out)

```dart
RadialSplitText(
  text: Text(
    'WELCOME',
    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  outerColor: Colors.red,
  radiusCutoff: 0.4, // Inner 40% white, outer 60% red
)
```


## 📷 Preview

> *Demos coming soon with screenshots and `.gif` animation*


## 💡 Roadmap

* [x] Vertical Split
* [x] Horizontal Split
* [x] Radial Split
* [ ] Diagonal Split (↘ / ↖)
* [ ] Text Stroke or Border Split
* [ ] N-Color Sectional Split
* [ ] Animation support for transitions
* [ ] Emoji-safe, RTL and multi-line support
* [ ] Canvas-based rendering for custom shapes


## 🌍 Internationalization

✅ Supports **Unicode** and **multilingual characters**.
🎌 Text like Arabic, Chinese, and Hindi is supported.


## 📁 Example

Clone or open the `example/` folder and run:

```bash
flutter run
```


## 👨‍💻 Maintainer

Developed with 💙 by [Katayath Sai Kiran](https://github.com/kskiran-dev)
📬 Feel free to contribute or suggest improvements!






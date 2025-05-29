

<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/dual_tone_text_codespark/main/assets/banners/banner.png" alt="Banner"/>

# 🖌️ dual_tone_text

[![Pub Version](https://img.shields.io/pub/v/dual_tone_text_codespark)](https://pub.dev/packages/dual_tone_text_codespark)  
[![GitHub](https://img.shields.io/badge/GitHub-Katayath--Sai--Kiran%2Fdual__tone__text_codespark-blue?logo=github)](https://github.com/Katayath-Sai-Kiran/dual_tone_text_codespark)

Render sharp dual-colored text in Flutter — vertically, horizontally, radially, or now with a **wave-shaped horizontal split** for an artistic twist. Perfect for eye-catching UIs, headers, and creative text effects.

> ✨ Fully **null-safe** and supports **international text**.

## 🚀 Features

✅ Sharp vertical split (top/bottom)  
✅ Solid horizontal split (left/right)  
✅ Powerful radial center-out split  
✅ Sinusoidal wave split — wavy horizontal cutoff  
✅ Per-character split (change color after n characters)  
✅ Checkerboard style (alternating color blocks)  
✅ Per-word dual tone (each word switches color)  
✅ No blending — hard color switch  
✅ Custom percentage-based control  
✅ Works with any Text widget  
✅ Designed for performance  

## 🔧 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  dual_tone_text: ^0.0.6
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

### 🌊 Wave Split (Wavy Horizontal Cutoff)

```dart
WaveSplitText(
  text: 'WAVY TEXT',
  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
  topColor: Colors.blue,
  bottomColor: Colors.red,
  amplitude: 8.0,   // Wave height
  frequency: 2.0,   // Number of waves
)
```

### 🌐 Per-Character Dual Tone

```dart
DualToneTextByChar(
  text: "Hello World",
  style: TextStyle(fontSize: 24),
  topColor: Colors.red,
  bottomColor: Colors.blue,
  splitAt: 8,
)
```

### 🔳 Checkerboard Pattern

```dart
DualToneCheckerboardText(
  text: "Checkerboard",
  style: TextStyle(fontSize: 24),
  color1: Colors.green,
  color2: Colors.orange,
)
```

### 🪄 Split Per Word

```dart
DualToneWordSplitText(
  text: "Split Per Word",
  style: TextStyle(fontSize: 24),
  color1: Colors.purple,
  color2: Colors.teal,
)
```

## 📷 Preview

<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/dual_tone_text_codespark/main/assets/screenshots/300x650-01.png" alt="Vertical Split" width="150"/>
<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/dual_tone_text_codespark/main/assets/screenshots/300x650-02.png" alt="Horizontal Split" width="150"/>
<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/dual_tone_text_codespark/main/assets/screenshots/300x650-03.png" alt="Radial Split" width="150"/>
<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/dual_tone_text_codespark/main/assets/screenshots/300x650-04.png" alt="Wave Split" width="150"/>

## 💡 Roadmap

* [x] Vertical Split
* [x] Horizontal Split
* [x] Radial Split
* [x] Wave Split
* [x] Checker Text
* [x] Character-based Split
* [x] Word-based Split
* [ ] Diagonal Split (↘ / ↖)
* [ ] Text Stroke or Border Split
* [ ] N-Color Sectional Split
* [ ] Animation support for transitions
* [ ] Emoji-safe, RTL and multi-line support
* [ ] Canvas-based rendering for custom shapes

## 🌍 Internationalization

✅ Supports **Unicode** and **multilingual characters**.
🎌 Text like Arabic, Chinese, and Hindi is fully supported.

## 📁 Example

Clone or open the `example/` folder and run:

```bash
flutter run
```


## 🎉 Check Out My Other Packages!

Explore more Flutter packages by [Katayath Sai Kiran](https://github.com/Katayath-Sai-Kiran) to add unique UI effects and functionality to your apps.


## 👨‍💻 Maintainer

Developed with 💙 by [Katayath Sai Kiran](https://github.com/Katayath-Sai-Kiran)
📬 Contributions and suggestions are always welcome!



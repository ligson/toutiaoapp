# toutiaoapp

使用flutter模仿今日头条

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## 开发中遇到的问题

1. 安卓应用卸载后无法安装打开
   
   ```
   打开文件： /android/app/src/main/AndroidManifest.xml

   第一行： 其中的package记住 然后执行 adb uninstall com.example.flutterdemo
   ```

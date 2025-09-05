# 🏡 DevProjects - Cryptocurrency price listing mobile app

This is an open source project from [DevProjects](http://www.codementor.io/projects). Feedback and questions are welcome!
🔗 Project requirements: [Cryptocurrency price listing mobile app](https://www.codementor.io/projects/mobile/cryptocurrency-price-listing-mobile-app-atx32meo88)

## 📖 Description
This project is a Flutter app that displays a list of cryptocurrencies with their details using the Coinlore API (Tickers endpoint). The goal is to show the most important data about each cryptocurrency in a simple, clean UI.
---

## 🚀 Features
[//]: # (ToDo: ==> Add Features)
[//]: # (-   **Random Palette Generation**)

[//]: # (-   **Color Display:** Colors are presented in individual cards.)

[//]: # (-   **Hex Code Visibility:** Each color card displays its corresponding hexadecimal value.)

[//]: # (-   **Responsive Grid Layout:** Colors are displayed in a grid that adapts to screen space &#40;currently 2 columns&#41;.)

[//]: # (-   **Notification System:**)

[//]: # (    *   Requests user permission to display notifications.)

[//]: # (    *   Handles cases where notification permission is denied or permanently denied by prompting the user to open app settings.)

[//]: # (    *   Displays a notification &#40;e.g., when a color's HEX code is copied&#41;)

[//]: # (-   **Shake Detection:** Shake the device to generate a new palette.)

---

## 📸 Screenshots & Demo
[//]: # (ToDo: ==> Add Screenshots)

<img src="assets/screenshot_.png" alt="App Main Screen" width="200"/>
<img src="assets/screenshot_feature_x.png" alt="App Feature X" width="200"/>
---

## 🛠️ Tech Stack
Built with **Flutter** (using the Dart programming language).
- **Key Packages**:

[//]:# (ToDo: ==> Add Key Packages)
[//]: # (    - `flutter_local_notifications`: For displaying local notifications.)
[//]: # (    - `permission_handler`: For checking and requesting permissions, and guiding users to app settings.)
[//]: # (    - `shake`: For detect phone shakes.)
---

## 📂 Project Structure 

[//]: # (ToDo: ==> Add Project Structure)
```
lib/
│
├── core/
│   ├── network/
│   │   ├── api_exceptions.dart
│   │   └── dio_client.dart
│   ├── themes/
│   │   └── app_theme.dart
│   └── utils/
│       └── constants.dart
│
├── features/
│   └── crypto_currency/
│       ├── data/
│       │   ├── api_repository.dart
│       │   ├── api_service.dart
│       │   └── models/
│       │       └── tickers_model.dart
│       ├── presentation/
│       │   └── ticker_page.dart
│       └── providers/
│           ├── tickers_provider.dart
│           └── __provider.dart
│
├── widgets/
│   └── __.dart
│
└── main.dart
```
---

## 🟦 Requirements
* [x] Display a list of cryptocurrencies on the home screen:
  *  [x] Name (e.g., Bitcoin)
  *  [x] Symbol (e.g., BTC)
  *  [x] Current Price in USD (e.g., $6545)
* [x] (Extra challenge) Include these elements to the list item as well:
  *  [ ] Rank of the cryptocurrency (e.g. #1)
  *  [x] Percentage change in the last 7 days (e.g. -1.07%)

* [x] Sort data by:
  * [x] Alphabet
  * [x] Rank
---

## ⚙️ Installation & Setup

### Prerequisites
-   **Flutter SDK:** Ensure Flutter is installed on your system. For installation instructions, visit the [official Flutter documentation](https://flutter.dev/docs/get-started/install).
-   **Dart SDK:** This is typically bundled with the Flutter SDK.
-   **IDE:** An Integrated Development Environment like Android Studio (with the Flutter plugin) or Visual Studio Code (with the Flutter extension).
-   **Android Specific (for Notifications on API 33+):**
    Ensure your `android/app/src/main/AndroidManifest.xml` includes:
    ```
    <!--    Internet permission-->
    <uses-permission android:name="android.permission.INTERNET"/>
    ```


### Steps to Run
1.  **Clone the repository (if applicable):**
    If the project is hosted on a version control platform like GitHub, clone it to your local machine:

```
git clone https://github.com/your-username/Crypto-Currency-Price.git
```

2.  **Navigate to the project directory:**
    Change your current directory to the project folder:

```
cd crypto_currency_price
```    

3.  **Run the application:**
    Use the Flutter command to run the application:

```
flutter pub get
flutter run    
```
---

[//]: # (ToDo: ==> Add Description)
## 📖 Usage 
1. Launch the app
2. 
---

## 🤝Contributing

### Contributions are welcome! 🎉

1. Fork the repository
2. Create a new branch → `(git checkout -b feature-branch)`
3. Commit changes → `git commit -m "Add feature XYZ"`
4. Push changes → `git push origin feature-branch`
5. Open a Pull Request.
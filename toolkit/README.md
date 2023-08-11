#
# **Tool kit**
The Tool Kit Package is a comprehensive collection of utility classes, helper functions, and reusable
components for Flutter. This package aims to provide developers with a set of tools and resources
to simplify common tasks, improve productivity, and enhance the development experience in Flutter projects.
The Tool Kit Package covers a wide range of functionalities, making it a valuable asset for Developers.


**How to use this package in your project:**
•	**1. Add the package location in your pubspec.yaml as**
```
tool_kit:
git:
url: https://bitbucket.org/visionet-projects/toolkit.git
```
**•	2. Now we can import the package.**
```
import 'package:tool_kit/tool_kit.dart';
```

- Tool kit module contains

1. Api
2. Bio metrics
3. Bottom Navigation bar
4. Dialog
5. Encryption
6. Internet
7. key Chain
8. Loading
9. Route
10. Share preference
11. Snackbar
12. Toast

1. **Api**
   The API Utils is a set of utility functions and classes for handling API requests and responses in applications.
   It provides a convenient and standardized way to interact with APIs, manage HTTP requests, handle errors,
   parse responses, and perform common API-related tasks. The API Utils package simplifies API integration
   and helps ensure consistent and reliable communication with server endpoints.


2. **Bio metrics**
   The Biometrics Utils is a package for Flutter that provides a set of utility functions and classes
   for integrating biometric authentication into your applications. It simplifies the process of integrating
   biometric authentication methods, such as fingerprint or face recognition, into your Flutter projects.
   The Biometrics Utils package offers a convenient and standardized way to handle biometric authentication,
   ensuring a secure and user-friendly authentication experience.


3. **Bottom Navigation bar**
   The Bottom Navigation Bar is a common user interface component in Flutter that allows for easy navigation
   between different screens or sections of an application. It is typically placed at the bottom of the screen
   and provides quick access to primary app functionalities. The Bottom Navigation Bar package for Flutter offers
   a customizable and intuitive way to implement a bottom navigation bar in applications.
```
  BottomNavigation().getBottomNavigationBar([
    BottomNavigationModel(
        id: 1,
        title: "Home",
        heading: "Home",
        icon: "home.png",
        activeIcon: "homw_active.png",
        screen: HomeScreen())
  ], 0, Colors.blue, Colors.white, (index) => {});
```
4. **Dialog**
   The Dialog Utils is a package for Flutter that provides utility functions and classes for creating and managing dialogs
   in your applications. It simplifies the process of displaying dialogs, alerts, and confirmation prompts to the user,
   allowing for easy communication and interaction. The Dialog Utils package offers a convenient and standardized way
   to handle dialogs, ensuring a seamless and user-friendly experience.
```
 DialogUtils.showCustomDialog(context: context, themeColor: CustomColor.blue,heading: "Logout !",desc: "Are you sure ?",positiveBtn: "Yes",positiveClick: (){
    
  },negativeBtn: "No",negativeClick: (){
   
  },willPop: false);
})
```
5. **Encryption**
   The AES Encryption Utils is a package for Flutter that provides utility functions and classes for performing
   AES (Advanced Encryption Standard) encryption and decryption operations in your applications. It simplifies the
   process of implementing AES encryption and decryption using various modes and padding options.
   The AES Encryption Utils package offers a convenient and standardized way to encrypt and decrypt data securely.
```
  EncryptionUtils().encryptData("originalData", "key");
  EncryptionUtils().decryptData("encryptData", "key");
```

6. **Internet**
   The Internet Utils package for Flutter provides utility functions and classes for working with internet connectivity
   in your applications. It simplifies the process of checking network connectivity, monitoring network status changes,
   and performing network-related operations. The Internet Utils package offers a convenient and standardized way to
   handle internet connectivity in your Flutter projects.
```
InternetInfoUtils.hasConnection();

```
7. **key Chain**
   The Key Chain Utils package for Flutter provides utility functions and classes for securely storing and
   retrieving sensitive data using the device's keychain or keystore. It simplifies the process of securely managing
   sensitive information, such as API keys, access tokens, passwords, or any other confidential data
   that needs to be protected. The Key Chain Utils package offers a convenient and standardized way to
   handle secure data storage in your Flutter projects.
```
 KeyChainUtils.setValue("key", "value");
  KeyChainUtils.getValue("key");
```

8. **Loading**
   The Loading Utils package for Flutter provides utility functions and classes for managing loading states
   and displaying loading indicators in your applications. It simplifies the process of handling asynchronous operations,
   such as data fetching or processing, and provides a convenient way to communicate the loading state to the user.
   The Loading Utils package offers a standardized and customizable approach to managing loading states in projects.
```
LoadingWidget(message: "Loading...",logo:Image.asserts('loading.gif'));

```
9. **Route**
   The Route Utils package for Flutter provides utility functions and classes for managing navigation routes
   in your application. It simplifies the process of navigating between screens, managing route transitions,
   passing arguments between screens, and handling route-related operations.
   The Route Utils package offers a convenient and standardized way to handle navigation in your Flutter projects.
```
AppRoute.getRoutes([RouteModel("LOGIN_SCREEN", LoginScreen())]);

```

10. **Share preference**
    The Share Preference Utils package for Flutter provides utility functions and classes for managing persistent
    key-value data using shared preferences. It simplifies the process of storing and retrieving data locally on the device,
    allowing you to easily manage user preferences, app settings, or any other persistent data. The Share Preference Utils
    package offers a convenient and standardized way to handle shared preferences in your Flutter projects.
```
SharedPreferenceUtils().setString("key", "Value");
SharedPreferenceUtils().getString("key");
```
11. **Snackbar**
    The Snackbar Utils package for Flutter provides utility functions and classes for displaying snackbar notifications
    in your application. It simplifies the process of showing temporary messages or alerts to the user, allowing you
    to provide important information or prompt for actions. The Snackbar Utils package offers a convenient and
    standardized way to handle snackbar notifications in your Flutter projects.
```
SnackBarUtils.showSuccess(context, "Success");
SnackBarUtils.showError(context, "Error");
```

12. **Toast**
    The Toast Utils package for Flutter provides utility functions and classes for displaying toast messages
    in your application. It simplifies the process of showing temporary messages or alerts to the user, allowing you
    to provide important information or feedback. The Toast Utils package offers a convenient and standardized way
    to handle toast notifications in your Flutter projects.
```
ToastUtils.showMessage("Hi Welcome");
```















# **Environment Setup**

**Prerequisites**

Before starting the Flutter environment setup, ensure that you have the following prerequisites:

1. Operating System: Flutter supports Windows, macOS, and Linux.
2. Disk Space: Ensure you have enough disk space to download and install the required tools and dependencies.
3. Internet Connection: A stable internet connection is necessary to download Flutter SDK and other dependencies.

**Step 1: Install Flutter**

1. Visit the official Flutter website: https://flutter.dev.
2. Click on the "Get Started" button.
3. Download the appropriate Flutter SDK package for your operating system.
4. Extract the downloaded package to a suitable location on your machine.

**Step 2: Add Flutter to PATH**

To run Flutter commands from anywhere on your system, you need to add the Flutter binary path to your system's PATH variable:

1. Find the location where you extracted the Flutter SDK.
2. Update your system's environment variables and add the Flutter binary path.

- For Windows: Open "System Properties" \> "Environment Variables" \> Edit the PATH variable and append the Flutter binary path.
- For macOS/Linux: Edit your shell profile (e.g., .bash\_profile, .zshrc) and add the following line at the end:

```

export PATH="$PATH:/path/to/flutter/bin"

```

- Save the changes and restart your terminal or command prompt.

**Step 3: Install Dart SDK**

1. Visit the Dart website: https://dart.dev.
2. Download the Dart SDK package for your operating system.
3. Extract the downloaded package to a directory of your choice.
4. Update your system's environment variables and add the Dart binary path.

- For Windows: Similar to Step 2, edit the PATH variable and append the Dart binary path.
- For macOS/Linux: Edit your shell profile and add the following line at the end:

```

export PATH="$PATH:/path/to/dart-sdk/bin"

```

- Save the changes and restart your terminal or command prompt.

**Step 4: Configure IDE**

Choose an Integrated Development Environment (IDE) for Flutter development. The recommended options are Visual Studio Code (VS Code) and Android Studio.

Visual Studio Code (VS Code):

1. Install VS Code from the official website: https://code.visualstudio.com.
2. Open VS Code.
3. Install the Flutter and Dart plugins. Search for "Flutter" and "Dart" in the Extensions view, then click on "Install" for both plugins.
4. Visual Studio Code Suggested extensions:

- [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) - language support and debugger for Visual Studio Code
- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) - Proper Flutter support, debugger, etc. It should install the Dart extension as well, if not download it manually.
- [Awesome Flutter Snippets](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets) - a list of snippets that get autocomplete for quicker and more convenient development.
- [Image Preview](https://marketplace.visualstudio.com/items?itemName=kisstkondoros.vscode-gutter-preview) - Shows image preview in the gutter and on hover
- [Color code](https://marketplace.visualstudio.com/items?itemName=salkuadrat.fluttercolour) - Visual Studio Code Extension to show color preview of Colour and Colors

5. VS Code is now ready for Flutter development.

Android Studio:

1. Download and install Android Studio from the official website: https://developer.android.com/studio.
2. Open Android Studio.
3. Install the Flutter and Dart plugins. Go to "Preferences" (macOS) or "Settings" (Windows/Linux) \> "Plugins" \> Search for "Flutter" and "Dart" \> Click on "Install" for both plugins.
4. Android Studio is now ready for Flutter development.

**Step 5: Run Flutter Doctor**

1. Open a terminal or command prompt.
2. Run the following command to check if Flutter is installed correctly and to identify any missing dependencies or configuration issues:

```

flutter doctor

```

Address any reported issues by following the doctor command's instructions. It may guide you on installing additional software or fixing any environment-related problems.

**Step 6: Choose a Development Platform**

Decide whether you want to develop for Android, iOS, or both. Each platform requires specific tools and configurations.

Android Development:

1. Install Android Studio if you haven't done so already (refer to Step 4).
2. Open Android Studio and go to "Preferences" (macOS) or "Settings" (Windows/Linux) \> "Appearance & Behavior" \> "System Settings" \> "Android SDK".
3. Install the necessary SDKs and tools as prompted. Make sure to include the latest Android SDK, Android SDK Platform-Tools, and Android SDK Build-Tools.
4. Create a new Android Virtual Device (AVD) to run your Flutter app on an emulator. Open the "AVD Manager" in Android Studio and follow the instructions to set up a virtual device.

iOS Development:

1. On macOS, you can develop for iOS using Flutter.
2. Ensure that you have Xcode installed from the Mac App Store.
3. Run the following command to install the required Xcode command-line tools:

```

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

```

1. Set up an iOS simulator or connect a physical iOS device to your Mac to test and run your Flutter app.

**Step 7: Clone the project**

1. Open a terminal or command prompt.
2. Navigate to the directory where you want to create your Flutter project:

```

cd /path/to/your/project/directory

```

1. Run the following command to clone the project

```

git clone git\_url

```

Wait for the project to be created. This process may take a few minutes, depending on your internet connection speed.

Once the project is created successfully, you will see a confirmation message.

**Step 8: Run the App**

2. Navigate to the project directory:

```

cd my\_project\_name

```

3. Connect a physical device or start an emulator for the target platform (Android or iOS).
4. Run the following command to build and launch your Flutter app on the connected device or emulator:

```

flutter run

```

5. Wait for the app to build and launch. You should see your Flutter app running on the target device or emulator.

Congratulations! Your Flutter environment is now set up, and you're ready to start developing Flutter applications. Remember to keep your Flutter SDK and Dart SDK updated by running flutter upgrade periodically to benefit from the latest features and bug fixes.


## **Naming convention**

Need to follow the following naming conventions throughout the project.

**1. File Naming:**

- Dart file names should be lowercase.
- Use underscores (\_) to separate words.
- Example: `home_screen.dart`, `api_service.dart`, `user_model.dart`

**2. Class Naming:**

- Class names should follow UpperCamelCase convention.
- The first letter of each word should be capitalized.
- Example: `HomePage`, `UserModel`, `AuthService`

**3. Variable and Constant Naming:**

- Variable and constant names should be lowercase.
- Use underscores (\_) to separate words.
- Example: `my_variable`, `user_name`, `api_endpoint`
- Constants should be written in all capital letters with underscores.
- Example: `API_KEY`, `APP_NAME`

**4. Widget Naming:**

- Widget names should follow UpperCamelCase convention.
- Prefix the widget name with a relevant term to indicate its purpose.
- Example: `MyButton`, `UserProfileCard`, `AnimatedLogo`

**5. Method Naming:**

- Method names should be lowercase.
- Use underscores (\_) to separate words.
- Example: `calculate_sum()`, `fetch_data()`, `login_user()`
- Use descriptive names that indicate the purpose or action performed by the method.

**8. Boolean Variables and Methods:**

- Boolean variables should use a question mark at the end to imply a yes/no question.
- Example: `is_loading`, `is_authenticated()`, `has_error()`




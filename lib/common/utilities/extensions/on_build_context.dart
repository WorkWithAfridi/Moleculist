import 'package:flutter/material.dart';

extension GlobalX on BuildContext {
  // Hide the keyboard
  void hideKeyboard() => FocusScope.of(this).unfocus();

  // Show a Snackbar message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  // Show a modal dialog
  Future<T?> showModal<T>(Widget dialog) {
    return showDialog<T>(context: this, builder: (_) => dialog);
  }

  // Show a loading dialog with a custom message
  void showLoadingDialog({String message = 'Loading...'}) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
  }

  // Dismiss the loading dialog
  void dismissLoadingDialog() {
    Navigator.of(this, rootNavigator: true).pop();
  }

  // Show a simple toast-like message (using ScaffoldMessenger)
  void showToast(String message, {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message), duration: duration));
  }

  // Push replacement (replaces the current screen with a new one)
  Future<T?> replaceWith<T>(Widget page) {
    return Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  // Show an alert dialog with a message and optional buttons
  Future<void> showAlertDialog({
    required String title,
    required String content,
    String? confirmButtonText,
    void Function()? onConfirm,
    String? cancelButtonText,
    void Function()? onCancel,
  }) async {
    await showDialog<void>(
      context: this,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelButtonText != null)
            TextButton(
              onPressed: () {
                onCancel?.call();
                Navigator.of(this).pop();
              },
              child: Text(cancelButtonText),
            ),
          if (confirmButtonText != null)
            TextButton(
              onPressed: () {
                onConfirm?.call();
                Navigator.of(this).pop();
              },
              child: Text(confirmButtonText),
            ),
        ],
      ),
    );
  }

  // Find the nearest ScaffoldMessenger
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  // Media query
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isDarkMode => MediaQuery.of(this).platformBrightness == Brightness.dark;

  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension NavigationExtensions on BuildContext {
  // Push a new screen onto the stack
  Future<T?> navigateTo<T>(Widget page) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  // Push a new screen and replace the current one
  Future<T?> navigateOff<T>(Widget page) {
    return Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  // Push a new screen and remove all previous routes
  Future<T?> navigateAndRemoveAll<T>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (Route<dynamic> route) => false);
  }

  // Push a named route
  Future<T?> navigateToNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  // Push a named route and replace the current one
  Future<T?> navigateOffNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed<T?, T>(routeName, arguments: arguments);
  }

  // Push a named route and remove all previous routes
  Future<T?> navigateAndRemoveAllNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(routeName, (Route<dynamic> route) => false, arguments: arguments);
  }

  // Pop until a specific named route is reached
  void popUntilNamed(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  // Pop back to the root
  void popToRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  // Pop N screens
  void popN(int n) {
    for (int i = 0; i < n; i++) {
      Navigator.of(this).pop();
    }
  }

  // Pop the current screen
  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  // Check if we can pop
  bool canPop() {
    return Navigator.of(this).canPop();
  }

  // Try to maybe pop the current screen
  Future<bool> maybePop<T>([T? result]) {
    return Navigator.of(this).maybePop<T>(result);
  }
}

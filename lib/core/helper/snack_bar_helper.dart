import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

mixin SnackBarHelper {
  void showLoadingSnackBar() {
    snackbarKey.currentState
        ?.showSnackBar(
          const SnackBar(
            content: Center(
                // child: LoginPage(),
                ),
            backgroundColor: Colors.transparent,
            duration: Duration(days: 1),
          ),
        )
        .closed
        .then((reason) {
      if (reason == SnackBarClosedReason.swipe) showLoadingSnackBar();
    });
  }

  void removeSnackBar(BuildContext context) {
    snackbarKey.currentState?.removeCurrentSnackBar();
  }

  void showErrorSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ""),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 10),
      ),
    );
  }

  void removeErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  void showSuccessSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("SUCCESS"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 10),
      ),
    );
  }

  void showWarningSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ""),
        backgroundColor: Colors.orange,
        duration: const Duration(
          seconds: 18,
        ),
      ),
    );
  }

  void removeShowNoInternetSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}

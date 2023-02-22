// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CustomSnackAlert {
  static SnackBar showErrorSnackBar({required String message}) => SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: message,
          contentType: ContentType.failure,
        ),
      );

  static SnackBar showSuccessSnackBar({required String message}) => SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Good News!',
          message: message,
          contentType: ContentType.success,
        ),
      );
}

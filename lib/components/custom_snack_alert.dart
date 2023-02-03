// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class CustomSnackAlert {
  static SnackBar showErrorSnackBar() => SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: kUserError,
          contentType: ContentType.failure,
        ),
      );
}

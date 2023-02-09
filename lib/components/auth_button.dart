// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/storage_provider.dart';

class AuthButton extends ConsumerWidget {
  final String image;
  final double size;
  final Function()? onTap;

  const AuthButton({
    super.key,
    required this.image,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageURL = ref.watch(getDownloadURLProvider(image));

    return imageURL.when(
      data: (data) => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Image.network(
            data,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      error: (error, stacktrace) => Text(
        error.toString(),
      ),
      loading: () => const LoadingSpinner(),
    );
  }
}

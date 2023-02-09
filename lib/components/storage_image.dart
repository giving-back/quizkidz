// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/storage_provider.dart';

class StorageImage extends ConsumerWidget {
  final String image;
  final double size;

  const StorageImage({
    super.key,
    required this.image,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageURL = ref.watch(getDownloadURLProvider(image));

    return imageURL.when(
      data: (data) => SizedBox(
        width: size,
        height: size,
        child: Image.network(
          data,
          fit: BoxFit.scaleDown,
        ),
      ),
      error: (error, stacktrace) => Text(
        error.toString(),
      ),
      loading: () => const LoadingSpinner(),
    );
  }
}

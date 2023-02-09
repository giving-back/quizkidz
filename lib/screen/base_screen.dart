// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

// Project imports:
import 'package:quizkidz/providers/state_provider.dart';
import 'package:quizkidz/screen/home_screen.dart';
import 'package:quizkidz/screen/profile_screen.dart';

class BaseScreen extends ConsumerWidget {
  final String uid;

  const BaseScreen({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);

    final List<Widget> widgetOptions = <Widget>[
      HomeScreen(
        uid: uid,
      ),
      ProfileScreen(
        uid: uid,
      ),
    ];

    return Scaffold(
      body: widgetOptions.elementAt(
        tabIndex,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: GNav(
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.grey,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            duration: const Duration(milliseconds: 400),
            color: Colors.grey,
            tabs: const [
              GButton(
                icon: LineIcons.home,
              ),
              GButton(
                icon: LineIcons.user,
              ),
            ],
            selectedIndex: tabIndex,
            onTabChange: (index) {
              ref.read(tabIndexProvider.notifier).state = index;
            },
          ),
        ),
      ),
    );
  }
}

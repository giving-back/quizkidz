// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/components/common_app_bar.dart';
import 'package:quizkidz/util/util.dart';

class NewUserLayout extends StatelessWidget {
  final Widget item;

  const NewUserLayout({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        showAlert: false,
      ),
      body: Container(
        color: const Color(kBlueColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 35,
              child: Container(),
            ),
            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(kWhiteColor),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: item,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

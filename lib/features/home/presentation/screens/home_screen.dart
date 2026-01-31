import 'package:flutter/material.dart';

import '../../../../core/constants/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'You have succesfully logged in!',
          style: Styles.instance.textHeadLinLarg(),
        ),
      ),
    );
  }
}

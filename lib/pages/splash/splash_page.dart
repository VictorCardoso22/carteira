import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../design-system/components/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((_) => Get.toNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSupportLightColor,
      child: Center(
        child: SizedBox(
          width: 240,
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}

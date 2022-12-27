import 'package:carteira/design-system/components/constants.dart';
import 'package:flutter/material.dart';

class CustomSecondaryButton extends StatelessWidget {
  CustomSecondaryButton(
      {key,
      required String titulo,
      required VoidCallback onPressed,
      bool small = false})
      : _titulo = titulo,
        _onPressed = onPressed,
        _small = small,
        super(key: key);

  String _titulo;
  VoidCallback _onPressed;

  bool _small;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: Text(_titulo),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: kPrimaryColor, width: 2)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        fixedSize: _small == false ? const Size(328, 53) : Size(153, 53),
        primary: kSupportLightColor,
        onPrimary: kPrimaryColor,
      ),
    );
  }
}

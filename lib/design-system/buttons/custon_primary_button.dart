import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  CustomPrimaryButton(
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
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        fixedSize: _small == false ? const Size(328, 53) : Size(153, 53),
        primary: Color(0xFF747474),
        onPrimary: Color(0xFFffffff),
      ),
    );
  }
}

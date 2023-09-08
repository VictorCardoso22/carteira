import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:carteira/design-system/components/colors.dart';
import 'package:carteira/pages/dados/pages/anexo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IconButtonFoto extends StatefulWidget {
  bool isEnabled;
  AnexoPageState anexoPageState;
  String stringArquivo;

  IconButtonFoto({Key? key, required this.isEnabled, required this.anexoPageState, required this.stringArquivo}) : super(key: key);

  @override
  State<IconButtonFoto> createState() => _IconButtonFotoState();
}

class _IconButtonFotoState extends State<IconButtonFoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: widget.isEnabled?  kPrimaryLightColor : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: (() => Get.to(
              () => CameraCamera(
            onFile: (File file) => widget.anexoPageState.showPreview(
                widget.stringArquivo, file),
          ),
        )),
        icon:  Icon(
          Icons.camera_alt,
          color: widget.isEnabled?  kPrimaryColor : Colors.black12,
        ),
        // child: Text("Tire uma Foto"),
      ),
    );
  }
}

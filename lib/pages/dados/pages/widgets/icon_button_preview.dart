
import 'dart:io';
import 'dart:typed_data';

import 'package:carteira/design-system/components/colors.dart';
import 'package:carteira/pages/dados/pages/anexo_page.dart';
import 'package:carteira/pages/dados/pages/widgets/preview_page.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IconButtonPreview extends StatefulWidget {
  bool isEnabled;
  AnexoPageState anexoPageState;
  Uint8List? uint8Arquivo;

  IconButtonPreview({Key? key, required this.isEnabled, required this.anexoPageState, required this.uint8Arquivo}) : super(key: key);

  @override
  State<IconButtonPreview> createState() => _IconButtonPreviewState();
}

class _IconButtonPreviewState extends State<IconButtonPreview> {
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
        onPressed: (() async => await Get.to(() => PreviewPage(fileUint: widget.uint8Arquivo!, readMode: true,))),
        icon:  Icon(
          Icons.preview,
          color: widget.isEnabled?  kPrimaryColor : Colors.black12,
        ),
        // child: Text("Tire uma Foto"),
      ),
    );
  }
}

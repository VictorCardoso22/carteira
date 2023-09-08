
import 'package:carteira/design-system/components/colors.dart';
import 'package:carteira/pages/dados/pages/anexo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IconButtonPicker extends StatefulWidget {
  bool isEnabled;
  AnexoPageState anexoPageState;
  String stringArquivo;

  IconButtonPicker({Key? key, required this.isEnabled, required this.anexoPageState, required this.stringArquivo}) : super(key: key);

  @override
  State<IconButtonPicker> createState() => _IconButtonPickerState();
}

class _IconButtonPickerState extends State<IconButtonPicker> {
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
        onPressed: (() => widget.anexoPageState.getFileFromGallery(
            widget.stringArquivo)),
        icon:  Icon(
          Icons.drive_file_move_rounded,
          color: widget.isEnabled?  kPrimaryColor : Colors.black12,
        ),
        // child: Text("Tire uma Foto"),
      ),
    );
  }
}

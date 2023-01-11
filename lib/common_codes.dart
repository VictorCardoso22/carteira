
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class GlobalTimeStamp {
  static DateTime now = DateTime.now();
}

toastAviso(String aviso, Color color, BuildContext context) {
  Toast.show(aviso,
      duration: 6,
      gravity: Toast.top,
      backgroundRadius: 80,
      backgroundColor: color);
}

showAlertDialog(BuildContext context, String aviso)
{
  // configura o button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Aviso"),
    content: Text(aviso),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

pushPage(BuildContext context, page){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );

}

AlertDialog buildAlertDialog(
    {String? titulo, String? aceitar, String? cancelar, String? text, VoidCallback? onPressedConfirma, BuildContext? context}) {
  Widget cancelaButton;
  Widget publicaButton;
  cancelaButton = TextButton(
    child: Text(cancelar!),
    onPressed: () {
      Navigator.of(context!).pop();
    },
  );
  publicaButton = TextButton(
      child: Text(aceitar!),
      onPressed: onPressedConfirma );

  AlertDialog alert = AlertDialog(
    title: Text(titulo!),
    content: Text(text!),
    actions: [
      cancelaButton,
      publicaButton,
    ],
  );
  return alert;
}
/// Exemplo de Dialog
// alertDialogConfirmacao() {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return buildAlertDialog(
//             context: context,
//             titulo: "Publicar Escala",
//             aceitar: "Publicar",
//             cancelar: "Cancelar",
//             text:
//             "Ao clicar em publicar essa escala ficará disponível para todos os militares escalados",
//             onPressedConfirma: () {
//             });
//       });
// }

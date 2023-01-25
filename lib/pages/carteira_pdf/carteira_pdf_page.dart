import 'dart:typed_data';

import 'package:carteira/common_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CarteiraPdfPage extends StatelessWidget {
  const CarteiraPdfPage({Key? key}) : super(key: key);

  Future<Uint8List> _createPdf() async {
    final pdf = pw.Document();
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/logo.png')).buffer.asUint8List(),
    );
    // final perfilImage = pw.MemoryImage(
    //   (await rootBundle.load('${DataUser.dataUser!.fotoAnexo}'))
    //       .buffer
    //       .asUint8List(),
    // );

    final qrCode = pw.MemoryImage(
      (await rootBundle.load('assets/qrcode.png')).buffer.asUint8List(),
    );

    final netImage = await networkImage(
      "${DataUser.dataUser!.fotoAnexo}",
    );

    pdf.addPage(
      pw.MultiPage(
          // pageFormat: PdfPageFormat.a4,
          orientation: pw.PageOrientation.portrait,
          footer: (pw.Context context) {
            return pw.Container(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                    'Pag. ${context.pageNumber} de ${context.pagesCount}',
                    style: pw.TextStyle(fontSize: 6, color: PdfColors.grey)));
          },
          build: (pw.Context context) => [
                pw.Partitions(children: [
                  pw.Partition(
                    child: pw.Container(
                      // width: 280,
                      // decoration: pw.BoxDecoration(
                      //   border: pw.Border.all(
                      //     color: PdfColor.fromHex('#999999'),
                      //   ),
                      //   borderRadius: const pw.BorderRadius.all(
                      //       pw.Radius.circular(
                      //           6.0) //                 <--- border radius here
                      //       ),
                      // ),
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            width: 260,
                            height: 170,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                color: PdfColor.fromHex('#333333'),
                              ),
                              borderRadius: const pw.BorderRadius.all(
                                  pw.Radius.circular(
                                      3.0) //                 <--- border radius here
                                  ),
                            ),
                            padding: const pw.EdgeInsets.all(12),
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        'CARTEIRA DE TRANSPORTE ESTUDANTIL',
                                        style: pw.TextStyle(
                                            fontSize: 8,
                                            fontWeight: pw.FontWeight.bold),
                                      ),
                                      // pw.Spacer(),
                                      pw.SizedBox(width: 20),
                                      pw.SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: pw.Image(logoImage),
                                      ),
                                    ]),
                                pw.SizedBox(height: 15),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: pw.Image(netImage),
                                      ),
                                      pw.SizedBox(width: 15),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text(
                                              '${DataUser.dataUser!.nomeCompleto}',
                                              style: const pw.TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            pw.Text(
                                              'CPF: ${DataUser.dataUser!.cpf}',
                                              style: const pw.TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            pw.Text(
                                              'Instituião: ${DataUser.dataUser!.instituicao}',
                                              style: const pw.TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            pw.Text(
                                              'Curso: ${DataUser.dataUser!.curso}',
                                              style: const pw.TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            pw.Text(
                                              'Turno: ${DataUser.dataUser!.turno}',
                                              style: const pw.TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            pw.Text(
                                              'Curso: ${DataUser.dataUser!.numeroMatriculaFaculdade}',
                                              style: const pw.TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            pw.Text(
                                              'Validade: xx/xx/xxxx',
                                              style: const pw.TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                          ]),
                                    ]),
                                pw.SizedBox(height: 10),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(
                                        width: 60,
                                        height: 30,
                                        child: pw.Image(qrCode),
                                      ),
                                      pw.SizedBox(width: 45),
                                      pw.Container(
                                        color: PdfColor.fromHex('#009892'),
                                        padding: pw.EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 6),
                                        child: pw.Text(
                                          'Código validador: xxxxx',
                                          style: const pw.TextStyle(
                                            fontSize: 8,
                                          ),
                                        ),
                                      ),
                                    ]),
                                pw.Text(
                                  'www.sitevalidador.com',
                                  style: const pw.TextStyle(
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ]),
    );

    return pdf.save(); // Page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARTEIRA DE TRANSPORTE ESTUDANTIL"),
        foregroundColor: Color(0xFFF5F5F5),
        backgroundColor: Color(0xFF009892),
      ),
      body: PdfPreview(
        canDebug: false,
        initialPageFormat: PdfPageFormat.a4,
        canChangeOrientation: false,
        canChangePageFormat: false,
        shouldRepaint: true,
        maxPageWidth: 1100,
        build: (format) => _createPdf(),
      ),
    );
  }
}

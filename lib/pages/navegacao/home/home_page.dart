import 'package:carteira/common_codes.dart';
import 'package:carteira/design-system/components/text_style.dart';
import 'package:carteira/pages/carteira_pdf/carteira_pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(32),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'CARTEIRA DE TRANSPORTE ESTUDANTIL',
                        style: kBodyLargeBold,
                      )),
                      SizedBox(
                        width: 80,
                        child: Image.asset(
                          'assets/logo.png',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network("${DataUser.dataUser!.fotoAnexo}"),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Aluno:',
                              style: kBodyMediumBold,
                            ),
                            Text(
                              '${DataUser.dataUser!.nomeCompleto}',
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Instituião',
                              style: kBodyMediumBold,
                            ),
                            SizedBox(width: 20),
                            Text('Ufal'),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Curso:',
                              style: kBodyMediumBold,
                            ),
                            Text('${DataUser.dataUser!.curso}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CPF',
                              style: kBodyMediumBold,
                            ),
                            Text(
                              '${DataUser.dataUser!.cpf}',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Matricula:',
                              style: kBodyMediumBold,
                            ),
                            Text(
                                ' ${DataUser.dataUser!.numeroMatriculaFaculdade}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Turnos',
                              style: kBodyMediumBold,
                            ),
                            Text('Vespertino'),
                            Text('Noturno'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Validade:',
                              style: kBodyMediumBold,
                            ),
                            Text('xx/xx/xxxx'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Código validador',
                              style: kBodyMediumBold,
                            ),
                            Text('xxxx'),
                            SizedBox(height: 8),
                            Text('www.sitevalidador.com'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          // color: Colors.amberAccent,
                          child: Image.asset(
                            'assets/qrcode.png',
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          TextButton(
              onPressed: () {
                Get.to(CarteiraPdfPage());
              },
              child: const Text(
                'Download',
                style: kBodyMediumBold,
              ))
        ],
      ),
    );
  }
}

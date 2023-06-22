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
          const SizedBox(height: 32),
          Wrap(
            spacing: 28,
            children: [
              SizedBox(
                width: 180,
                child: Image.asset(
                  'assets/e-cart.png',
                ),
              ),
              SizedBox(
                width: 120,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ],
          ),
          Card(
            margin: const EdgeInsets.all(32),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network("${DataUser.dataUser!.fotoAnexo}"),
                      ),
                      const SizedBox(width: 20),
                      Column(
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
                          const SizedBox(height: 16),
                          const Text(
                            'CPF',
                            style: kBodyMediumBold,
                          ),
                          Text(
                            '${DataUser.dataUser!.cpf}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Instituição',
                    style: kBodyMediumBold,
                  ),
                  Text('${DataUser.dataUser!.instituicao}'),
                  const SizedBox(height: 16),
                  const Text(
                    'Curso:',
                    style: kBodyMediumBold,
                  ),
                  Text('${DataUser.dataUser!.curso}'),
                  const SizedBox(height: 16),
                  const Text(
                    'Matricula:',
                    style: kBodyMediumBold,
                  ),
                  Text('${DataUser.dataUser!.numeroMatriculaFaculdade}'),
                  const SizedBox(height: 16),
                  const Text(
                    'Turnos',
                    style: kBodyMediumBold,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DataUser.dataUser!.turno != null
                        ? ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            children: DataUser.dataUser!.turno
                                ?.map((e) => Text(e))
                                .toList() as List<Text>,
                          )
                        : const Text('FALTA INFORMAR'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Validade:',
                    style: kBodyMediumBold,
                  ),
                  const Text('xx/xx/xxxx'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Código validador',
                            style: kBodyMediumBold,
                          ),
                          Text('xxxx'),
                          SizedBox(height: 8),
                          Text('www.sitevalidador.com'),
                        ],
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 60,
                        height: 60,
                        // color: Colors.amberAccent,
                        child: Image.asset(
                          'assets/qrcode.png',
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

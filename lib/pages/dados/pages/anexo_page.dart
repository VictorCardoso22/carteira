import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:carteira/design-system/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/anexo.dart';
import 'widgets/preview_page.dart';

class AnexoPage extends StatefulWidget {
  const AnexoPage({Key? key}) : super(key: key);

  @override
  State<AnexoPage> createState() => _AnexoPageState();
}

class _AnexoPageState extends State<AnexoPage> {
  File? arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final file = await picker.getImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }

  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (arquivo != null) Anexo(arquivo: arquivo!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Foto',
                          style: TextStyle(color: kPrimaryDarkColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => Get.to(
                                () => CameraCamera(
                                  onFile: (File file) => showPreview(file),
                                ),
                              )),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Tire uma Foto"),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery()),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 28),
        Row(
          children: [
            Container(
              width: 152,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                    color: kPrimaryLightColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Stack(
                children: [
                  if (arquivo != null) Anexo(arquivo: arquivo!),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'RG - Frente',
                              style: TextStyle(color: kPrimaryDarkColor),
                            )),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: (() => Get.to(
                                    () => CameraCamera(
                                      onFile: (File file) => showPreview(file),
                                    ),
                                  )),
                              icon: const Icon(
                                Icons.camera_alt,
                                color: kPrimaryDarkColor,
                              ),
                              // child: Text("Tire uma Foto"),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: (() => getFileFromGallery()),

                              icon: const Icon(
                                Icons.drive_file_move_rounded,
                                color: kPrimaryDarkColor,
                              ),
                              // child: Text("Anexar imagem"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 152,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                    color: kPrimaryLightColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Stack(
                children: [
                  if (arquivo != null) Anexo(arquivo: arquivo!),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'RG - Verso',
                              style: TextStyle(color: kPrimaryDarkColor),
                            )),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: (() => Get.to(
                                    () => CameraCamera(
                                      onFile: (File file) => showPreview(file),
                                    ),
                                  )),
                              icon: const Icon(
                                Icons.camera_alt,
                                color: kPrimaryDarkColor,
                              ),
                              // child: Text("Tire uma Foto"),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: (() => getFileFromGallery()),

                              icon: const Icon(
                                Icons.drive_file_move_rounded,
                                color: kPrimaryDarkColor,
                              ),
                              // child: Text("Anexar imagem"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        // Comprovante de Residência
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (arquivo != null) Anexo(arquivo: arquivo!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Comprovante de Residência',
                          style: TextStyle(color: kPrimaryDarkColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => Get.to(
                                () => CameraCamera(
                                  onFile: (File file) => showPreview(file),
                                ),
                              )),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Tire uma Foto"),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery()),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 28),
        // Declaração Escolar
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (arquivo != null) Anexo(arquivo: arquivo!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Declaração Escolar',
                          style: TextStyle(color: kPrimaryDarkColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => Get.to(
                                () => CameraCamera(
                                  onFile: (File file) => showPreview(file),
                                ),
                              )),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Tire uma Foto"),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery()),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

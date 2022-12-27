import 'package:carteira/design-system/buttons/custon_primary_button.dart';
import 'package:carteira/design-system/components/constants.dart';
import 'package:carteira/pages/dados/pages/anexo_page.dart';
import 'package:carteira/pages/dados/pages/dados_pessoais_page.dart';
import 'package:carteira/pages/dados/pages/instituicao_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({Key? key}) : super(key: key);

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  int _index = 0;
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCompleted
          ? const Center(
              child: Text('Completo'),
            )
          : Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                primary: kPrimaryColor,
              )),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 38),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                              // Navigator.of(context).popAndPushNamed("/cadastro");
                            },
                            icon: const Icon(
                              Icons.close,
                              color: kPrimaryColor,
                            ),
                          ),
                          const SizedBox(width: 100),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Cadastro',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: Stepper(
                          elevation: 0,
                          type: StepperType.horizontal,
                          physics: const ScrollPhysics(),
                          currentStep: _index,
                          onStepTapped: (step) => tapped(step),
                          onStepContinue: () {
                            final isLastStep = _index == getSteps().length - 1;
                            if (isLastStep) {
                              setState(() => isCompleted = true);
                              print('Completed $isLastStep');
                            } else {
                              continued();
                              print('continuando $isLastStep');
                            }
                          },
                          onStepCancel: cancel,
                          steps: getSteps(),
                          controlsBuilder: (context, details) => Column(
                            children: [
                              CustomPrimaryButton(
                                  titulo: _index == getSteps().length - 1
                                      ? 'Enviar'
                                      : 'Avançar',
                                  onPressed: details.onStepContinue!),
                              const SizedBox(height: 10),
                              if (_index != 0)
                                TextButton(
                                    onPressed: details.onStepCancel!,
                                    child: const Text('Voltar')),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: const Text(
            'Pessoal',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: DadosPessoaisPage(),
          ),
          isActive: _index >= 0,
          state: _index >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(
            'Instituição',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: InstituicaoPage(),
          ),
          isActive: _index >= 0,
          state: _index >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(
            'Anexos',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: AnexoPage(),
          ),
          isActive: _index >= 0,
          state: _index >= 2 ? StepState.complete : StepState.disabled,
        ),
      ];

  tapped(int step) {
    setState(() => _index = step);
  }

  continued() {
    _index < 2 ? setState(() => _index += 1) : null;
  }

  cancel() {
    _index > 0 ? setState(() => _index -= 1) : null;
  }
}

import 'package:carteira/pages/dados/pages/anexo_page.dart';
import 'package:carteira/pages/dados/pages/dados_pessoais_page.dart';
import 'package:carteira/pages/dados/pages/instituicao_page.dart';
import 'package:flutter/material.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({Key? key}) : super(key: key);

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed("/cadastro");
                    },
                    icon: const Icon(Icons.close),
                    label: const Text(""),
                  ),
                  const SizedBox(width: 123),
                  const Center(
                    child: Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  currentStep: _index,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: const Text('Pessoal'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: DadosPessoaisPage(),
                      ),
                      isActive: _index >= 0,
                      state:
                          _index >= 0 ? StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: Text('Instituição'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: InstituicaoPage(),
                      ),
                      isActive: _index >= 0,
                      state:
                          _index >= 1 ? StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: Text('Anexos'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: AnexoPage(),
                      ),
                      isActive: _index >= 0,
                      state:
                          _index >= 2 ? StepState.complete : StepState.disabled,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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

import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: CustomButtonWidget(
          disable: false,
          titleSize: 18,
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop('Retorno');
            }
            // Navigator.of(context).pop('Retorno');
          },
          title: 'Voltar para $args',
        ),
      ),
    );
  }
}

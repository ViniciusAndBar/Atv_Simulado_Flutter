import 'package:flutter/material.dart';
import 'package:teste/segunda.dart';


class EnvioProduto extends StatelessWidget {
  const EnvioProduto({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // barra do aplicativo
        title: const Text('Empresa Crab'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30.0),
            Container(
                height: 300,
                width: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/carranguejo.png'),  // Use the relative path here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            const Text('Dados Enviados! Obrigado.',
                style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 10.0),
            SizedBox(
                    width: 300,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Funcionarios(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(220, 20), 
                            ),
                            child: const Text('Voltar'),
                          ),
                        ]))
          ],
        ),
      ),
    );
  }
}
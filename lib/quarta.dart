// ignore: file_names
import 'package:flutter/material.dart';
import 'package:teste/quinta.dart';

// ignore: camel_case_types
class Ultimo extends StatefulWidget {
  final String nome;
  final String funcao;

  const Ultimo({super.key, required this.nome, required this.funcao});

  @override
  FormsState createState() => FormsState(nome: nome, funcao: funcao);
}

class FormsState extends State<Ultimo> {
  final TextEditingController _nome;
  final TextEditingController _funcao;
  final TextEditingController _tempoFuncao = TextEditingController();

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  FormsState({required String nome, required String funcao})
      : _nome = TextEditingController(text: nome),
        _funcao = TextEditingController(text: funcao);

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
            const SizedBox(height: 16.0),
            const Text('Funcionario Selecionado',
                style: TextStyle(fontSize: 25.0)),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _nome,
                enabled: false,
                decoration: InputDecoration(
                  hintText: _nome.text,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Função Selecionada', style: TextStyle(fontSize: 25.0)),
            SizedBox(
              width: 300,
              child: TextField(
                enabled: false,
                controller: _funcao,
                decoration: InputDecoration(
                  hintText: _funcao.text,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Tempo na função', style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _tempoFuncao,
                decoration: InputDecoration(
                  hintText: 'Digite seu Tempo na função',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
                width: 300,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnvioProduto(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(220, 20),
                    ),
                    child: const Text('Selecionar'),
                  ),
                ])),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
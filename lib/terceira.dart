import 'package:flutter/material.dart';
import 'package:teste/quarta.dart';

class DetalheFuncionario extends StatefulWidget {
  final String nome;
  const DetalheFuncionario({
    Key? key,
    required this.nome,
  }) : super(key: key);

  @override
  FormsState createState() => FormsState(nome: nome);
}

List<Map<String, dynamic>> data = [
  {"id": 1, "name": "Estagiário"},
  {"id": 2, "name": "Programador"},
  {"id": 3, "name": "Gerente de Projeto"},
  {"id": 4, "name": "Analista"},
];

class FormsState extends State<DetalheFuncionario> {
  final TextEditingController _nomeController;
  int funcaoSelecionado = -1;

  FormsState({required String nome})
      : _nomeController = TextEditingController(text: nome);

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
            const Text('Funcionário Selecionado',
                style: TextStyle(fontSize: 25.0)),
            SizedBox(
              width: 300,
              child: TextField(
                enabled: false,
                controller: _nomeController,
                decoration: InputDecoration(
                  hintText: _nomeController.text,
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey), // Define borderColor
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text('Selecionar Função', style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 10.0),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          funcaoSelecionado = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: funcaoSelecionado == index
                                ? Colors.blue
                                : Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${item['name']}',
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      String funcao = "";
                      if (funcaoSelecionado != -1) {
                        funcao = data[funcaoSelecionado]["name"];
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ultimo(
                              nome: _nomeController.text, funcao: funcao),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(220, 20),
                    ),
                    child: const Text('Selecionar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
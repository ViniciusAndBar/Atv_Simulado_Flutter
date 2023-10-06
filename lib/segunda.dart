import 'package:flutter/material.dart';
import 'package:teste/terceira.dart';

class Funcionarios extends StatefulWidget {
  const Funcionarios({Key? key}) : super(key: key);

  @override
  FormsState createState() => FormsState();
}

List<Map<String, dynamic>> data = [
  {"id": 1, "name": "Funcionario A"},
  {"id": 2, "name": "Funcionario B"},
  {"id": 3, "name": "Funcionario C"},
  {"id": 4, "name": "Funcionario D"}
];

class FormsState extends State<Funcionarios> {
  int funcionarioSelecionado = -1;

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
            const SizedBox(height: 100.0),
            const Text('Funcionários cadastrados',
                style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 50.0),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          funcionarioSelecionado = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: funcionarioSelecionado == index
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
            const SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: () {
                String nome = "";

                if (funcionarioSelecionado != -1) {
                  nome = data[funcionarioSelecionado]["name"];
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalheFuncionario(
                      nome: nome,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 50),
              ),
              child: const Text('Selecionar'),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
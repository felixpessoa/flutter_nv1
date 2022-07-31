import 'package:flutter/material.dart';

import '../widgets/custom_button_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              SizedBox(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tarefas[index]),
                      onLongPress: () {
                        setState(() {
                          tarefas.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
              
            CustomButtonWidget(
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
      
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: (() {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tarefas.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
              print(tarefas);
            }),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: (() {
              setState(() {
                tarefas = [];
              });
              _textEditingController.clear();

              print(tarefas);
            }),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

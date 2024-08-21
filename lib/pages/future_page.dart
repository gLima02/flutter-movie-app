import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {

  Future<List<String>> getNames() async { //precisa retornar uma Future de List<String> por ser async
    await Future.delayed(const Duration(seconds: 5));
    return [
      'Joao',
      'Diego',
      'Marcelo',
      'Guilherme'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNames(), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),); //tela de loading
        }
       
       if(snapshot.hasError){
        return const Center(
          child: Text('Ocorreu um erro'), //cenario com erro
        );
       }

       return ListView.builder(
          itemCount: snapshot.data!.length, // ! faz ignorar a possibilidade do valor ser nulo
          itemBuilder: (context, index){
            return Text(snapshot.data![index]);
          },
        );
      },
    );
  }
}
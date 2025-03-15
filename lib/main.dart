import 'package:fipe_valor/core/services/api_service.dart';
import 'package:fipe_valor/features/home/page.dart';
import 'package:fipe_valor/features/home/provider.dart';
import 'package:fipe_valor/features/home/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Valor na tabela FIPE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeProvider(HomeRepository(AppApi())),
        child: const HomePage(),
      ),
    );
  }
}

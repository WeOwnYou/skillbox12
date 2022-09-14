import 'package:business/business.dart';
import 'package:clean_architecture/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final myBloc = BlocFactory.instance.get<MainBloc>()
      ..add(const MainBlocEvent.init());
    return Provider<MainBloc>(
      create: (_) => myBloc,
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

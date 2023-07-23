import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch_app/bloc/home/home_bloc.dart';
import 'package:musixmatch_app/repositories/home_repository.dart';

import 'screens/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomeRepository homeRepository = HomeRepository();

    return BlocProvider(
      create: (context) => HomeBloc(homeRepository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

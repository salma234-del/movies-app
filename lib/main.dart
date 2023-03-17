import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/services/services_locator.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}

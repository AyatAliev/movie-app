import 'package:flutter/material.dart';
import 'package:flutter_api_with_retrofit/domain/bloc/home_bloc.dart';
import 'package:flutter_api_with_retrofit/presentation/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeBloc>(
            create: (_) => HomeBloc(),
            dispose: (_, HomeBloc homeBloc) => homeBloc.dispose())
      ],
      child: MaterialApp(
          title: 'Movie Popular',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home()),
    );
  }
}

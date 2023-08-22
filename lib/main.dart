import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_clone/application/downloades/bloc/download_bloc.dart';
import 'package:nextflix_clone/application/mainpage/main_screen.dart';
import 'package:nextflix_clone/application/search/bloc/search_bloc.dart';
import 'package:nextflix_clone/core/injections.dart' as di;
import 'package:nextflix_clone/core/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<DownloadBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
          title: 'Neflix Clone',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: MainScreen()),
    );
  }
}

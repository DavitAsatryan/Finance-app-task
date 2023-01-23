import 'package:dio/dio.dart';
import 'package:financial_application/Bloc/Get_users_bloc/get_users_bloc_bloc.dart';
import 'package:financial_application/Consts/requests.dart';
import 'package:financial_application/Repository/dio_options.dart';
import 'package:financial_application/Screens/First_Screen/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  dio = Dio(
    BaseOptions(
      baseUrl: Requests.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      contentType: Headers.jsonContentType,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GetUsersBlocBloc>(
        create: (context) => GetUsersBlocBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

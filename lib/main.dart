import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/Observer/observer.dart';
import 'package:news_app/screens/home_screen.dart';

import 'cubits/mode_cubit/cubit.dart';
import 'cubits/mode_cubit/state.dart';
import 'datasources/remote/dio/dio_News.dart';
import 'datasources/shared_helper/shared_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper helper = SharedHelper();
  await helper.init();

  Bloc.observer = MyBlocObserver();
  DioNews.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ModeCubit(MediaQuery.of(context).platformBrightness),
      child: BlocBuilder<ModeCubit, ModeStates>(builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: ModeCubit.get(context).mode,
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.deepOrange,
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  color: Colors.white,
                  elevation: 0),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 0,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.black,
                unselectedLabelStyle: TextStyle(color: Colors.red),
                selectedLabelStyle: TextStyle(color: Colors.black),
              )),
          home: const HomeScreen(),
        );
      }),
    );
  }
}

import 'dart:io';

import 'package:assignment/features/shopping/logic/shopping_cubit.dart';
import 'package:assignment/styles/themes.dart';
import 'package:assignment/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/nav_bar/logic/navbar_cubit.dart';
import 'features/splash/splash_screen.dart';






Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
      //  BlocProvider<AuthCubit>(create: (context) => sl<AuthCubit>()),
        BlocProvider<NavbarCubit>(create: (context) => sl<NavbarCubit>()),
        BlocProvider<ShoppingCubit>(create: (context) => sl<ShoppingCubit>()),




      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Royex Test Project',
        navigatorKey: navigatorKey,
        theme: lightTheme(context),
        home: SplashScreen(),
        builder: (context,child){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          );
        },
      ),

    );
  }
}

class Get {
  static NavigatorState? get navigator => navigatorKey.currentState;

  static BuildContext? get context => navigatorKey.currentContext;
  static T  getBloc<T>( ){
    final context = navigatorKey.currentContext;

    return context!.read<T>();
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

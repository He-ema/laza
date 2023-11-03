import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:laza/core/theme/theme_cubit/theme_cubit.dart';
import 'package:laza/core/utils/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/simple_bloc_observer.dart';

import 'core/shared_cubits/auth_cubit/auth_cubit.dart';
import 'core/stripe_payment/stripe_keys.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  Stripe.merchantIdentifier = 'any string works';
  await Stripe.instance.applySettings();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      duration: const Duration(milliseconds: 750),
      initTheme: BlocProvider.of<ThemeCubit>(context).themeData,
      builder: (p0, theme) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: BlocProvider.of<ThemeCubit>(context).themeData,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

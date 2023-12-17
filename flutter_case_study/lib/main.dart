import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_study/src/features/auth/services/local_service.dart';
import 'package:flutter_case_study/src/features/auth/view/login_screen.dart';
import 'package:flutter_case_study/src/features/home/view/homepage.dart';
import 'package:flutter_case_study/src/riverpods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
          path: 'assets/translations',
          fallbackLocale: const Locale('tr', 'TR'),
          child: MyApp()),
    ),
  );
}

final LocaleAuthService localeAuthService = LocaleAuthService();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        appBarTheme: const AppBarTheme(),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      home: Consumer(
        builder: (context, ref, child) {
          final authNotifier = ref.watch(authProvider.notifier);
          authNotifier.isFirstLogin(context);
          final provider = ref.watch(authProvider);
          if (provider.user == null) {
            return const LoginScreen();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tu_home/app/app.dart';
import 'package:tu_home/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tu Home',
      routerConfig: router,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es')],
      onGenerateTitle: (_) => context.l10n.appBarTitle,
      theme: FlexThemeData.light(
        fontFamily: 'Catamaran',
        scheme: FlexScheme.brandBlue,
        useMaterial3: false,
      ),
      darkTheme: FlexThemeData.dark(
        fontFamily: 'Catamaran',
        scheme: FlexScheme.brandBlue,
        useMaterial3: false,
      ),
      themeMode: ThemeMode.system,
    );
  }
}

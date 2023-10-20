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
      routerConfig: goRouter,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es')],
      onGenerateTitle: (BuildContext context) =>
          context.l10n.counterAppBarTitle,
      theme: FlexThemeData.light(
        scheme: FlexScheme.brandBlue,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.brandBlue,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
    );
  }
}

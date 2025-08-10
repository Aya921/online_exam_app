import 'package:device_preview/device_preview.dart';
import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/confing/provider/app_config_provider.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/route/routes.dart';
import 'package:exam_app/core/services/token_service.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  await getIt<AppConfigProvider>().setSlectedLocale();
  
  runApp(
    ChangeNotifierProvider.value(
      value: getIt<AppConfigProvider>(),
      child: DevicePreview(builder: (context) => MyApp()),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  late AppConfigProvider appConfigProvider;

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(appConfigProvider.slelectedlocale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThem.ligtScheme,
      initialRoute: getIt<TokenService>().isTokenSaved
          ? AppRoutes.main
          : AppRoutes.login,

      onGenerateRoute: Routes.onGenerate,
    );
  }
}

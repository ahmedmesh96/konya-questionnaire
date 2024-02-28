import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:questionnari/controller/language_change_controller.dart';
import 'package:questionnari/generated/l10n.dart';
import 'package:questionnari/screens/insert_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

String language = "ar";

void main() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString("language_code") ?? "";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAjsoyBb9oiJim_-I1MIuNQ-mTzONG2jIk",
          authDomain: "manag-konya.firebaseapp.com",
          databaseURL: "https://manag-konya-default-rtdb.firebaseio.com",
          projectId: "manag-konya",
          storageBucket: "manag-konya.appspot.com",
          messagingSenderId: "134978190205",
          appId: "1:134978190205:web:858a2f06887342e2b2aa14"));

  // SharedPreferences.getInstance().then((instance){
  //   language = instance.getString("language")!;
  // });
  runApp(MyApp(
    locale: languageCode,
  ));
}

class MyApp extends StatefulWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeController())
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          if (widget.locale.isEmpty) {
            provider.changeLanguage(const Locale("en"));
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // locale: locale == "" ? const Locale("en") :  provider.appLocale == null ? Locale("en")  : provider.appLocale,
            locale: const Locale("ar"),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

            title: 'Konya Restaurant',
            theme: ThemeData.dark(
              useMaterial3: true,
            ),
            home: AnimatedSplashScreen(
                pageTransitionType: PageTransitionType.bottomToTop,
                backgroundColor: Colors.black,
                splashTransition: SplashTransition.scaleTransition,
                splashIconSize: 200,
                splash: const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/img/favicon.png"),
                ),
                nextScreen: const InsertData()),
          );
        },
      ),
    );
  }
}

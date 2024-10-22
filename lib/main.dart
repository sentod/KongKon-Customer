import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controller/onboard.dart';
import 'controller/dashboard.dart';
import 'controller/merchant.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BasketMerchant()),
        ChangeNotifierProvider(create: (_) => DetailMerchant()),
      ],
      child: const MainApp(),
    ),
    // const MainApp()
    );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown, 

    ]);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 41, 30, 88),
          primary: const Color.fromARGB(255, 41, 30, 88), 
          secondary: const Color.fromARGB(255, 245, 71, 74), 
          ),
        ),
      scrollBehavior:  MyCustomScrollBehavior(),
      initialRoute: '/',
      routes: {
        '/'   : (context) => Merchant().view(),
      },

      onGenerateRoute: (settings){
        switch (settings.name) {

          case 'login':
            return PageTransition(child: Login(), type: PageTransitionType.fade);
          case 'signup':
            return PageTransition(child: Signup(), type: PageTransitionType.fade);
          case 'signup_success':
            return PageTransition(child: Signup_success(), type: PageTransitionType.fade);

          case 'home':
            return PageTransition(child: Home(), type: PageTransitionType.fade);

          case 'merchant':
            return PageTransition(child: Merchant().view(), type: PageTransitionType.fade, settings: settings);

          case 'item':
            return PageTransition(child: Item().view(), type: PageTransitionType.fade, settings: settings);


          default:
            return null;
        }
      },
    );
  }
}



import 'package:flutter/material.dart';


// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // Getting arguments passed in while calling Navigator.pushNamed
//
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => const SplashScreen());
//        // return Get.(SplashScreen());
//       case '/home':
//       // Validation of correct data type
//        // if (args is String) {
//           return MaterialPageRoute(
//             builder: (_) => const HomeScreen());
//         //  );
//     //}
//         // If args is not of the correct type, return an error page.
//         // You can also throw an exception while in development.
//       //  return _errorRoute();
//       default:
//       // If there is no such named route in the switch statement, e.g. /third
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Error'),
//         ),
//         body: const Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
//
//   //
//   // '/': (ctx) => CarouselDemoHome(),
//   // '/basic': (ctx) => BasicDemo(),
//   // '/nocenter': (ctx) => NoCenterDemo(),
//   // '/image': (ctx) => ImageSliderDemo(),
//   // '/complicated': (ctx) => ComplicatedImageDemo(),
//   // '/enlarge': (ctx) => EnlargeStrategyDemo(),
//   // '/manual': (ctx) => ManuallyControlledSlider(),
//   // '/noloop': (ctx) => NoonLoopingDemo(),
//   // '/vertical': (ctx) => VerticalSliderDemo(),
//   // '/fullscreen': (ctx) => FullscreenSliderDemo(),
//   // '/ondemand': (ctx) => OnDemandCarouselDemo(),
//   // '/indicator': (ctx) => CarouselWithIndicatorDemo(),
//   // '/prefetch': (ctx) => PrefetchImageDemo(),
//   // '/reason': (ctx) => CarouselChangeReasonDemo(),
//   // '/position': (ctx) => KeepPageviewPositionDemo(),
//   // '/multiple': (ctx) => MultipleItemDemo(),
// }
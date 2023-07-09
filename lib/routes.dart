import 'package:flutter/material.dart';
import 'package:scanpro/screens/DetailsPage.dart';
import 'package:scanpro/screens/addItem.dart';
import 'package:scanpro/screens/DetailsPage.dart';
import 'package:scanpro/widgets/confirmation.dart';
import 'package:scanpro/screens/inventory.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case InventoryPage.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => InventoryPage(),
      );
    case AddItemPage.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddItemPage(),
      );
    case ConfirmationPage.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ConfirmationPage(),
      );
    case ProductDetailsPage.routName:
      final productName = routeSettings.arguments
          as String; // Retrieve the productName argument
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsPage(
          productName: productName,

          mrp: '', // Provide the necessary values for mrp and weight
          weight: '',
        ),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("This Screen does not exist"),
          ),
        ),
      );
  }
}

// Route<dynamic> generateRoute(RouteSettings routeSettings) {
//   switch (routeSettings.name) {
//     case OnboardingPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const OnboardingPage(),
//       );
//     case LoginPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const LoginPage(),
//       );
//     case RegisterPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const RegisterPage(),
//       );
//     case OtpVerificationPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const OtpVerificationPage(),
//       );
//     case CreateProfilePage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const CreateProfilePage(),
//       );
//     case DashboardPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const DashboardPage(),
//       );
//     case Routes.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const Routes(),
//       );
//     case AvatarPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const AvatarPage(),
//       );
//     case OtpVerificationRegisterPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const OtpVerificationRegisterPage(),
//       );
//     case SliderPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const SliderPage(),
//       );
//     case ClubsPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const ClubsPage(),
//       );
//     case ClubDetailsPage.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const ClubDetailsPage(),
//       );
//     case CustomTravellingPlan.routName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const CustomTravellingPlan(),
//       );

//     default:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (_) => const Scaffold(
//           body: Center(
//             child: Text("This Screen does not exist"),
//           ),
//         ),
//       );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neocloud_mobile/auth/auth_guard.dart';
import 'package:neocloud_mobile/core/bloc/auth_user/auth_user_bloc.dart';
import 'package:neocloud_mobile/core/bloc/context/context_bloc.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/classes/remote_class_bloc.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_bloc.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/search_navbar/search_navbar_bloc.dart';
import 'package:neocloud_mobile/injection_container.dart';
import 'package:neocloud_mobile/providers/NavItem.dart';
import 'package:neocloud_mobile/providers/UserProvider.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/academic/academic_screen.dart';
import 'package:neocloud_mobile/screens/cart/cart_screen.dart';
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:neocloud_mobile/screens/login_signup/login_signup_screen.dart';
import 'package:neocloud_mobile/features/search/presentation/pages/search_screen.dart';
import 'package:neocloud_mobile/screens/settings/components/system_logos_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/language_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/manage_account_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/payment_screen.dart';
import 'package:neocloud_mobile/screens/settings/components/system_general_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/smtp_screen.dart';
import 'package:neocloud_mobile/screens/settings/screens/system_screen.dart';
import 'package:neocloud_mobile/screens/settings/settings_screen.dart';
import 'package:neocloud_mobile/screens/splash/splash_screen.dart';
import 'package:neocloud_mobile/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme.dart';
import 'utils/locator.dart';

void main() async {
  // This helps us in caching our flutter_graphql fetched data
  // await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Register App Services
  setupServiceLocator();
  initiallizeDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavbarProvider>(create: (_) => NavbarProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
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
    return MultiBlocProvider(
      providers: [
        // General Bloc
        BlocProvider<AuthUserBloc>(create: (_) => sl()),
        BlocProvider<ContextBloc>(create: (_) => sl()),
        // Others
        BlocProvider<RemoteUserBloc>(create: (_) => sl()),
        BlocProvider<SearchNavbarBloc>(create: (_) => sl()),
        BlocProvider<RemoteClassBloc>(create: (_) => sl()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NCT Pro',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: '/${WelcomeScreen.screenName}',
        // navigatorObservers: [AuthGuardObserver()], // Middleware observer
        // onGenerateRoute: AppRoute.onGenerateRoutes,
        routes: appRoutes(),
      ),
    );
  }
}




ThemeData buildTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 16),
    ),
    scaffoldBackgroundColor: Colors.white,
    splashFactory: InkRipple.splashFactory,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

Map<String, WidgetBuilder> appRoutes() {
  return {
    '/': (context) => const SplashScreen(),
    '/auth': (context) => LoginSignupScreen(),
    '/welcome': (context) => const WelcomeScreen(),
    '/comingsoon': (context) => const ComingSoonScreen(),
    '/academic': (context) => const AcademicScreen(),
    '/dashboard': (context) => const DashboardScreen(),
    '/profile': (context) => ProfileScreen(),
    '/search': (context) => SearchScreen(),
    '/cart': (context) => const CartScreen(),
    // Settings
    '/settings': (context) => const SettingsScreen(),
    '/manage-account': (context) => const ManageAccountScreen(),
    '/system': (context) => const SystemScreen(),
    '/payment': (context) => const PaymentScreen(),
    '/language': (context) => const LanguageScreen(),
    '/smtp': (context) => SmtpScreen(),
    '/general': (context) => SystemGeneralScreen(),
    '/system-logos': (context) => SystemLogosScreen(),
  };
}

class AppRoute {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/auth':
        return MaterialPageRoute(builder: (_) => LoginSignupScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/comingsoon':
        return MaterialPageRoute(builder: (_) => const ComingSoonScreen());
      case '/academic':
        return MaterialPageRoute(builder: (_) => const AcademicScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      // case '/profile':
      //   return MaterialPageRoute(builder: (_) => ProfileScreen(user: settings.arguments as UserEntity,));
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) => const CartScreen());
      // Settings
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/manage-account':
        return MaterialPageRoute(builder: (_) => const ManageAccountScreen());
      case '/system':
        return MaterialPageRoute(builder: (_) => const SystemScreen());
      case '/payment':
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case '/language':
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case '/smtp':
        return MaterialPageRoute(builder: (_) => SmtpScreen());
      case '/general':
        return MaterialPageRoute(builder: (_) => SystemGeneralScreen());
      case '/system-logos':
        return MaterialPageRoute(builder: (_) => SystemLogosScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const ComingSoonScreen(),
        );
    }
  }
}

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';            
              
@AutoRouterConfig()      
class AppRouter extends $AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [      
   /// routes go here     
    AutoRoute(page: AcademicRoute.page, path: '/academic'),
    AutoRoute(page: ClassRoute.page, path: '/class'),
    AutoRoute(page: ClassWorkRoute.page, path: '/classwork'),
    AutoRoute(page: ComingSoonRoute.page, path: '/commingsoon'),
    AutoRoute(page: CourseRoute.page, path: '/course'),
    AutoRoute(page: DashboardRoute.page, path: '/dashboard'),
    AutoRoute(page: FacultyRoute.page, path: '/faculty'),
    AutoRoute(page: ListRoute.page, path: '/list'),
    AutoRoute(page: LoginSignupRoute.page, path: '/auth', initial: true),
    AutoRoute(page: NotificationRoute.page, path: '/notification'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: SearchRoute.page, path: '/search'),
    AutoRoute(page: SplashRoute.page, path: '/splash'),
    AutoRoute(page: WelcomeRoute.page, path: '/welcome'),
  ];
}
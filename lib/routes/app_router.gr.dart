// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:neocloud_mobile/graphql/models/ClassModel.dart' as _i19;
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart' as _i20;
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart' as _i22;
import 'package:neocloud_mobile/graphql/models/UserModel.dart' as _i23;
import 'package:neocloud_mobile/models/Courses.dart' as _i21;
import 'package:neocloud_mobile/screens/academic/academic_screen.dart' as _i1;
import 'package:neocloud_mobile/screens/cart/cart_screen.dart' as _i2;
import 'package:neocloud_mobile/screens/class/class_screen.dart' as _i3;
import 'package:neocloud_mobile/screens/classwork/classwork_screen.dart' as _i4;
import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart'
    as _i5;
import 'package:neocloud_mobile/screens/course/course_screen.dart' as _i6;
import 'package:neocloud_mobile/screens/dashboard/dashboard_screen.dart' as _i7;
import 'package:neocloud_mobile/screens/faculty/faculty_screen.dart' as _i8;
import 'package:neocloud_mobile/screens/list/list_screen.dart' as _i9;
import 'package:neocloud_mobile/screens/login_signup/login_signup_screen.dart'
    as _i10;
import 'package:neocloud_mobile/screens/notifications/notifications_screen.dart'
    as _i11;
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart' as _i12;
import 'package:neocloud_mobile/screens/search/search_screen.dart' as _i13;
import 'package:neocloud_mobile/screens/settings/settings_screen.dart' as _i14;
import 'package:neocloud_mobile/screens/splash/splash_screen.dart' as _i15;
import 'package:neocloud_mobile/screens/welcome/welcome_screen.dart' as _i16;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AcademicRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AcademicScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartScreen(),
      );
    },
    ClassRoute.name: (routeData) {
      final args = routeData.argsAs<ClassRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ClassScreen(
          key: args.key,
          clas: args.clas,
        ),
      );
    },
    ClassWorkRoute.name: (routeData) {
      final args = routeData.argsAs<ClassWorkRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ClassWorkScreen(
          key: args.key,
          classwork: args.classwork,
        ),
      );
    },
    ComingSoonRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ComingSoonScreen(),
      );
    },
    CourseRoute.name: (routeData) {
      final args = routeData.argsAs<CourseRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.CourseScreen(
          key: args.key,
          course: args.course,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DashboardScreen(),
      );
    },
    FacultyRoute.name: (routeData) {
      final args = routeData.argsAs<FacultyRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.FacultyScreen(
          key: args.key,
          faculty: args.faculty,
        ),
      );
    },
    ListRoute.name: (routeData) {
      final args = routeData.argsAs<ListRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ListScreen(
          key: args.key,
          screenName: args.screenName,
          widgetList: args.widgetList,
          addScreenPadding: args.addScreenPadding,
        ),
      );
    },
    LoginSignupRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginSignupScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NotificationScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ProfileScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SearchScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SplashScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AcademicScreen]
class AcademicRoute extends _i17.PageRouteInfo<void> {
  const AcademicRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AcademicRoute.name,
          initialChildren: children,
        );

  static const String name = 'AcademicRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartScreen]
class CartRoute extends _i17.PageRouteInfo<void> {
  const CartRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ClassScreen]
class ClassRoute extends _i17.PageRouteInfo<ClassRouteArgs> {
  ClassRoute({
    _i18.Key? key,
    required _i19.ClassModel clas,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ClassRoute.name,
          args: ClassRouteArgs(
            key: key,
            clas: clas,
          ),
          initialChildren: children,
        );

  static const String name = 'ClassRoute';

  static const _i17.PageInfo<ClassRouteArgs> page =
      _i17.PageInfo<ClassRouteArgs>(name);
}

class ClassRouteArgs {
  const ClassRouteArgs({
    this.key,
    required this.clas,
  });

  final _i18.Key? key;

  final _i19.ClassModel clas;

  @override
  String toString() {
    return 'ClassRouteArgs{key: $key, clas: $clas}';
  }
}

/// generated route for
/// [_i4.ClassWorkScreen]
class ClassWorkRoute extends _i17.PageRouteInfo<ClassWorkRouteArgs> {
  ClassWorkRoute({
    _i18.Key? key,
    required _i20.ClassworkModel classwork,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ClassWorkRoute.name,
          args: ClassWorkRouteArgs(
            key: key,
            classwork: classwork,
          ),
          initialChildren: children,
        );

  static const String name = 'ClassWorkRoute';

  static const _i17.PageInfo<ClassWorkRouteArgs> page =
      _i17.PageInfo<ClassWorkRouteArgs>(name);
}

class ClassWorkRouteArgs {
  const ClassWorkRouteArgs({
    this.key,
    required this.classwork,
  });

  final _i18.Key? key;

  final _i20.ClassworkModel classwork;

  @override
  String toString() {
    return 'ClassWorkRouteArgs{key: $key, classwork: $classwork}';
  }
}

/// generated route for
/// [_i5.ComingSoonScreen]
class ComingSoonRoute extends _i17.PageRouteInfo<void> {
  const ComingSoonRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ComingSoonRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoonRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CourseScreen]
class CourseRoute extends _i17.PageRouteInfo<CourseRouteArgs> {
  CourseRoute({
    _i18.Key? key,
    required _i21.Course course,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CourseRoute.name,
          args: CourseRouteArgs(
            key: key,
            course: course,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseRoute';

  static const _i17.PageInfo<CourseRouteArgs> page =
      _i17.PageInfo<CourseRouteArgs>(name);
}

class CourseRouteArgs {
  const CourseRouteArgs({
    this.key,
    required this.course,
  });

  final _i18.Key? key;

  final _i21.Course course;

  @override
  String toString() {
    return 'CourseRouteArgs{key: $key, course: $course}';
  }
}

/// generated route for
/// [_i7.DashboardScreen]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.FacultyScreen]
class FacultyRoute extends _i17.PageRouteInfo<FacultyRouteArgs> {
  FacultyRoute({
    _i18.Key? key,
    required _i22.FacultyModel faculty,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          FacultyRoute.name,
          args: FacultyRouteArgs(
            key: key,
            faculty: faculty,
          ),
          initialChildren: children,
        );

  static const String name = 'FacultyRoute';

  static const _i17.PageInfo<FacultyRouteArgs> page =
      _i17.PageInfo<FacultyRouteArgs>(name);
}

class FacultyRouteArgs {
  const FacultyRouteArgs({
    this.key,
    required this.faculty,
  });

  final _i18.Key? key;

  final _i22.FacultyModel faculty;

  @override
  String toString() {
    return 'FacultyRouteArgs{key: $key, faculty: $faculty}';
  }
}

/// generated route for
/// [_i9.ListScreen]
class ListRoute extends _i17.PageRouteInfo<ListRouteArgs> {
  ListRoute({
    _i18.Key? key,
    String screenName = "",
    required _i18.Widget widgetList,
    bool addScreenPadding = true,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ListRoute.name,
          args: ListRouteArgs(
            key: key,
            screenName: screenName,
            widgetList: widgetList,
            addScreenPadding: addScreenPadding,
          ),
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const _i17.PageInfo<ListRouteArgs> page =
      _i17.PageInfo<ListRouteArgs>(name);
}

class ListRouteArgs {
  const ListRouteArgs({
    this.key,
    this.screenName = "",
    required this.widgetList,
    this.addScreenPadding = true,
  });

  final _i18.Key? key;

  final String screenName;

  final _i18.Widget widgetList;

  final bool addScreenPadding;

  @override
  String toString() {
    return 'ListRouteArgs{key: $key, screenName: $screenName, widgetList: $widgetList, addScreenPadding: $addScreenPadding}';
  }
}

/// generated route for
/// [_i10.LoginSignupScreen]
class LoginSignupRoute extends _i17.PageRouteInfo<void> {
  const LoginSignupRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginSignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginSignupRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NotificationScreen]
class NotificationRoute extends _i17.PageRouteInfo<void> {
  const NotificationRoute({List<_i17.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i18.Key? key,
    _i23.UserModel? user,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<ProfileRouteArgs> page =
      _i17.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.user,
  });

  final _i18.Key? key;

  final _i23.UserModel? user;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i13.SearchScreen]
class SearchRoute extends _i17.PageRouteInfo<void> {
  const SearchRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.WelcomeScreen]
class WelcomeRoute extends _i17.PageRouteInfo<void> {
  const WelcomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_option_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/car_category_screen.dart';
import 'screens/product_screen.dart';
import 'screens/search_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/account_screen.dart';
import 'screens/about_screen.dart';
import 'screens/info_screen.dart';
import 'screens/web_view_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
    '/': (context) => const SplashScreen(),
    '/login-option': (context) => const LoginOptionScreen(),
    '/sign-in': (context) => const SignInScreen(),
    '/sign-up': (context) => const SignUpScreen(),
    '/forgot-password': (context) => const ForgotPasswordScreen(),
    '/home': (context) => const HomeScreen(),
    '/car-category': (context) => const CarCategoryScreen(),
    '/product': (context) => const ProductScreen(),
    '/search': (context) => const SearchScreen(),
    '/booking': (context) => const BookingScreen(),
    '/checkout': (context) => const CheckoutScreen(),
    '/account': (context) => const AccountScreen(),
    '/about': (context) => const AboutScreen(),
    '/info': (context) => const InfoScreen(),
    '/webview': (context) => const WebViewScreen(),
  };
}

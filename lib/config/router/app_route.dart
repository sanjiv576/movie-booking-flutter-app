import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/home/presentation/view/admin/admin_home_view.dart';
import '../../features/home/presentation/view/customer/bottom_view/all_movies_view.dart';
import '../../features/home/presentation/view/customer/bottom_view/dashboard_view.dart';
import '../../features/home/presentation/view/customer/bottom_view/movie_list.dart';
import '../../features/home/presentation/view/customer/bottom_view/payment_view.dart';
import '../../features/home/presentation/view/customer/bottom_view/ticket_selection_view.dart';
import '../../features/home/presentation/view/customer/bottom_view/ticket_view.dart';
import '../../features/home/presentation/view/customer/home_view.dart';
import '../../features/home/presentation/view/welcome_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String userDashboardRoute = '/userDashboard';
  static const String adminDashboardRoute = '/adminDashboard';
  static const String movieListRoute = '/movie';
  static const String paymentRoute = '/payment';
  static const String ticketRoute = '/ticket';
  static const String homeRoute = '/home';
  static const String splashRoute = '/splash';
  static const String allMoviesRoute = '/allMovies';
  static const String ticketSelectionRoute = '/ticketSelection';
  static const String welcomeRoute = '/welcome';
  static const String adminHomeRoute = '/adminHome';

  static getApplicationRoute() {
    return {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      userDashboardRoute: (context) => const DashboardView(),
      adminDashboardRoute: (context) => const DashboardView(),
      movieListRoute: (context) => const MovieView(),
      paymentRoute: (context) => const PaymentView(),
      ticketRoute: (context) => const TicketView(),
      homeRoute: (context) => const HomeView(),
      splashRoute: (context) => const SplashView(),
      allMoviesRoute: (context) => const AllMoviesView(),
      ticketSelectionRoute: (context) => const TicketViewSelection(),
      welcomeRoute: (context) => const welcome(),
      adminHomeRoute: (context) => const AdminHomeView(),
    };
  }
}

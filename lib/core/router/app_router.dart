import 'package:go_router/go_router.dart';
import '../../features/home/home_page.dart';
import '../../features/about/about_page.dart';
import '../../features/services/services_page.dart';
import '../../features/portfolio/portfolio_page.dart';
import '../../features/careers/careers_page.dart';
import '../../features/contact/contact_page.dart';
import '../../shared/layout/shell_layout.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => ShellLayout(child: child),
        routes: [
          GoRoute(path: '/', name: 'home', builder: (context, state) => const HomePage()),
          GoRoute(path: '/about', name: 'about', builder: (context, state) => const AboutPage()),
          GoRoute(path: '/services', name: 'services', builder: (context, state) => const ServicesPage()),
          GoRoute(path: '/portfolio', name: 'portfolio', builder: (context, state) => const PortfolioPage()),
          GoRoute(path: '/careers', name: 'careers', builder: (context, state) => const CareersPage()),
          GoRoute(path: '/contact', name: 'contact', builder: (context, state) => const ContactPage()),
        ],
      ),
    ],
  );
}

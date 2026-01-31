class RoutNames {
  RoutNames._internal();
  static final RoutNames instance = RoutNames._internal();
  factory RoutNames() => instance;

  final String login = '/login';
  final String home = '/';
}

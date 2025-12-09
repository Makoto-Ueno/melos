enum Flavor { dev, stg, prd }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String apiBaseUrl;
  final bool isProduction;

  FlavorConfig._({
    required this.flavor,
    required this.name,
    required this.apiBaseUrl,
    required this.isProduction,
  });

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception('FlavorConfig is not initialized');
    }
    return _instance!;
  }

  static void initialize(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        _instance = FlavorConfig._(
          flavor: Flavor.dev,
          name: 'Development',
          apiBaseUrl: 'https://dev-api.example.com',
          isProduction: false,
        );
        break;
      case Flavor.stg:
        _instance = FlavorConfig._(
          flavor: Flavor.stg,
          name: 'Staging',
          apiBaseUrl: 'https://stg-api.example.com',
          isProduction: false,
        );
        break;
      case Flavor.prd:
        _instance = FlavorConfig._(
          flavor: Flavor.prd,
          name: 'Production',
          apiBaseUrl: 'https://api.example.com',
          isProduction: true,
        );
        break;
    }
  }

  bool get isDevelopment => flavor == Flavor.dev;
  bool get isStaging => flavor == Flavor.stg;
}

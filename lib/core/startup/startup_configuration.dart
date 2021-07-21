enum Environment {
  product,
  development,
}

class StartupConfig {
  final Environment environment;

  StartupConfig(this.environment);
}

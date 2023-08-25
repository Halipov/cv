/// Application configuration.
class AppConfig {
  final String url;

  AppConfig({
    required this.url,
  });
  AppConfig copyWith({
    String? url,
    String? proxyUrl,
  }) =>
      AppConfig(
        url: url ?? this.url,
      );
}

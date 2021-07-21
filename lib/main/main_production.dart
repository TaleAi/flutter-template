import '../app.dart';
import '../core/startup/startup.dart';

void main() {
  Startup.startWithSentry(
    'https://2fbe86c0f9d348ab874172fcf0d41a9e@o864330.ingest.sentry.io/5822413',
    App(),
  );
}

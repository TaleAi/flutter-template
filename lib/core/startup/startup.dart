import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class Startup {
  static void startWithSentry(String dsn, Widget app) async {
    await SentryFlutter.init(
      (options) => options.dsn = dsn,
      appRunner: () => _runApp(app),
    );
  }

  static _runApp(Widget app) {
    FlutterError.onError = (details) async {
      if (PlatformChecker().isReleaseMode()) {
        Zone.current.handleUncaughtError(
          details.exception,
          details.stack ?? StackTrace.empty,
        );
      } else {
        FlutterError.dumpErrorToConsole(details);
      }
    };
    runZonedGuarded(
      () => runApp(app),
      (e, s) async {
        /// 上报异常
        await Sentry.captureException(
          e,
          stackTrace: s,
        );
      },
    );
  }
}

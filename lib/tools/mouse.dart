import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MouseButtonDetector {
  static const platform = MethodChannel('red.hiro/mouseBackButton');

  static Future<void> initialize() async {
    platform.setMethodCallHandler(_handleMethod);
  }

  static Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'onBackButtonPressed':
        debugPrint('Back button pressed');
        break;
      default:
        throw MissingPluginException();
    }
  }
}

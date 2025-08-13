import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_overlay_window_magic/flutter_overlay_window_magic.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterOverlayWindow', () {
    test('closeOverlay should close the overlay', () async {
      await FlutterOverlayWindowMagic.closeOverlay();
      expect(await FlutterOverlayWindowMagic.isActive(), isFalse);
    });

    if (defaultTargetPlatform == TargetPlatform.android) {
      test('isPermissionGranted should return a boolean', () async {
        final result = await FlutterOverlayWindowMagic.isPermissionGranted();
        expect(result, isA<bool>());
      });
    }
    test('requestPermission should return a boolean', () async {
      final result = await FlutterOverlayWindowMagic.requestPermission();
      expect(result, isA<bool>());
    });
  });
}

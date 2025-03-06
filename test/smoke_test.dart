// Copyright 2025 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_maps_samples/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This test is meant to check that none of the samples are broken at runtime.
/// It will run with `flutter test`, but if you want to see it in action,
/// you can also run:
///
///     flutter run -d your_device test/smoke_test.dart
void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    final runningOnRealDevice =
        !Platform.environment.containsKey('FLUTTER_TEST');

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    final cardsFinder = find.byType(Card, skipOffstage: false);
    expect(cardsFinder, findsNWidgets(MyHomePage.samples.length),
        reason: 'not all samples have cards');
    expect(find.byType(GoogleMap), findsNothing,
        reason: 'map found on the main menu');
    final cardWidgets = tester.widgetList<Card>(cardsFinder);

    for (final cardWidget in cardWidgets) {
      final cardFinder = find.byWidget(cardWidget, skipOffstage: false);

      // Scroll up first.
      await tester.dragUntilVisible(
          cardsFinder.first, find.byType(GridView), Offset(0, 10));
      // Then scroll to the widget.
      await tester.dragUntilVisible(
          cardFinder, find.byType(GridView), Offset(0, -10));

      // Running the following steps in "true" async
      // so that method channels have a chance to work.
      await tester.runAsync(() async {
        // Tap the card to open the sample.
        await tester.tap(cardFinder);
        await tester.pumpAndSettle();

        // Expect to find a GoogleMap widget. Some samples have more than one.
        expect(find.byType(GoogleMap), findsAny);

        // Get back.
        await tester.pageBack();
        await tester.pumpAndSettle();

        if (runningOnRealDevice) {
          // Give GoogleMap a tiny amount of time to avoid FocusManager
          // being used after disposal.
          await Future<void>.delayed(const Duration(milliseconds: 50));
        }
      });
    }
  });
}

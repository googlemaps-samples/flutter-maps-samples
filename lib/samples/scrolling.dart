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

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This example shows how to maintain proper map interactivity
/// when the map widget is inside a scrollable view.
class ScrollingSample extends StatelessWidget {
  const ScrollingSample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _PlaceholderItem(1),
        _PlaceholderItem(2),
        SizedBox(
          height: 300,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

            // To prevent parent widgets from capturing important
            // gestures (such as ListView getting all the vertical drags),
            // we provide the GoogleMap widget with gesture recognizers.
            gestureRecognizers: {
              // EagerGestureRecognizer ensures the map receives all gestures,
              // taking precedence over other widgets.
              Factory(() => EagerGestureRecognizer()),
            },
          ),
        ),
        _PlaceholderItem(3),
        _PlaceholderItem(4),
        SizedBox(
          height: 300,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

            // Here, we leave scrolling gestures to the ListView.
            // The map still gets taps (which are not consumed by ListView)
            // and also reserves scaling for itself.
            gestureRecognizers: {
              Factory(() => ScaleGestureRecognizer()),
            },
          ),
        ),
        for (var i = 5; i <= 10; i++) _PlaceholderItem(i),
      ],
    );
  }
}

class _PlaceholderItem extends StatelessWidget {
  static const List<String> _loremIpsum = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
        'nisi ut aliquip ex ea commodo consequat.',
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '
        'dolore eu fugiat nulla pariatur.',
    'Excepteur sint occaecat cupidatat non proident, '
        'sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ];

  final int value;

  const _PlaceholderItem(this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(_loremIpsum[(value - 1) % _loremIpsum.length]),
    );
  }
}

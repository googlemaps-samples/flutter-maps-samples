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

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This example demonstrates how to configure a Google Map
/// with handlers for pointer events.
class HandleEventsSample extends StatefulWidget {
  const HandleEventsSample({super.key});

  @override
  State<HandleEventsSample> createState() => _HandleEventsSampleState();
}

class _HandleEventsSampleState extends State<HandleEventsSample> {
  String _response = '(Tap on map or a marker.)';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          onTap: (position) => setState(() => _response = 'Tapped $position.'),
          markers: {
            Marker(
              markerId: MarkerId('my_marker'),
              position: LatLng(51.5099, -0.1180),
              onTap: () => setState(() => _response = 'Tapped marker.'),
            ),
          },
        ),
        Align(
          alignment: Alignment(0, 0.8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(_response),
            ),
          ),
        )
      ],
    );
  }
}

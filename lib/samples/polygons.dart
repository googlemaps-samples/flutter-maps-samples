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

/// Displays a map of the Atlantic Ocean with the shape of the famous
/// Bermuda Triangle drawn over it.
class PolygonsSample extends StatelessWidget {
  const PolygonsSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(25, -72)),
      polygons: {
        Polygon(
          // Polygon id must be unique.
          polygonId: PolygonId('bermuda triangle'),
          points: [
            LatLng(25.28, -80.33),
            LatLng(32.29, -64.79),
            LatLng(18.51, -65.36),
            LatLng(25.28, -80.33), // Same as first point to close polygon.
          ],
          strokeColor: Colors.red,
          fillColor: Colors.yellow,
          consumeTapEvents: true,
          onTap: () => debugPrint('tapped on the Bermuda Triangle'),
        ),
      },
    );
  }
}

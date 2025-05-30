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

/// Displays a map of the North Atlantic Ocean with the route of the Titanic
/// marked on it.
class PolylinesSample extends StatelessWidget {
  const PolylinesSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(49, -23)),
      polylines: {
        Polyline(
          // Polyline id must be unique.
          polylineId: PolylineId('titanic route'),
          points: [
            LatLng(50.90, -1.41), // Southampton
            LatLng(49.65, -1.60), // Cherbourg
            LatLng(49.77, -6.71),
            LatLng(51.83, -8.28), // Cobh
            LatLng(50.96, -8.58),
            LatLng(41.75, -49.90), // Wreck
          ],
          width: 5,
          color: Colors.red,
          geodesic: true,
          // Custom caps and joint types aren't supported on all platforms.
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
          consumeTapEvents: true,
          onTap: () => debugPrint('clicked route'),
        ),
      },
    );
  }
}

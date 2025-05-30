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

/// This example identifies a location on the map with a marker.
/// When the user taps the marker, an info window appears.
class MarkerSample extends StatelessWidget {
  const MarkerSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

      // Use this parameter to place markers on the map.
      markers: {
        Marker(
          // The id needs to be locally unique.
          markerId: MarkerId('my_nairobi_marker'),
          position: LatLng(-1.2898, 36.7747),
          infoWindow: InfoWindow(title: 'Nairobi', snippet: 'More info.'),
          onTap: () => debugPrint('tapped'),
        ),
      },
    );
  }
}

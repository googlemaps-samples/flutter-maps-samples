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

/// This example demonstrates how to set the satellite, terrain,
/// or hybrid map type property.
class MapTypeSample extends StatelessWidget {
  const MapTypeSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

      // Available map types:
      // .normal - Standard road map with streets, political boundaries, labels
      // .satellite - Satellite imagery without street labels or overlays
      // .terrain - Topographic data showing elevation, vegetation, and so on
      // .hybrid - Satellite imagery with road overlays and place labels
      mapType: MapType.satellite,
    );
  }
}

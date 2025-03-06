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

/// Defines a group of nearby markers as a cluster so that the map can
/// collapse them into a single marker when appropriate.
class ClustersSample extends StatelessWidget {
  ClustersSample({super.key});

  final ClusterManager _myCluster =
      ClusterManager(clusterManagerId: ClusterManagerId('my cluster'));

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),

      // You have to supply the list of clusters that are referred to
      // by the map's markers.
      //
      // Note: For clusters to work on the web, you *must* import an additional
      // JavaScript library. Read the web README for info:
      // https://pub.dev/packages/google_maps_flutter_web
      clusterManagers: {_myCluster},
      markers: {
        // Google Maps will smartly cluster markers with the same
        // clusterManagerId. When zoomed in close enough, the cluster will
        // break up into individual markers.
        Marker(
          markerId: MarkerId('in 1'),
          position: LatLng(6.51, 3.37),
          clusterManagerId: _myCluster.clusterManagerId,
        ),
        Marker(
          markerId: MarkerId('in 2'),
          position: LatLng(6.64, 3.52),
          clusterManagerId: _myCluster.clusterManagerId,
        ),
        Marker(
          markerId: MarkerId('in 3'),
          position: LatLng(6.46, 3.58),
          clusterManagerId: _myCluster.clusterManagerId,
        ),
        Marker(
          markerId: MarkerId('in 4'),
          position: LatLng(6.85, 3.63),
          clusterManagerId: _myCluster.clusterManagerId,
        ),

        // Markers without a clusterManagerId will always show independently.
        Marker(
          markerId: MarkerId('out'),
          position: LatLng(5.31, -3.99),
        ),
      },
    );
  }
}

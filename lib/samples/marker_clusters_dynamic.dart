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

/// Demonstrates how to dynamically change the clustering of markers at runtime.
class DynamicClustersSample extends StatefulWidget {
  const DynamicClustersSample({super.key});

  @override
  State<DynamicClustersSample> createState() => _DynamicClustersSampleState();
}

class _DynamicClustersSampleState extends State<DynamicClustersSample> {
  Set<ClusterManager> _clusters = {};

  Set<Marker> _markers = {
    Marker(markerId: MarkerId('seville'), position: LatLng(37.39, -5.98)),
    Marker(markerId: MarkerId('malaga'), position: LatLng(36.71, -4.41)),
    Marker(markerId: MarkerId('cadiz'), position: LatLng(36.52, -6.28)),
    Marker(markerId: MarkerId('gibraltar'), position: LatLng(36.04, -5.61)),
    Marker(markerId: MarkerId('tangier'), position: LatLng(35.76, -5.84)),
    Marker(markerId: MarkerId('chefchaouen'), position: LatLng(35.19, -5.25)),
    Marker(markerId: MarkerId('tetouan'), position: LatLng(35.58, -5.35)),
    Marker(markerId: MarkerId('larache'), position: LatLng(35.19, -6.15)),
  };

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
      clusterManagers: _clusters,
      markers: _markers,
      // We compute clusters as soon as the map has finished loading.
      onMapCreated: (_) => _computeClusters(),
    );
  }

  /// Creates clusters according to some business logic, then calls [setState].
  void _computeClusters() {
    final spainCluster =
        ClusterManager(clusterManagerId: ClusterManagerId('spain'));
    final moroccoCluster =
        ClusterManager(clusterManagerId: ClusterManagerId('morocco'));

    // Here, we simply assign markers above a certain latitude to one cluster,
    // and ones below to another.
    //
    // Real apps will cluster according to some more meaningful relationships
    // between markers.
    final updatedMarkers = _markers
        .map((marker) => marker.copyWith(
              clusterManagerIdParam: marker.position.latitude > 35.96
                  ? spainCluster.clusterManagerId
                  : moroccoCluster.clusterManagerId,
            ))
        .toSet();

    setState(() {
      _clusters = {spainCluster, moroccoCluster};
      _markers = updatedMarkers;
    });
  }
}

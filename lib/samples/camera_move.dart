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

/// The camera position is instantly set to a different view
/// once the user taps a button.
class MoveCameraSample extends StatefulWidget {
  const MoveCameraSample({super.key});

  @override
  State<MoveCameraSample> createState() => _MoveCameraSampleState();
}

class _MoveCameraSampleState extends State<MoveCameraSample> {
  /// An instance of map controller obtained through `onMapCreated`.
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          onMapCreated: (controller) => _controller = controller,
        ),
        Align(
          alignment: Alignment(0, 0.8),
          child: FilledButton(
            onPressed: _onPressed,
            child: Text('Jump to New York'),
          ),
        )
      ],
    );
  }

  /// Called when the button is pressed.
  void _onPressed() {
    // Set up the desired camera update.
    final newYork = CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12);
    final update = CameraUpdate.newCameraPosition(newYork);

    // Move the camera.
    _controller?.moveCamera(update);
  }
}

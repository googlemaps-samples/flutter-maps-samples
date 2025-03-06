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
import 'package:flutter_maps_samples/samples/basic.dart';
import 'package:flutter_maps_samples/samples/camera_animate.dart';
import 'package:flutter_maps_samples/samples/camera_move.dart';
import 'package:flutter_maps_samples/samples/handle_events.dart';
import 'package:flutter_maps_samples/samples/map_controller_async.dart';
import 'package:flutter_maps_samples/samples/map_id.dart';
import 'package:flutter_maps_samples/samples/map_type.dart';
import 'package:flutter_maps_samples/samples/marker.dart';
import 'package:flutter_maps_samples/samples/marker_clusters.dart';
import 'package:flutter_maps_samples/samples/marker_clusters_dynamic.dart';
import 'package:flutter_maps_samples/samples/marker_custom.dart';
import 'package:flutter_maps_samples/samples/marker_dynamic.dart';
import 'package:flutter_maps_samples/samples/my_location.dart';
import 'package:flutter_maps_samples/samples/polygons.dart';
import 'package:flutter_maps_samples/samples/polylines.dart';
import 'package:flutter_maps_samples/samples/scrolling.dart';
import 'package:flutter_maps_samples/samples/styled_map.dart';

void main() {
  runApp(const MyApp());
}

/// This is just the entry point of the app, including code to list the various
/// samples in a simple UI.
///
/// The interesting code that has to do with Google Maps
/// is in the `samples/` subdirectory.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Samples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static final List<Widget> samples = [
    BasicSample(),
    MoveCameraSample(),
    AnimateCameraSample(),
    MarkerSample(),
    CustomMarkerSample(),
    DynamicMarkerSample(),
    ClustersSample(),
    DynamicClustersSample(),
    PolygonsSample(),
    PolylinesSample(),
    MapTypeSample(),
    MapIdSample(),
    StyledMapSample(),
    MyLocationSample(),
    HandleEventsSample(),
    MapControllerAsyncSample(),
    ScrollingSample(),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Google Maps Samples'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 16 / 9,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (var (index, sample) in samples.indexed)
            _buildCard(index, sample, context)
        ],
      ),
    );
  }

  /// Takes one of the widgets from [samples] and builds a tappable
  /// card that pushes a new [Route] with the given sample [widget].
  Widget _buildCard(int index, Widget widget, BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length].shade700;
    final title = _describe(widget);

    return Card(
      key: Key(title),
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _SharedScaffold(
                title: title,
                child: widget,
              ),
            ),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 10)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _describe(Widget widget) {
    final camelCaseString =
        widget.runtimeType.toString().replaceAll('Sample', '');

    // Use a RegEx to find uppercase letters preceded by lowercase letters
    // or other uppercase letters
    return camelCaseString.replaceAllMapped(
        RegExp(r'(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])'),
        (match) => ' ');
  }
}

/// Code shared between sample pages.
class _SharedScaffold extends StatelessWidget {
  final String title;

  final Widget child;

  const _SharedScaffold({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: child,
    );
  }
}

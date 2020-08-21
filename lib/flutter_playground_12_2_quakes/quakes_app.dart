import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_12_2_quakes/model/quake_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'network/network.dart';

class ZoomType {
  static const int zoomOut = 0;
  static const int zoomIn = 1;
}

class ZoomUpdateDirection {
  static const double negative = -1.0;
  static const double positive = 1.0;
}

class QuakesApp extends StatefulWidget {
  @override
  _QuakesAppState createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  Future<QuakeModel> _quakesData;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = <Marker>[];
  double _zoomVal = 5.0;

  @override
  void initState() {
    _quakesData = Network().getQuake();
//    _quakesData.then(
//        (values) => {print("Place: ${values.features[0].properties.place}")});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quake"),
      ),
      body: Stack(
        children: [
          _buildGoogleMap(context),
          _zoomMinus(),
          _zoomPlus(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          findQuakes();
        },
        label: Text("Find Quakes"),
      ),
    );
  }

  Widget _zoomMinus() => _zoomIcon(ZoomType.zoomOut);

  Widget _zoomPlus() => _zoomIcon(ZoomType.zoomIn);

  Widget _zoomIcon(int zoom) {
    Alignment zoomIconAlignment;
    double zoomValUpdateDirection; // 1 or -1
    IconData zoomIcon;

    switch (zoom) {
      case ZoomType.zoomOut:
        zoomIconAlignment = Alignment.topLeft;
        zoomValUpdateDirection = ZoomUpdateDirection.negative;
        zoomIcon = FontAwesomeIcons.searchMinus;
        break;
      case ZoomType.zoomIn:
        zoomIconAlignment = Alignment.topRight;
        zoomValUpdateDirection = ZoomUpdateDirection.positive;
        zoomIcon = FontAwesomeIcons.searchPlus;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: zoomIconAlignment,
        child: IconButton(
          onPressed: () {
            _zoomVal += (zoomValUpdateDirection * 1.0);
            print(_zoomVal);
            _updateMapZoom(_zoomVal);
          },
          icon: Icon(
            zoomIcon,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(36.1083333, -117.8608333),
          zoom: 3.0,
        ),
        markers: Set<Marker>.of(_markers),
      ),
    );
  }

  void findQuakes() {
    setState(() {
      _markers.clear(); // Clear the map in the beginning
      _handleResponse();
    });
  }

  // Create marker for each quake.
  void _handleResponse() {
    setState(() {
      _quakesData.then(
        (quakes) => {
          quakes.features.forEach((quake) {
            _markers.add(
              Marker(
                markerId: MarkerId(quake.id),
                infoWindow: InfoWindow(
                    title: quake.properties.mag.toString(),
                    snippet: quake.properties.title),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueMagenta),
                position: LatLng(quake.geometry.coordinates[1],
                    quake.geometry.coordinates[0]),
                onTap: () {},
              ),
            );
          })
        },
      );
    });
  }

  Future<void> _updateMapZoom(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(40.712776, -74.005974), // New York
          zoom: zoomVal,
        ),
      ),
    );
  }
}

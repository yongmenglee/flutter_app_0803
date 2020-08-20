import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  GoogleMapController mapController;

  // Position (Latitude & Longitude)
  // - Portland.
  static const double latitudeLoc = 45.521563;
  static const double longitudeLoc = -122.677433;
  // - Intel Corp.
  static const double latitudeIntel = 45.5418295;
  static const double longitudeIntel = -122.9170456;

  // _center => Google Map
  final LatLng _center = const LatLng(latitudeLoc, longitudeLoc);

  // _centerMarker => Marker
  static final LatLng _centerMarker = const LatLng(latitudeLoc, longitudeLoc);
  static final LatLng _newMarker = const LatLng(45.509244, -122.633476);
  static final LatLng _latLngIntel =
      const LatLng(latitudeIntel, longitudeIntel);

  // Markers
  Marker portlandMarker = Marker(
    markerId: MarkerId("portland"),
    position: _centerMarker,
    infoWindow: InfoWindow(title: "Portland", snippet: "This is a great town."),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  );

  Marker newMarker = Marker(
    markerId: MarkerId("portland2"),
    position: _newMarker,
    infoWindow: InfoWindow(
        title: "Portland Area", snippet: "Somewhere around Portland."),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  );

  // Camera Position
  static final CameraPosition intelPosition = CameraPosition(
    target: _latLngIntel,
    zoom: 14.780,
  );

  // ===

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
      ),
      body: GoogleMap(
        markers: {portlandMarker, newMarker},
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToIntel,
        label: Text("Intel Corp!"),
        icon: Icon(Icons.location_city),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

//  Future<void> _goToIntel() async {
//    final GoogleMapController controller = await mapController;
//    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition),);
//  }

  Future<void> _goToIntel() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(intelPosition),
    );
  }
}

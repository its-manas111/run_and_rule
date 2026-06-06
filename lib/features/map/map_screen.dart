import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  Location _location = Location();

  List<LatLng> _points = [];
  Set<Polygon> _polygons = {};

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(28.6139, 77.2090),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    _startTracking();
  }

  void _startTracking() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
    }

    _location.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        final latLng =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);

        setState(() {
          _points.add(latLng);
        });

        _controller?.animateCamera(
          CameraUpdate.newLatLng(latLng),
        );

        if (_isLoopClosed()) {
          _createTerritory();
        }
      }
    });
  }

  bool _isLoopClosed() {
    if (_points.length < 10) return false;

    final start = _points.first;
    final end = _points.last;

    const threshold = 0.0002; // adjust sensitivity

    return (start.latitude - end.latitude).abs() < threshold &&
        (start.longitude - end.longitude).abs() < threshold;
  }

  void _createTerritory() {
    final polygon = Polygon(
      polygonId: PolygonId(DateTime.now().toString()),
      points: List.from(_points),
      fillColor: Colors.blue.withOpacity(0.3),
      strokeColor: Colors.blue,
      strokeWidth: 2,
    );

    setState(() {
      _polygons.add(polygon);
      _points.clear(); // reset path
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Run & Rule Map")),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        polygons: _polygons,
        onMapCreated: (controller) {
          _controller = controller;
        },
        myLocationEnabled: true,
        polylines: {
          Polyline(
            polylineId: const PolylineId("path"),
            color: Colors.blue,
            width: 5,
            points: _points,
          ),
        },
      ),
    );
  }
}

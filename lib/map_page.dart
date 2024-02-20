import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with OSMMixinObserver {
  // init the position using the user location
  final mapController = MapController.withUserPosition(
      trackUserLocation: const UserTrackingOption(
    enableTracking: true,
    unFollowUser: false,
  ));

  print() async {
    var text = await mapController.getCurrentPositionAdvancedPositionPicker();
    Text("$text");
    // throw UnimplementedError();
  }

  @override
  void initState() {
    super.initState();
    mapController.addObserver(this);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    // });
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      /// put you logic
    }
  }

  @override
  Future<void> mapRestored() async {
    super.mapRestored();

    /// TO DO
  }

  @override
  void onSingleTap(GeoPoint position) {
    super.onSingleTap(position);

    /// TO DO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Map")),
        body: OSMFlutter(
            controller: mapController,
            osmOption: OSMOption(
              userTrackingOption: const UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              zoomOption: const ZoomOption(
                initZoom: 18,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 1000,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                  ),
                ),
              ),
              roadConfiguration: const RoadOption(
                roadColor: Colors.blueAccent,
              ),
              markerOption: MarkerOption(
                  defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 200,
                ),
              )),
            )));
  }
}

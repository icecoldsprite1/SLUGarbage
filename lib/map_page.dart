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

  // prints location
  print(String s) async {
    if (s == "") {
      var s = await mapController.getCurrentPositionAdvancedPositionPicker();
      Text("$s");
    } else {
      Text(s);
    }
  }

  // add mapController observer/listeners
  @override
  void initState() {
    super.initState();
    mapController.addObserver(this);

    mapController.listenerMapSingleTapping.addListener(() async {
      if (mapController.listenerMapSingleTapping.value != null) {
        // On single tap of the map, get the position of the tap and add a marker there
        var position = mapController.listenerMapSingleTapping.value;
        if (position != null) {
          await mapController.addMarker(position,
              markerIcon: MarkerIcon(

                  // Add empty marker
                  assetMarker: AssetMarker(
                      image:
                          const AssetImage("assets/images/lrc_marker_000.png"),
                      scaleAssetImage: 3)));
        }
      }
    });
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    // });
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      print("Map is Ready");
    }
  }

  @override
  Future<void> mapRestored() async {
    super.mapRestored();

    print("Map is Restored");
  }

  // Single tap on marker
  @override
  void onSingleTap(GeoPoint position) {
    super.onSingleTap(position);
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
                    size: 100,
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
              ))),
    );
  }
}

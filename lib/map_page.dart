import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart' as fs;

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

  // initialize the database
  final db = fs.FirebaseFirestore.instance;

  // void getStaticPoints() async {
  //   var test = await db.collection("markers").get();
  //   log(test.toString());
  // }

  List<StaticPositionGeoPoint> validStaticPoints = [
    StaticPositionGeoPoint(
        "1",
        MarkerIcon(

            // Add empty marker
            assetMarker: AssetMarker(
                image: const AssetImage("assets/images/lrc_marker_123.png"),
                scaleAssetImage: 3)),
        [
          GeoPoint(latitude: 36.99611932929464, longitude: -122.05901616958197),
          GeoPoint(latitude: 36.99822827434794, longitude: -122.05563330593583)
        ]),
    StaticPositionGeoPoint(
        "2",
        MarkerIcon(

            // Add empty marker
            assetMarker: AssetMarker(
                image: const AssetImage("assets/images/lrc_marker_100.png"),
                scaleAssetImage: 3)),
        [
          GeoPoint(
              latitude: 36.998783181997204, longitude: -122.06043128099232),
          GeoPoint(latitude: 36.99921361429618, longitude: -122.06438088665408),
          GeoPoint(latitude: 36.99150277380213, longitude: -122.06492787404888)
        ]),
    StaticPositionGeoPoint(
        "3",
        MarkerIcon(

            // Add empty marker
            assetMarker: AssetMarker(
                image: const AssetImage("assets/images/lrc_marker_120.png"),
                scaleAssetImage: 3)),
        [
          GeoPoint(latitude: 37.00182115013072, longitude: -122.05752037405549),
          GeoPoint(latitude: 37.00073854517794, longitude: -122.06215418812485),
          GeoPoint(latitude: 36.99682293431088, longitude: -122.05479101203613)
        ])
  ];

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
          // var test = position.toString();
          // log(position.latitude.toString());
          // log(position.hashCode.toString());

          await mapController.addMarker(position,
              markerIcon: MarkerIcon(

                  // Add empty marker
                  assetMarker: AssetMarker(
                      image:
                          const AssetImage("assets/images/lrc_marker_000.png"),
                      scaleAssetImage: 3)));

          // Open a card on the bottom for the user to configure the number of bins
          // create static points that will be shown on the map
          final latitude = db.collection("markers").doc("1").get().then(
              (fs.DocumentSnapshot doc) {
            // final data = doc.data() as Map<String, dynamic>;
          }, onError: (e) => print("Error getting document: $e"));
          log(latitude.toString());
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
              ),
              staticPoints: validStaticPoints)),
    );
  }
}

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:bike_kollective/services/geolocator_service.dart';
// import 'package:flutter_config/flutter_config.dart';

// const MAPBOX_STYLE = 'mapbox.mapbox-streets-v8';
// const MARKER_COLOR = 0xFF64B5F6;

// class Map extends StatefulWidget {
//   const Map({Key? key}) : super(key: key);

//   @override
//   _MapState createState() => _MapState();
// }

// class _MapState extends State<Map> with SingleTickerProviderStateMixin {
//   final GeolocatorService geoService = GeolocatorService();
//   late final AnimationController _animationController;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 1500));
//     _animationController.repeat(reverse: true);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Available Bikes")),
//       body: StreamBuilder<Position>(
//           stream: geoService.getCurrentLocation(),
//           builder: (context, snapshot) {
//             return FlutterMap(
//               options: MapOptions(
//                 center:
//                     LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
//                 zoom: 13.0,
//               ),
//               nonRotatedLayers: [
//                 TileLayerOptions(
//                     urlTemplate: FlutterConfig.get("MAPBOX_URL"),
//                     additionalOptions: {
//                       'accessToken': FlutterConfig.get("MAPBOX_API_KEY"),
//                       'id': MAPBOX_STYLE
//                     }),
//                 MarkerLayerOptions(markers: [
//                   Marker(
//                       height: 60,
//                       width: 60,
//                       point: LatLng(
//                           snapshot.data!.latitude, snapshot.data!.longitude),
//                       builder: (_) {
//                         return _MyLocationMarker(_animationController);
//                       })
//                 ])
//               ],
//             );
//           }),
//     );
//   }
// }

// class _MyLocationMarker extends AnimatedWidget {
//   const _MyLocationMarker(Animation<double> animation, {Key? key})
//       : super(
//           key: key,
//           listenable: animation,
//         );

//   @override
//   Widget build(BuildContext context) {
//     final value = (listenable as Animation<double>).value;
//     final newValue = lerpDouble(0.5, 1, value)!;
//     final size = 50;
//     return Center(
//         child: Stack(children: [
//       Center(
//         child: Container(
//           height: size * newValue,
//           width: size * newValue,
//           decoration: BoxDecoration(
//             color: Color(MARKER_COLOR).withOpacity(0.5),
//             shape: BoxShape.circle,
//           ),
//         ),
//       ),
//       Center(
//         child: Container(
//           height: 20,
//           width: 20,
//           decoration: BoxDecoration(
//             color: Color(MARKER_COLOR),
//             shape: BoxShape.circle,
//           ),
//         ),
//       ),
//     ]));
//   }
// }

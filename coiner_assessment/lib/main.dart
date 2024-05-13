// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:math';
import 'package:coiner_assessment/routes.dart';
import 'package:coiner_assessment/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyHomePage(title: 'Maps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<YandexMapController> completer = Completer();
  YandexMap map = const YandexMap();

  void onMapCreated(
    YandexMapController controller,
  ) {
    completer.complete(controller);
    controller.moveCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: Point(
            
            latitude: 10.5036,
            longitude: 7.4337,
          ),
          zoom: 10,
        ),
      ),
      animation: const MapAnimation(duration: 5),
    );
  }

  void recenter() async {
    YandexMapController controller = await completer.future;
    controller.moveCamera(
      CameraUpdate.newCameraPosition(const CameraPosition(
          target: Point(
            latitude: 10.5036,
            longitude: 7.4337,
          ),
          zoom: 10)),
      animation: const MapAnimation(duration: 2),
    );
  }

  final points = [
    const Point(latitude: 6.605874, longitude: 3.349149),
    const Point(latitude: 4.824167, longitude: 7.033611),
    const Point(latitude: 5.500187, longitude: 5.993834),
    const Point(latitude: 6.010519, longitude: 6.910345),
    const Point(latitude: 12.985531, longitude: 7.617144),
    const Point(latitude: 11.833333, longitude: 13.150000),
    const Point(latitude: 7.145244, longitude: 3.327695),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      key: scaffoldKey,
      drawer: const SideBar(),

      // ignore: avoid_unnecessary_containers
      body: Container(
          child: Stack(
        children: [
          YandexMap(
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            onMapCreated: onMapCreated,
            mapType: MapType.map,
            mapObjects: points
                .asMap()
                .map((index, point) {
                  return MapEntry(
                    index,
                    PlacemarkMapObject(
                      mapId: MapObjectId(index.toString()),
                      point: Point(
                          latitude: point.latitude, longitude: point.longitude),
                      opacity: 1,
                      icon: PlacemarkIcon.composite(
                        [
                          PlacemarkCompositeIconItem(
                            style: PlacemarkIconStyle(
                              image: BitmapDescriptor.fromAssetImage(
                                  'assets/pin-2.png'),
                              rotationType: RotationType.rotate,
                              scale: 0.2,
                            ),
                            name: 'home',
                          ),
                        ],
                      ),
                      onTap: (mapObject, point) async {
                        final controller = await completer.future;
                        controller.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: point,
                              zoom: 17,
                            ),
                          ),
                          animation: const MapAnimation(
                            duration: 4,
                          ),
                        );
                        await Future.delayed(const Duration(seconds: 1));
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Point description'),
                              content: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.30,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(point.latitude.toString()),
                                      Text(point.longitude.toString())
                                    ],
                                  ),
                                ),
                              ),
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Navigate')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close')),
                              ],
                              elevation: 10,
                            );
                          },
                        );

                        // Create a polyline from the current location to the tapped point
                        final polyline = Polyline(
                          points: [
                            const Point(latitude: 10.5036, longitude: 7.4337),
                            Point(
                                latitude: point.latitude,
                                longitude: point.longitude)
                          ],
                        );

                        final modifiableList = [...map.mapObjects];
                        final id =
                            '${Random().nextInt(1000000)}-${Random().nextInt(1000000)}';

                        final polylineObject = PolylineMapObject(
                          isVisible: true,
                          strokeWidth: 5.0,
                          outlineWidth: 1.0,
                          strokeColor: Colors.red,
                          outlineColor: Colors.black,
                          mapId: MapObjectId(id),
                          polyline: polyline,
                        );

                        modifiableList.add(polylineObject);

                        YandexMap newMap = YandexMap(
                          mapObjects: modifiableList,
                          mapType: MapType.map,
                        );
                        map = newMap;
                      },
                    ),
                  );
                })
                .values
                .toList(),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.only(right: 10),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: recenter,
            child: const Icon(Icons.center_focus_strong_rounded),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

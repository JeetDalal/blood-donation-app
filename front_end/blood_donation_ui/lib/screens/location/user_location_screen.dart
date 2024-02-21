import 'dart:developer';

import 'package:blood_donation_app/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({super.key});
  static const routeName = '/location-screen';

  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final location = Provider.of<LocationService>(context, listen: false);
      location.getCurrentUserLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<LocationService>(context);
    // log("Latitude:${_provider.lat} Longitude: ${_provider.long}");
    return Scaffold(
      body: SizedBox(
        child: Consumer<LocationService>(
          builder: (context, value, child) {
            return FlutterMap(
              mapController: value.mapController,
              options: MapOptions(
                  center: LatLng(value.lat, value.long),
                  zoom: 20,
                  onTap: ((tapPosition, point) {
                    _provider.setLatLong(point.latitude, point.longitude);
                    log(_provider.address);
                  })),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: "https://openstreetmap.org/copyright",
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(value.lat, value.long),
                      builder: (BuildContext ctx) => Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50.0,
                      ),
                      anchorPos: AnchorPos.align(AnchorAlign.top),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  // latitude - 위도 , longtitude - 경도
  static final LatLng CompanyLatLng = LatLng(
    // 회사 위치
    37.5516,
    126.9250,
  );
  static final CameraPosition initialPosition = CameraPosition(
    target: CompanyLatLng,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: renderAppBar(),
        body: FutureBuilder(
          future: checkPermission(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);

            return Column(children: [
              _CustomGoogleMap(
                initialPosition: initialPosition,
              ),
              ChoolCheckButton(),
            ]);
          },
        ));
  }

  Future<String> checkPermission() async {
    final IsolationEnabled = await Geolocator.isLocationServiceEnabled();

    if (IsolationEnabled) {
      return '위치 서비스를 활성화 해주세요.';
    }

    LocationPermission CheckedPermission = await Geolocator.checkPermission();

    if (CheckedPermission == LocationPermission.denied) {
      CheckedPermission = await Geolocator.requestPermission();
    }
    if (CheckedPermission == LocationPermission.denied) {
      return '위치 권한을 허가해주세요.';
    }

    if (CheckedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 세팅에서 허가해주세요';
    }

    return '위치 권한이 허가되었습니다.';
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        '오늘도 출근',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;

  const _CustomGoogleMap({required this.initialPosition, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
      ),
    );
  }
}

class ChoolCheckButton extends StatelessWidget {
  const ChoolCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text('Hi'));
  }
}

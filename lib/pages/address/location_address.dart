import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/widgets/f_app_bar.dart';
import 'package:restaurant_app/widgets/f_elevated_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAddress extends StatefulWidget {
  LocationAddress({Key key}) : super(key: key);

  @override
  _LocationAddressState createState() => _LocationAddressState();
}

class _LocationAddressState extends State<LocationAddress> {
  GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void initMarker(context, request, requestID) async {
    var markerIdVal = requestID;
    final MarkerId markerId = MarkerId(markerIdVal);
    /*final Marker marker = Marker(
        onTap: () {
          showModalBottomSheet(
              elevation: 0,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) {
                return
              });
        },
        markerId: markerId,
        position:
        LatLng(request.get("coords").latitude, request.get("coords").longitude),
        infoWindow: InfoWindow(
            title: request.get("plat"),
            snippet:
            "${request.get("avis") / request.get("nombre_avis")}".substring(0, 3) +
                " étoiles"));*/
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    final currentPosition = FClass().getFPosition(context);
    return Scaffold(
      appBar: FAppBar("", context),
      body: /*currentPosition ==null ?
      Center(child: CircularProgressIndicator()):
      Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            compassEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(currentPosition.latitude, currentPosition.longitude),
              zoom: 17,
            ),
            onTap: (value) {
              showModalBottomSheet(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) {
                    return Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(22)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getProportionateScreenWidth(15)),
                              topRight: Radius.circular(getProportionateScreenWidth(15)),
                          )
                        ),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: getProportionateScreenWidth(12)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                                color: Colors.grey.shade200,
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: getProportionateScreenWidth(13)),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search_rounded),
                                      hintText: "123 Avenue Street",
                                      hintStyle: theme.textTheme.bodyText1
                                  )
                              )
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: getProportionateScreenWidth(12)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                                color: Colors.grey.shade200,
                              ),
                              child: TextField(
                                enabled: false,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: getProportionateScreenWidth(13)),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.add_rounded),
                                      hintText: "Add Details",
                                      hintStyle: theme.textTheme.bodyText1
                                  )
                              )
                          ),
                          FElevatedButton(
                              context, () {
                          }, "Confirm"),
                        ],
                      )
                    );
                  });
            },
          ),
        ]
      ),*/
      GestureDetector(
        child: Container(
          color: primaryColor,
        ),
        onTap: () {
          showModalBottomSheet(
              elevation: 0,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) {
                return Container(
                  height: size.height*0.4,
                    padding: EdgeInsets.all(getProportionateScreenWidth(22)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(getProportionateScreenWidth(15)),
                          topRight: Radius.circular(getProportionateScreenWidth(15)),
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: getProportionateScreenWidth(12)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                              color: Colors.grey.shade200,
                            ),
                            child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: getProportionateScreenWidth(13)),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.search_rounded),
                                    hintText: "123 Avenue Street",
                                    hintStyle: theme.textTheme.bodyText1
                                )
                            )
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: getProportionateScreenWidth(12)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                              color: Colors.grey.shade200,
                            ),
                            child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: getProportionateScreenWidth(13)),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.add_rounded),
                                    hintText: "Add Details",
                                    hintStyle: theme.textTheme.bodyText1
                                )
                            )
                        ),
                        FElevatedButton(
                            context, () {
                              Navigator.pushNamed(context, "/editAddress");
                        }, "Confirm"),
                      ],
                    )
                );
              });
        },
      )
    );
  }
}
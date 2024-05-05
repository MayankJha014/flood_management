// import 'package:geocoding/geocoding.dart';
import 'package:flood_management/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends ConsumerStatefulWidget {
  const HeaderWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends ConsumerState<HeaderWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(globalControllerProvider.notifier).getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final city = ref.watch(userLocation)?.street;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            backgroundColor: const Color.fromRGBO(41, 39, 60, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          icon: const Icon(
            Icons.my_location_outlined,
            color: Colors.white70,
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Your Current Location",
              style: GoogleFonts.roboto(
                  fontSize: 14, height: 2, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          // margin: const EdgeInsets.only(left: 20, right: 20),
          // alignment: Alignment.topLeft,
          child: Text(
            city ?? "",
            style: GoogleFonts.roboto(
                fontSize: 14, height: 2, color: Colors.white70),
          ),
        ),
        // Container(
        //   // margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        //   // alignment: Alignment.topLeft,
        //   child: Text(
        //     date,
        //     style:
        //         TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
        //   ),
        // ),
      ],
    );
  }
}

import 'package:flood_management/model/weather_data_current.dart';
import 'package:flood_management/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tempeture area
        tempeatureAreaWidget(),

        const SizedBox(
          height: 0,
        ),
        // more details - windspeed, humidity, clouds
        // currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget tempeatureAreaWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "As of 16:11 PM",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "15", // "${weatherDataCurrent.current?.temp!.toInt()}°",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 55,
                          color: CustomColors.textColorYellow,
                          height: 1.2, //You can set your custom height here
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Cloudy", // "${weatherDataCurrent.current?.weather![0].description}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // RichText(
          //   text: TextSpan(children: [
          //     TextSpan(
          //         text: "${weatherDataCurrent.current?.temp!.toInt()}°",
          //         style: const TextStyle(
          //           fontWeight: FontWeight.w600,
          //           fontSize: 68,
          //           color: CustomColors.textColorBlack,
          //         )),
          //     TextSpan(
          //         text: "${weatherDataCurrent.current?.weather![0].description}",
          //         style: const TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 14,
          //           color: Colors.grey,
          //         )),
          //   ]),
          // ),
          Container(
            height: 60,
            width: 1,
            color: CustomColors.dividerLine,
          ),
          Expanded(
            child: Image.asset(
              "assets/weather/01d.png",
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}

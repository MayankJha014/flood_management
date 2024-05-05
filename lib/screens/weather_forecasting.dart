import 'package:flood_management/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherForecasting extends StatefulWidget {
  const WeatherForecasting({super.key});

  @override
  State<WeatherForecasting> createState() => _WeatherForecastingState();
}

class _WeatherForecastingState extends State<WeatherForecasting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather Forecasting",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: ListView(scrollDirection: Axis.vertical, children: [
          const SizedBox(
            height: 20,
          ),
          tempeatureAreaWidget(),
          // for our current temp ('current')
          currentWeatherMoreDetailsWidget()
        ])),
      ),
    );
  }

  Widget tempeatureAreaWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 5,
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

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(17, 255, 255, 255),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      // color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          "assets/icons/windspeed.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wind Speed",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white60,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "50%",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      // color: CustomColors.cardColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          "assets/icons/humidity.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white60,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "50%",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white30,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "1:00 PM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "30*",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/weather/10d.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}

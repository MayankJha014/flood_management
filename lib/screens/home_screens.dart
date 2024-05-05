import 'package:flood_management/screens/flood_level.dart';
import 'package:flood_management/screens/flood_report.dart';
import 'package:flood_management/screens/weather_forecasting.dart';
import 'package:flood_management/widgets/current_weather_widget.dart';
import 'package:flood_management/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final climateData = ref.watch(climateProvider);
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/clouds.png",
                    height: 200,
                    width: 200,
                  ),
                  const CircularProgressIndicator()
                ],
              ))
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),
                    // for our current temp ('current')
                    const CurrentWeatherWidget(
                        // weatherDataCurrent: climateData.current,
                        ),
                    const SizedBox(
                      height: 0,
                    ),
                    // HourlyDataWidget(weatherDataHourly: climateData.hourly),
                    // DailyDataForecast(
                    //   weatherDataDaily: climateData!.daily,
                    // ),
                    // Container(
                    //   height: 1,
                    //   color: CustomColors.dividerLine,
                    // ),
                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        const WeatherForecasting()));
                              },
                              child: Container(
                                // height: 180,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(17, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Image.asset(
                                        "assets/weather/09d.png",
                                        fit: BoxFit.contain,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        "Weather Forecasting",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const FloodLevel()));
                              },
                              child: Container(
                                // height: 180,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(17, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Image.asset(
                                        "assets/icons/water-fee-svgrepo-com.png",
                                        fit: BoxFit.contain,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        "Water Level",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // height: 180,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(17, 255, 255, 255),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Image.asset(
                                      "assets/icons/sea-level.png",
                                      fit: BoxFit.contain,
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      "Flood Status",
                                      style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const FloodReport(),
                                  ),
                                );
                              },
                              child: Container(
                                // height: 170,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(17, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Image.asset(
                                        "assets/icons/report.png",
                                        fit: BoxFit.contain,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        "Flood Report",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                    // ComfortLevel(weatherDataCurrent: dummyData4)
                  ],
                ),
              ),
      ),
    );
  }
}

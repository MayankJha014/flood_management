import 'package:flood_management/controller/global_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloodLevel extends ConsumerStatefulWidget {
  const FloodLevel({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FloodLevelState();
}

class _FloodLevelState extends ConsumerState<FloodLevel> {
  @override
  Widget build(BuildContext context) {
    final city = ref.watch(userLocation)?.street;
    double level = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flood Level",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(17, 102, 102, 102),
              ),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red,
                            ),
                            width: 15,
                            height: 15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "160-200",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            "Danger",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(255, 244, 155, 54),
                            ),
                            width: 15,
                            height: 15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "100-150cm",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            "Warning",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(255, 86, 244, 54),
                            ),
                            width: 15,
                            height: 15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "100-150cm",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            "Warning",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "10cm",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const Center(
              child: Text(
                "No Danger",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                "Update Flood Level",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Text(
                "Address $city",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Text(
                "Level $level",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Slider(
              min: 5.0,
              max: 200.0,
              value: level,
              onChanged: (value) {
                setState(() {
                  level = value;
                });
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

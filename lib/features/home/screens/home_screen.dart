import 'package:auto_route/auto_route.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/navigation/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              context.pushRoute(const WeatherRoute());
            },
            child: const BaseContainer(
              child: Text('Weather'),
            ),
          ),
        ],
      ),
    );
  }
}

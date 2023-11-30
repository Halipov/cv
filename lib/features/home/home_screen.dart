import 'package:auto_route/auto_route.dart';
import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/common/widgets/di_scope/app_scope.dart';
import 'package:cv/features/navigation/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppColorScheme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primary,
        actions: [
          IconButton(
            onPressed: () {
              AppScope.of(context).themeService.switchTheme();
            },
            icon: const Icon(
              Icons.color_lens,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.pushRoute(const WeatherRoute());
              },
              child: const Row(
                children: [
                  Expanded(
                    child: BaseContainer(
                      child: Text(
                        'Weather',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                context.pushRoute(const TodoRoute());
              },
              child: const Row(
                children: [
                  Expanded(
                    child: BaseContainer(
                      child: Text(
                        'ToDo',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                context.pushRoute(AuthRoute());
              },
              child: const Row(
                children: [
                  Expanded(
                    child: BaseContainer(
                      child: Text(
                        'Auth',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

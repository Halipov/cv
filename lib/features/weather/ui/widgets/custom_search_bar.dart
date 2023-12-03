// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/weather/domain/_domain.dart';
import 'package:cv/features/weather/ui/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Color color;
  final String initialQuery;
  final void Function(City city) onComplete;
  const CustomSearchBar({
    super.key,
    required this.color,
    required this.initialQuery,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final repository = WeatherRepositoryScope.of(context).weatherRepository;
    return GestureDetector(
      onTap: () async {
        final city = await showDialog<City>(
          context: context,
          builder: (ctx) => _SearchView(
            weatherRepository: repository,
            initialQuery: initialQuery,
          ),
        );
        if (city != null) {
          onComplete(city);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            initialQuery,
            style: TextStyle(
              color: color,
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.search,
            color: color,
          ),
        ],
      ),
    );
  }
}

class _SearchView extends StatelessWidget {
  final IWeatherRepository weatherRepository;
  final String initialQuery;
  const _SearchView({
    required this.weatherRepository,
    required this.initialQuery,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8).copyWith(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: initialQuery,
                  ),
                  textInputAction: TextInputAction.search,
                  onChanged: weatherRepository.searchCity,
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder<List<City>>(
                  stream: weatherRepository.result,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final city = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(city);
                              },
                              child: BaseContainer(
                                color: AppColorScheme.of(context)
                                    .primary
                                    .withOpacity(0.2),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      city.country,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      city.name,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.length,
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

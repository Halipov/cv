import 'package:auto_route/auto_route.dart';
import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppColorScheme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: theme.primary.withOpacity(0.6),
      body: Stack(
        children: [
          const Positioned(
            left: 15,
            top: 10,
            child: Text(
              'Create a New Task',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight / 1.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.background,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Titles'),
                    const TextField(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Description'),
                    const TextField(
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Deadline'),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: theme.primary,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('EEEE, d MMMM yyyy').format(
                            DateTime.now(),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    BaseContainer(
                      width: double.infinity,
                      height: 50,
                      color: theme.primary.withOpacity(0.7),
                      child: const Text(
                        'Create Task',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

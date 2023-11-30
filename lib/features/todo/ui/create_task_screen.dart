import 'package:auto_route/auto_route.dart';
import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/todo/domain/model/todo.dart';
import 'package:cv/features/todo/enum/priority_enum.dart';
import 'package:flutter/material.dart';

@RoutePage<Todo>()
class CreateTaskScreen extends StatelessWidget {
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  CreateTaskScreen({super.key});

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
                    TextField(
                      controller: titleTextController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Description'),
                    TextField(
                      controller: descriptionTextController,
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.popRoute(
                          Todo(
                            id: '0',
                            name: titleTextController.text,
                            description: descriptionTextController.text,
                            priorityEnum: PriorityEnum.low,
                            isDone: false,
                          ),
                        );
                      },
                      child: BaseContainer(
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

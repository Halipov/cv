import 'package:auto_route/auto_route.dart';
import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/common/widgets/di_scope/app_scope.dart';
import 'package:cv/features/navigation/router.dart';
import 'package:cv/features/todo/di/todo_repository_storage.dart';
import 'package:cv/features/todo/enum/time_tab_enum.dart';
import 'package:cv/features/todo/ui/widgets/di/todo_repository_scope.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TodoScreen extends StatelessWidget implements AutoRouteWrapper {
  const TodoScreen({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return ToDoRepositoryScope(
      create: (context) => TodoRepositoryStorage(
        sqfliteService: AppScope.of(context).sqfliteService,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppColorScheme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: theme.primary,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          context.pushRoute(
            const CreateTaskRoute(),
          );
        },
      ),
      body: Stack(
        children: [
          Positioned(
            left: 16,
            top: 90,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Oleg',
                          style: TextStyle(
                            fontSize: 40,
                            color: theme.onPrimary.withOpacity(0.9),
                          ),
                        ),
                        Text(
                          'Let\'s be productive today!',
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.onPrimary.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: theme.secondary,
                      radius: 30,
                      child: Image.network(
                        'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: theme.primary.withOpacity(1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight / 1.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.background,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: TimeTabEnum.values
                          .map(
                            (e) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: BaseContainer(
                                  child: Text(
                                    e.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
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

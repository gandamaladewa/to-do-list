import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_apk/app/modules/home/widgets/app_container_widget.dart';
import 'dart:async';
import 'controllers/home_controller.dart';
import 'widgets/app_container_done.dart';

class HomeScreen extends GetView<TodoController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _resetTodoListAt2036();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://pbs.twimg.com/media/E-wm1d_VEAArQpC.jpg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'ToDo List',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.todoTitles.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return controller.isChecked[index].value
                        ? const SizedBox.shrink()
                        : Column(
                            children: [
                              AppContainerWidget(
                                title: controller.todoTitles[index],
                                hours: controller.todoHours[index],
                                isChecked: controller.isChecked[index],
                                onChecked: (value) {
                                  controller.updateTodo(index, value);
                                },
                              ),
                              const SizedBox(height: 12),
                            ],
                          );
                  });
                },
              ),
              const SizedBox(height: 24),
              const Divider(
                thickness: 2,
              ),
              const Text(
                'Done',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.todoTitles.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return controller.isChecked[index].value
                        ? Column(
                            children: [
                              AppContainerDone(
                                title: controller.todoTitles[index],
                                hours: controller.todoHours[index],
                                isChecked: controller.isChecked[index],
                              ),
                              const SizedBox(height: 12),
                            ],
                          )
                        : const SizedBox.shrink();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetTodoListAt2036() {
    DateTime now = DateTime.now();
    int delay;
    if (now.hour < 20 || (now.hour == 20 && now.minute < 36)) {
      // If it's before 20:36, calculate the delay until 20:36
      delay = (20 - now.hour) * 3600 + (36 - now.minute) * 60;
    } else {
      // If it's after 20:36, calculate the delay until the next day 20:36
      delay = (24 - now.hour + 20) * 3600 + (36 - now.minute) * 60;
    }

    Timer(Duration(seconds: delay), () {
      controller.resetTodoList();
    });
  }
}

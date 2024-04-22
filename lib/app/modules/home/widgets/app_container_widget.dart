import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppContainerWidget extends StatelessWidget {
  final String? title;
  final String? hours;
  final RxBool isChecked;
  final Function(bool)? onChecked;

  const AppContainerWidget({
    super.key,
    this.title,
    this.hours,
    required this.isChecked,
    this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 229, 229, 229),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Obx(() => Transform.scale(
                      scale: 1.1,
                      child: Checkbox(
                        value: isChecked.value,
                        onChanged: (value) {
                          isChecked.value = value!;
                        },
                      ),
                    )),
                Text(
                  '$title',
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Text(
                    '$hours',
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:get/get.dart';

class TodoController extends GetxController {
  var isChecked = <RxBool>[].obs;

  List<String> todoTitles = [
    'Jogging',
    'Work out',
    'Learning',
    'Go outside',
    'Learn & Games'
  ];

  List<String> todoHours = [
    '06:00 AM',
    '08:00 AM',
    '02:00 PM',
    '05:00 PM',
    '06:00 PM'
  ];

  void resetTodoList() {
    for (var i = 0; i < isChecked.length; i++) {
      isChecked[i].value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Fetch todos from Firestore
    isChecked.addAll(List.generate(todoTitles.length, (index) => false.obs));
  }

  void updateTodo(int index, bool value) {
    isChecked[index](value);
  }
}

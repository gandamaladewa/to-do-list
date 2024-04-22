import 'package:get/get.dart';
import 'package:to_do_list_apk/app/modules/home/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TodoController>(TodoController());
  }
}

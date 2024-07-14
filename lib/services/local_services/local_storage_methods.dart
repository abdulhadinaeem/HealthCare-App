import 'package:healthcare/services/local_services/prefs.dart';

class LocalStorageMethods {
  LocalStorageMethods._();
  static final instance = LocalStorageMethods._();
  Future<void> writeUserCurrentName(String name) async {
    await Prefs.setString('name', name);
  }

  String? getUserCurrentName() {
    String? name = Prefs.getString('name');
    return name;
  }

  Future<bool> clearLocalStorage() async {
    bool? result = await Prefs.clear();
    return result ?? false;
  }
}

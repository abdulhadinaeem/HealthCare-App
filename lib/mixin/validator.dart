mixin Validator {
  String? passwordValidator(value) {
    if (value.isEmpty || value == null) {
      return 'Invalid Password';
    } else if (value.length <= 8) {
      return 'Invalid Password';
    }
    return null;
  }

  String? userNameValidator(value) {
    if (value.isEmpty || value == null) {
      return 'Please enter valid userName';
    }
    return null;
  }

  String? emailValidator(value) {
    if (value.isEmpty || value == null) {
      return 'Please enter valid Email';
    }
    return null;
  }

  String? validatePin(val) {
    if (val!.isEmpty) {
      return 'Invalid Code';
    } else if (val.length != 4) {
      return 'Invalid Code';
    } else {
      return null;
    }
  }
}

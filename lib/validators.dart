class Validators {
  static String required(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String isEmail(String value) {
    if (!value.contains('@')) {
      return 'Please provide a valid email';
    }
    return null;
  }
}

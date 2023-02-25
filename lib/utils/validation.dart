class ValidationUtils {
  static bool _required(String? text) => text == null || text.trim().isEmpty;

  static String? name(String? name, {int minLength = 3}) {
    if (_required(name)) {
      return 'Field is required!';
    }
    if (name!.trim().length < minLength) {
      return 'At least $minLength characters!';
    }
    return null;
  }

  static String? number(String? number, {bool shouldBeInt = false}) {
    if (_required(number)) {
      return 'Field is required!';
    }
    if (num.tryParse(number!.trim())?.isNaN ?? true) {
      return 'Must be a number!';
    }
    if (shouldBeInt &&
        num.parse(number.trim()).truncateToDouble() !=
            double.parse(number.trim())) {
      return 'Must be an integer!';
    }
    return null;
  }
}

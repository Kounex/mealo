class ValidationUtils {
  static String? name(String? name, {int minLength = 3}) {
    if (name == null || name.trim().isEmpty) {
      return 'Field is required!';
    }
    if (name.trim().length < minLength) {
      return 'At least $minLength characters!';
    }
    return null;
  }
}

class ValidationUtils {
  static String? name(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }
    if (name.trim().length < 3) {
      return 'Too short';
    }
    return null;
  }
}

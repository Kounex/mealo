class DateUtils {
  /// Indicates an existing but default [DateTime] value which can be used
  /// to avoid a null property but still be able to identify a to be changed /
  /// default value for [DateTime]
  static DateTime get zero => DateTime.utc(1970);
}

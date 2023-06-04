extension StringExtension on String {
  String? capitalize() {
    if (this == null || isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
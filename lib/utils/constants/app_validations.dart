abstract class AppValidations {
  static const String fileRegex =
      r'(?<file>[^\s]+):(?<line>\d+):(?<column>\d+)';

  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}

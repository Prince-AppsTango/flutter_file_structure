extension TextExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get extractVimeoId {
    RegExp exp = RegExp(r'vimeo\.com/(\d+)');
    var match = exp.firstMatch(this);
    if (match != null && match.groupCount >= 1) {
      return match.group(1) ?? "";
    }
    return "";
  }

  String? get extractVimeoHash {
    RegExp exp = RegExp(r'vimeo\.com/\d+/([a-zA-Z0-9]+)');
    var match = exp.firstMatch(this);
    if (match != null && match.groupCount >= 1) {
      return match.group(1);
    }
    return null;
  }
}

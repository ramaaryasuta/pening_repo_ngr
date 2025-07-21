/// Validasi URL harus diawali dengan 'http://' atau 'https://'.
String? validateHttpUrl(String? value) {
  if (value == null || value.isEmpty) {
    return 'URL cannot be empty';
  }

  final pattern = r'^(http:\/\/|https:\/\/)';
  final regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'URL must start with http:// or https://';
  }

  return null;
}

bool isValidUrl(String url) {
  final pattern = r'^(http:\/\/|https:\/\/)';
  final regex = RegExp(pattern);
  return regex.hasMatch(url);
}

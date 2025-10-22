String normalizeFirestoreName(String input) {
  
  String normalized = input.toLowerCase();

  
  normalized = normalized.replaceAll(RegExp(r'[^a-z0-9]'), '_');

  
  normalized = normalized.replaceAll(RegExp(r'_+'), '_');

  
  normalized = normalized.replaceAll(RegExp(r'^_+|_+$'), '');

  return normalized;
}

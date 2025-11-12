import 'package:cloud_firestore/cloud_firestore.dart';

String documentIdFromLocalData() => DateTime.now().toIso8601String();

String generateFirestoreId(String collectionName) {
  return FirebaseFirestore.instance.collection(collectionName).doc().id;
}

String normalizeFirestoreName(String input) {
  String normalized = input.toLowerCase();
  normalized = normalized.replaceAll(RegExp(r'[^a-z0-9]'), '_');
  normalized = normalized.replaceAll(RegExp(r'_+'), '_');
  normalized = normalized.replaceAll(RegExp(r'^_+|_+$'), '');
  return normalized;
}

String denormalizeFirestoreName(String input) {
  if (input.isEmpty) return input;
  String denormalized = input.replaceAll('_', ' ');
  List<String> words = denormalized.split(' ');
  words = words.map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).toList();
  return words.join(' ');
}

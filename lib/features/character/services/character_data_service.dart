import 'package:flutter/services.dart';
import '../models/character_data.dart';

class CharacterDataService {
  Future<List<CharacterData>> loadCharacters() async {
    try {
      final String csvString =
          await rootBundle.loadString('assets/queen-charlotte.csv');
      
      // CSV dosyasındaki her satır tırnak içinde, önce tırnakları kaldır
      final lines = csvString.split('\n').where((line) => line.trim().isNotEmpty).toList();
      
      if (lines.isEmpty) {
        return [];
      }

      // İlk satır header'ları içeriyor (tırnakları kaldır)
      final headerLine = lines[0].replaceAll('"', '');
      final headers = headerLine.split(',').map((h) => h.trim()).toList();

      // Convert rows to CharacterData objects
      final List<CharacterData> characters = [];
      for (int i = 1; i < lines.length; i++) {
        final line = lines[i].trim();
        if (line.isEmpty) continue;

        // Tırnakları kaldır ve virgülle ayır
        final cleanLine = line.replaceAll('"', '');
        final values = cleanLine.split(',').map((v) => v.trim()).toList();

        if (values.length < headers.length) continue;

        // Create a map from headers to values
        final Map<String, dynamic> rowMap = {};
        for (int j = 0; j < headers.length && j < values.length; j++) {
          rowMap[headers[j]] = values[j];
        }

        try {
          characters.add(CharacterData.fromMap(rowMap));
        } catch (e) {
          // Skip invalid rows
          print('Error parsing row $i: $e');
          continue;
        }
      }

      print('Successfully loaded ${characters.length} characters');
      return characters;
    } catch (e, stackTrace) {
      print('Error loading CSV: $e');
      print('Stack trace: $stackTrace');
      throw Exception('Failed to load character data: $e');
    }
  }

  // Find best matches for a character
  List<CharacterData> findBestMatches(
    CharacterData character,
    List<CharacterData> allCharacters, {
    int limit = 5,
    String? preferredGender,
  }) {
    final List<MapEntry<CharacterData, double>> matches = [];

    for (final other in allCharacters) {
      // Skip self
      if (other.id == character.id) continue;

      // Filter by gender if specified
      if (preferredGender != null && other.gender != preferredGender) {
        continue;
      }

      // Only consider single characters
      if (other.maritalStatus != 'Single') continue;

      final compatibility = character.calculateCompatibility(other);
      matches.add(MapEntry(other, compatibility));
    }

    // Sort by compatibility score (highest first)
    matches.sort((a, b) => b.value.compareTo(a.value));

    // Return top matches
    return matches
        .take(limit)
        .map((entry) => entry.key)
        .toList();
  }
}

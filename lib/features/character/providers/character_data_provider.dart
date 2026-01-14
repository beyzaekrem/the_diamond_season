import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character_data.dart';
import '../services/character_data_service.dart';

final characterDataServiceProvider =
    Provider<CharacterDataService>((ref) => CharacterDataService());

final charactersProvider = FutureProvider<List<CharacterData>>((ref) async {
  final service = ref.watch(characterDataServiceProvider);
  return await service.loadCharacters();
});

final singleCharactersProvider = Provider<List<CharacterData>>((ref) {
  final charactersAsync = ref.watch(charactersProvider);
  return charactersAsync.when(
    data: (characters) =>
        characters.where((c) => c.maritalStatus == 'Single').toList(),
    loading: () => [],
    error: (_, __) => [],
  );
});

final eligibleCharactersProvider = Provider<List<CharacterData>>((ref) {
  final charactersAsync = ref.watch(charactersProvider);
  return charactersAsync.when(
    data: (characters) => characters
        .where((c) => c.maritalStatus == 'Single' && c.willMarry == 'Yes')
        .toList(),
    loading: () => [],
    error: (_, __) => [],
  );
});

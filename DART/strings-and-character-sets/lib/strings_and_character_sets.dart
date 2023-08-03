import 'package:characters/characters.dart';

void main(List<String> args) {
  // simple string 
  print("Simple string [basic string]");
  const myName = "Salomon";
  final runes = myName.runes;
  for (final rune in runes){
    print(rune);
  }

  // emoji code points
  print("Emoji string [Unicode code points]");
  const String familyEmoji = "👩‍👩‍👦‍👦";
  final runes2 = familyEmoji.runes;
  for (final rune in runes2){
    print(rune);
  }

  // using surrogate pairs
  print("Emoji string [code units (surrogate pairs considered)]");
  final surrogatePairs = familyEmoji.codeUnits;
  for (final codeUnit in surrogatePairs){
    print(codeUnit);
  }

  // grapheme clusters with the character package
  print('Emoji string [grapheme cluster using the `characters` package]');
  final graphemeClusters = familyEmoji.characters;
  for (final graphemeCluster in graphemeClusters){
    print(graphemeCluster);
  }

  // raw string
  print('Raw string ');
  final rawString = r"I am your friend. \n My name is Salomon";
  print(rawString);

  // interpolation 
  print('Illustrating string interpolation');
  final age = 21;
  print('I am $age years old');
}
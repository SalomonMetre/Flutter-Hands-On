import 'package:characters/characters.dart';

void main(List<String> args) {
  
  // code points in basic string
  print("Code points [normal string]");
  final basicString = "Hello World";
  for (final character in basicString.runes){
    print(character);
  }

  // code points in emoji
  print('Code points [emoji]');
  final basicString2= "👨‍👩‍👧‍👦";
  for(final character in basicString2.runes){
    print(character);
  }

  // code units in the same emoji (with surrogate pairs)
  print('Code units [emoji, code units, ZWJ & surrogate pairs]');
  for(final character in basicString2.codeUnits){
    print(character);
  }

  // grapheme clusters
  print('Grapheme cluster [using the character package]');
  for(final character in basicString2.characters){
    print(character);
  }
}
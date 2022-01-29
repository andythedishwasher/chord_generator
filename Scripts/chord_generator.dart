import 'list_functions.dart';

chordGen(String? input) {
  const error = 'Not enough data. Consider elaborating.';

  var spacelessString = input!.split(" ").join();

  var characterList = <String?> [];
  spacelessString.split('').forEach((ch) => characterList.add(ch));

  var letterList = removeNonAlphabet(characterList);

  dynamic uniqueLetters =  dupeCheck(letterList);

  dynamic scaleDegrees = convertToScaleDegrees(uniqueLetters);

  if (scaleDegrees == error) {
    return error;
  } else {
    var choppedIterable = Chop(scaleDegrees);

    var rawData = Randomize(choppedIterable);

    if(rawData.length > 4) {
      rawData.removeRange(4, (rawData.length + 1));
    }

    var chordSymbols = Numeralize(rawData);

    return chordSymbols;
  }
}
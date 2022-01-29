import 'package:quiver/iterables.dart';
import 'dart:math';

dupeCheck (List list) {
  const error = 'Not enough data. Consider elaborating.';
  var result = [...{...list}];


  if(result.length < 16){
      return error;
    }
   else if (result.length == 16){
    return result;
  } else if (result.length > 16){
     result.removeRange(16, (result.length));
     return result;
  }
}

removeNonAlphabet (list){
  List alphabet = ['A','a','B','b','C','c','D','d','E','e','F','f',
                   'G','g','H','h','I','i','J','j','K','k','L','l',
                   'M','m','N','n','O','o','P','p','Q','q','R','r',
                   'S','s','T','t','U','u','V','v','W','w','X','x',
                   'Y','y','Z','z'];
  List letters = [];
  List result = [];

  for(var i=0; i < list.length; i++){
    if (alphabet.contains(list[i])){
      letters.add(list[i]);
    }
  }

  var lowerCaseString = letters.join('').toLowerCase();
  lowerCaseString.split('').forEach((ch) => result.add(ch));

  return result;
}

convertToScaleDegrees (list){
  const error = 'Not enough data. Consider elaborating.';
  List scaleDegrees = [];

  if (list == error){
    return list;
  } else {
    for (var i = 0; i < list.length; i++) {
      List alph1 = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
      List alph2 = ['h', 'i', 'j', 'k', 'l', 'm', 'n'];
      List alph3 = ['o', 'p', 'q', 'r', 's', 't', 'u'];
      List alph4 = ['v', 'w', 'x', 'y', 'z'];
      int check1 = alph1.indexOf(list[i]);
      int check2 = alph2.indexOf(list[i]);
      int check3 = alph3.indexOf(list[i]);
      int check4 = alph4.indexOf(list[i]);


      if (check1 != -1) {
        scaleDegrees.add(check1 + 1);
        continue;
      }

      if (check2 != -1) {
        scaleDegrees.add(check2 + 1);
        continue;
      }
      if (check3 != -1) {
        scaleDegrees.add(check3 + 1);
        continue;
      }
      if (check4 != -1) {
        scaleDegrees.add(check4 + 1);
      }
    }

    return scaleDegrees;
  }
}

Chop (List list) {
  var iter = (partition(list, 4));
  var result = [];
  for(var i=0; i < iter.length; i++){
    result.add(iter.elementAt(i));
  }
  return result;
}

Randomize (list) {
  var result = list[Random().nextInt(list.length)];
  return result;
}

Numeralize (list) {
  List numbers = [1,2,3,4,5,6,7];
  List numerals =['I','II','III','IV','V','VI','VII'];
  List result = [];

  for(var i=0; i<4; i++){
    var idx = numbers.indexOf(list[i]);
    var numeral = numerals[idx];
    result.add(numeral);
  }

  return result;
}

specifyMode (list, selector) {
  var degrees = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII'];
  var cMajor = ['C', 'Dm', 'Em', 'F', 'G', 'Am', 'Bdim'];
  var aMinor = ['Am', 'Bdim', 'C', 'Dm', 'Em', 'F', 'G'];
  var dDorian = ['Dm', 'Em', 'F', 'G', 'Am', 'Bdim', 'C'];
  var gMixolydian = ['G', 'Am', 'Bdim', 'C', 'Dm', 'Em', 'F'];
  var result = [];

  for (var i = 0; i < 4; i++) {
    var idx = degrees.indexOf(list[i]);

    if (selector == 'C Major') {
      result.add(cMajor[idx]);
      continue;
    }
    if (selector == 'A Minor') {
      result.add(aMinor[idx]);
      continue;
    }
    if (selector == 'D Dorian') {
      result.add(dDorian[idx]);
      continue;
    }
    if (selector == 'G Mixolydian') {
      result.add(gMixolydian[idx]);
      continue;
    }
    if (selector == 'Raw Scale Degrees') {
      result = list;
    }
  }
  return result;
}


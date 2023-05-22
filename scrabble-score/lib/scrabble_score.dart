

int score(String word){
  int scoreAll = 0;
  List<String> letters = word.split('');
  
  for (var l in letters) {
    if ('a e i o u l n r s t'.contains(l.toLowerCase())) {
      scoreAll += 1;
    }else if('d g'.contains(l.toLowerCase())){
      scoreAll += 2;
    }else if('b c m p'.contains(l.toLowerCase())){
      scoreAll += 3;
    }else if('f h v w y'.contains(l.toLowerCase())){
      scoreAll += 4;
    }else if('k'.contains(l.toLowerCase())){
      scoreAll += 5;
    }else if('j x'.contains(l.toLowerCase())){
      scoreAll += 8;
    }else if('q z'.contains(l.toLowerCase())){
      scoreAll += 10;
    }
  }


  return scoreAll;
}

void main(List<String> args) {
 
  print(score('asdasdasd'));
}

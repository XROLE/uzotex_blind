import 'dart:math' as math;

int generateUniqueId(List<int> randListNum) {
  int id = math.Random().nextInt(500);

  randListNum.forEach((nu) {
    if (nu == id) {
       id++;
    } 
  });

  return id;
}



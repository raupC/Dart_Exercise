class Leap {
  // Put your code here
  bool leapYear(int year) {
    int r = year % 4;
    // ignore: unused_local_variable
    int r2 = year % 100;
    // ignore: unused_local_variable
    int r3 = year % 400;

    bool leap = false;

    print('$year: r: $r  r2: $r2 r3: $r3');
    if (r != 0) {
      print('$year is not leap year');
      return false;
    } else if (r == 0 && r2 == 0) {
      if (r3 == 0) {
        return true;
      } else if (r3 != 0) {
        return false;
      }
    } else if (r == 0 && r2 != 0) {
      return true;
    }

    return leap;
  }
}

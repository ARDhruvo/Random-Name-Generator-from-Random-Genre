/* 
 * @author Kashikizu
 * Initial Completion Date: dd/03/2024 (dd/mm/yyyy)
 * 
 * Things to do:
 * 1. Edit flip() to receive functions and optional functions to execute
 * 2. Make a hybrid check to see what type of name it generates
 * 3. Display the type of name it generates
 */

/*
https://www.mamanatural.com/baby-names/girls/lists/fantasy-names-for-girls/
https://www.mamanatural.com/baby-names/boys/lists/fantasy-names-for-boys/
https://www.thoughtco.com/most-common-us-surnames-1422656
https://www.ssa.gov/oact/babynames/decades/century.html
*/

import 'dart:math';

void main() {
  Generator gen = Generator(); //Starts generating names
  gen.ocd();
}

class Generator extends NameCalc {
  //Main name generator
  Generator() {
    int n = Random().nextInt(10); //Number of names to be genned
    if (n == 0) {
      print("No names were generated");
    } else {
      print("$n names were generated");
      flip(firstFemaleNames, firstMaleNames, lastNames, n, nameGen);
    }
  }
}

class NameCalc extends NameList {
  NameCalc() {}

  void flip(var a, b, c, int n, void func(int s, var a, b)) {
    for (int i = 0; i < n; i++) {
      int s = i + 1;
      int res = rand() % 2;
      if (res == 0) {
        func(s, a, c);
      } else {
        func(s, b, c);
      }
    }
  }

  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }

  void nameGen(int ser, var firstName, lastName) {
    //Gets the name
    int fnIndex = rand() % 21;
    int lnIndex = rand() % 21;
    String name = firstName[fnIndex] + ' ' + lastName[lnIndex];
    print("Name number $ser: $name");
  }
}

class NameList {
  var firstMaleNames = {
    0: 'Daniel',
    1: 'James',
    2: 'Robert',
    3: 'John',
    4: 'Michael',
    5: 'David',
    6: 'William',
    7: 'Richard',
    8: 'Joseph',
    9: 'Thomas',
    10: 'Christopher',
    11: 'Charles',
    12: 'Matthew',
    13: 'Anthony',
    14: 'Mark',
    15: 'Donald',
    16: 'Steven',
    17: 'Andrew',
    18: 'Paul',
    19: 'Joshua',
    20: 'Kenneth',
  };
  var firstFemaleNames = {
    0: 'Lisa',
    1: 'Karen',
    2: 'Sarah',
    3: 'Jessica',
    4: 'Susan',
    5: 'Barbara',
    6: 'Elizabeth',
    7: 'Linda',
    8: 'Jennifer',
    9: 'Patricia',
    10: 'Mary',
    11: 'Nancy',
    12: 'Betty',
    13: 'Sandra',
    14: 'Margaret',
    15: 'Ashley',
    16: 'Kimberly',
    17: 'Emily',
    18: 'Donna',
    19: 'Michelle',
    20: 'Carol'
  };
  var lastNames = {
    0: 'Smith',
    1: 'Johnson',
    2: 'Williams',
    3: 'Brown',
    4: 'Jones',
    5: 'Garcia',
    6: 'Miller',
    7: 'Davis',
    8: 'Rodriguez',
    9: 'Martinez',
    10: 'Hernandez',
    11: 'Lopez',
    12: 'Gonzales',
    13: 'Wilson',
    14: 'Anderson',
    15: 'Thomas',
    16: 'Taylor',
    17: 'Moore',
    18: 'Jackson',
    19: 'Martin',
    20: 'Lee'
  };

  var firstFantMaleNames = {
    0: 'Ajax',
    1: 'Ajaz',
    2: 'Alexavier',
    3: 'Baratheon',
    4: 'Bastian',
    5: 'Calbex',
    6: 'Dexy',
    7: 'Dracon',
    8: 'Draco',
    9: 'Eddard',
    10: 'Elex',
    11: 'Fairfax',
    12: 'Galaxy',
    13: 'Hale',
    14: 'Jaxith',
    15: 'Jedi',
    16: 'Kace',
    17: 'Kendrix',
    18: 'Kiasax',
    19: 'Leax',
    20: 'Mannix',
  };

  var firstFantFemaleNames = {
    0: 'Aeress',
    1: 'Aerilyn',
    2: 'Aerith',
    3: 'Blossom',
    4: 'Blythe',
    5: 'Caerlion',
    6: 'Dauphine',
    7: 'Delilah',
    8: 'Dex',
    9: 'Echo',
    10: 'Elaxi',
    11: 'Fae',
    12: 'Glinda',
    13: 'Golda',
    14: 'Guinevere',
    15: 'Hermione',
    16: 'Imagica',
    17: 'Jinx',
    18: 'Kassandre',
    19: 'Katniss',
    20: 'Leatrix',
  };

  NameList() {}

  void ocd() {
    print("");
  }
}

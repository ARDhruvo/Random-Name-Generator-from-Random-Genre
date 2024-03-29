/* 
 * @author Kashikizu
 * Initial Creation Date: 27/03/2024 (dd/mm/yyyy)
 * Update Date: 28/03/2024 - Added names and functions that I am too lazy to mention
 * Update Date: 29/03/2024 - Added Cyberpunk and Sci-Fi names and increased sample size to 30, upgraded functions, added stat calculation 
 * Initial Completion Date: 29/03/2024 (dd/mm/yyyy)
 */

/* Sauces:
https://www.mamanatural.com/baby-names/girls/lists/fantasy-names-for-girls/
https://www.mamanatural.com/baby-names/boys/lists/fantasy-names-for-boys/
https://www.thoughtco.com/most-common-us-surnames-1422656
https://www.ssa.gov/oact/babynames/decades/century.html
https://blog.prepscholar.com/unique-cool-last-names
https://student-tutor.com/blog/200-iconic-fantasy-last-names-for-your-next-bestseller/
https://chartopia.d12dev.com/chart/8727/
https://parenting.firstcry.com/articles/40-cool-fantasy-and-sci-fi-baby-names-for-boys/
https://parenting.firstcry.com/articles/40-unique-sci-fi-and-fantasy-names-for-girl-babies/
https://hobbylark.com/writing/cool-last-names
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
      for (int i = 0; i < n; i++) {
        int s = i + 1;
        int nameType = univRoll(5);
        nameRoll(nameType, s, types);
      }
      nameStats("Masculine", mas, n);
      nameStats("Feminine", fem, n);
      ocd();
      print("Where,");
      for (int i = 0; i < genre.length; i++) {
        if (genre[i] != 0) {
          nameStats(types[i], genre[i], n);
        }
      }
    }
  }
}

class NameCalc extends NameList {
  NameCalc() {}

  void flipName(var a, b, c, int s, void func(int s, var a, b)) {
    int res = rand() % 2;
    if (res == 0) {
      func(s, a, c);
      print("Name Type: Masculine");
      mas++;
    } else {
      func(s, b, c);
      print("Name Type: Feminine");
      fem++;
    }
  }

  void nameRoll(int cases, s, List<String> types) {
    switch (cases) {
      case 0:
        {
          //Simple Name
          flipName(firstMaleNames, firstFemaleNames, lastNames, s, nameGen);
          print("Name Genre: ${types[cases]}");
          genre[cases]++;
          ocd();
        }
        break;
      case 1:
        {
          //Fant Name
          flipName(firstFantMaleNames, firstFantFemaleNames, fantLastNames, s,
              nameGen);
          print("Name Genre: ${types[cases]}");
          genre[cases]++;
          ocd();
        }
        break;
      case 2: //Cyber Name
        {
          flipName(firstCyberMaleNames, firstCyberFemaleNames, lastCyberNames,
              s, nameGen);
          print("Name Genre: ${types[cases]}");
          genre[cases]++;
          ocd();
        }
        break;
      case 3: //Scifi Name
        {
          flipName(
              firstSciMaleNames, firstSciFemaleNames, lastSciNames, s, nameGen);
          print("Name Genre: ${types[cases]}");
          ocd();
          genre[cases]++;
        }
        break;

      default: //Hybrid
        {
          var maleName = [
            firstMaleNames,
            firstFantMaleNames,
            firstCyberMaleNames,
            firstSciMaleNames
          ];
          var femaleName = [
            firstFemaleNames,
            firstFantFemaleNames,
            firstCyberFemaleNames,
            firstSciFemaleNames
          ];
          var lastName = [
            lastNames,
            fantLastNames,
            lastCyberNames,
            lastSciNames
          ];
          int hybridFirstMaleRoll = univRoll(4);
          int hybridFirstFemaleRoll = univRoll(4);
          int hybridLastRoll = univRoll(4);
          if (hybridLastRoll == hybridFirstMaleRoll ||
              hybridLastRoll == hybridFirstFemaleRoll) {
            hybridLastRoll = hybridLastRoll % 2;
          }
          flipName(
              maleName[hybridFirstMaleRoll],
              femaleName[hybridFirstFemaleRoll],
              lastName[hybridLastRoll],
              s,
              nameGen);
          print("Name Genre: Hybrid");
          genre[cases]++;
          ocd();
        }
    }
  }

  void nameGen(int ser, var firstName, lastName) {
    //Gets the name
    int fnIndex = rand() % 31;
    int lnIndex = rand() % 31;
    String name = firstName[fnIndex] + ' ' + lastName[lnIndex];
    print("Name number $ser: $name");
  }

  void nameStats(String type, int f, n) {
    double freq = percCalc(f, n);
    print("$type type of name was generated $freq% of the time");
  }
}

class NameList extends UnivCalc {
  List<String> types = ['Regular', 'Fantasy', 'Cyberpunk', 'Sci-Fi', 'Hybrid'];

  var firstMaleNames = [
    'Daniel',
    'James',
    'Robert',
    'John',
    'Michael',
    'David',
    'William',
    'Richard',
    'Joseph',
    'Thomas',
    'Christopher',
    'Charles',
    'Matthew',
    'Anthony',
    'Mark',
    'Donald',
    'Steven',
    'Andrew',
    'Paul',
    'Joshua',
    'Kenneth',
    'Kevin',
    'Brian',
    'George',
    'Timothy',
    'Ronald',
    'Jason',
    'Edward',
    'Jeffrey',
    'Ryan',
    'Jacob'
  ];
  var firstFemaleNames = [
    'Lisa',
    'Karen',
    'Sarah',
    'Jessica',
    'Susan',
    'Barbara',
    'Elizabeth',
    'Linda',
    'Jennifer',
    'Patricia',
    'Mary',
    'Nancy',
    'Betty',
    'Sandra',
    'Margaret',
    'Ashley',
    'Kimberly',
    'Emily',
    'Donna',
    'Michelle',
    'Carol',
    'Amanda',
    'Melissa',
    'Deborah',
    'Stephanie',
    'Dorothy',
    'Rebecca',
    'Sharon',
    'Laura',
    'Cynthia',
    'Amy'
  ];
  var lastNames = [
    'Smith',
    'Johnson',
    'Williams',
    'Brown',
    'Jones',
    'Garcia',
    'Miller',
    'Davis',
    'Rodriguez',
    'Martinez',
    'Hernandez',
    'Lopez',
    'Gonzales',
    'Wilson',
    'Anderson',
    'Thomas',
    'Taylor',
    'Moore',
    'Jackson',
    'Martin',
    'Lee',
    'Perez',
    'Thompson',
    'White',
    'Harris',
    'Sanchez',
    'Clark',
    'Ramirez',
    'Lewis',
    'Robinson',
    'Walker'
  ];

  var firstFantMaleNames = [
    'Ajax',
    'Ajaz',
    'Alexavier',
    'Baratheon',
    'Bastian',
    'Calbex',
    'Dexy',
    'Dracon',
    'Draco',
    'Eddard',
    'Elex',
    'Fairfax',
    'Galaxy',
    'Hale',
    'Jaxith',
    'Jedi',
    'Kace',
    'Kendrix',
    'Kiasax',
    'Leax',
    'Mannix',
    'Alexios',
    'Alix',
    'Baxley',
    'Bazz',
    'Benjen',
    'Calix',
    'Dryden',
    'Dunixi',
    'Elex',
    'Elvin'
  ];

  var firstFantFemaleNames = [
    'Aeress',
    'Aerilyn',
    'Aerith',
    'Blossom',
    'Blythe',
    'Caerlion',
    'Dauphine',
    'Delilah',
    'Dex',
    'Echo',
    'Elaxi',
    'Fae',
    'Glinda',
    'Golda',
    'Guinevere',
    'Hermione',
    'Imagica',
    'Jinx',
    'Kassandre',
    'Katniss',
    'Leatrix',
    'Aerona',
    'Aeronwen',
    'Caerwyn',
    'Calandra',
    'Calixte',
    'Domino',
    'Dream',
    'Electra',
    'Faeryn',
    'Felixa'
  ];

  var fantLastNames = [
    'Abednego',
    'Cyprus',
    'Dagon',
    'Damaris',
    'Einar',
    'Festus',
    'Gallio',
    'Griffin',
    'Kami',
    'Lightfoot',
    'Luna',
    'Priestley',
    'Sierra',
    'Atwater',
    'Agassi',
    'Dobermann',
    'Akagawa',
    'Humblecut',
    'Marblemaw',
    'Desai',
    'Darby',
    'Draper',
    'Sacredmore',
    'Truthbelly',
    'Monsterbelly',
    'Boneflare',
    'Whesker',
    'Wong',
    'Shadegrove',
    'Hazerider',
    'Rapidclaw'
  ];

  var firstCyberFemaleNames = [
    'Toni',
    'Simula',
    'Akiko',
    'Parity',
    'Gerty',
    'Shaylea',
    'Kalle',
    'Star',
    'Ayvee',
    'Chang',
    'Alexa',
    'Adi',
    'Lexie',
    'Angel',
    'Ning',
    'Sprite',
    'Anna',
    'Io',
    'Lunar',
    'Alita',
    'Asta',
    'Pipa',
    'Pixel',
    'Link',
    'Amiga',
    'Meta',
    'Organia',
    'Chyu',
    'Tiff',
    'Gai',
    'Jeri'
  ];

  var firstCyberMaleNames = {
    0: 'Niko',
    1: 'Dare',
    2: 'Grid',
    3: 'Brick',
    4: 'Catch',
    5: 'Mox',
    6: 'Dozer',
    7: 'Ghost',
    8: 'Chen',
    9: 'Juan',
    10: 'Wallace',
    11: 'William',
    12: 'Brad',
    13: 'Tom',
    14: 'Blaze',
    15: 'Crispin',
    16: 'Cyrano',
    17: 'Derry',
    18: 'Cael',
    19: 'Devin',
    20: 'Edvin',
    21: 'Ezra',
    22: 'Harlen',
    23: 'Isaiah',
    24: 'Klavan',
    25: 'Loki',
    26: 'Idris',
    27: 'Jace',
    28: 'Kian',
    29: 'Lucius',
    30: 'Milo'
  };

  var lastCyberNames = {
    0: 'Diseth',
    1: 'Avison',
    2: 'Sonoda',
    3: 'Dilucca',
    4: 'Rocheford',
    5: 'Sabine',
    6: 'Cayne',
    7: 'Esperon',
    8: 'Cedeno',
    9: 'Forgrave',
    10: 'Basset',
    11: 'Belmont',
    12: 'Lockley',
    13: 'Blackford',
    14: 'Flanigan',
    15: 'Kendrick',
    16: 'Lane',
    17: 'Dial',
    18: 'Khalifa',
    19: 'Black',
    20: 'Ashley',
    21: 'Kenner',
    22: 'Blue',
    23: 'Sims',
    24: 'Kent',
    25: 'Dkymm',
    26: 'Gunner',
    27: 'Fox',
    28: 'Carter',
    29: 'Silver',
    30: 'Rhoades'
  };

  var firstSciFemaleNames = {
    0: 'Adora',
    1: 'Althea',
    2: 'Alia',
    3: 'Alura',
    4: 'Zyla',
    5: 'Zephyra',
    6: 'Zorina',
    7: 'Zoraida',
    8: 'Xaviera',
    9: 'Winter',
    10: 'Victorine',
    11: 'Valyria',
    12: 'Ursula',
    13: 'Tallulah',
    14: 'Theodora',
    15: 'Theia',
    16: 'Sylvia',
    17: 'Sarah',
    18: 'Seren',
    19: 'Seraphine',
    20: 'Sylviana',
    21: 'Sorcha',
    22: 'Octavia',
    23: 'Nyx',
    24: 'Panthea',
    25: 'Marina',
    26: 'Leta',
    27: 'Luna',
    28: 'Laelia',
    29: 'Iris',
    30: 'Galatea'
  };

  var firstSciMaleNames = {
    0: 'Albus',
    1: 'Artemis',
    2: 'Caspian',
    3: 'Deckard',
    4: 'Emmett',
    5: 'Garrick',
    6: 'H.G.',
    7: 'Harold',
    8: 'Jareth',
    9: 'Kirk',
    10: 'Lando',
    11: 'Max',
    12: 'Montgomery',
    13: 'Mulder',
    14: 'Odo',
    15: 'Aslan',
    16: 'Clyde',
    17: 'Anakin',
    18: 'Ari',
    19: 'Daario',
    20: 'Heil',
    21: 'Klaus',
    22: 'Kylo',
    23: 'Luke',
    24: 'Neo',
    25: 'Casper',
    26: 'Elliot',
    27: 'Innis',
    28: 'Nico',
    29: 'Burton',
    30: 'Sisko'
  };

  var lastSciNames = {
    0: 'Alastair',
    1: 'Aphelion',
    2: 'Callisto',
    3: 'Chrysalis ',
    4: 'Furi ',
    5: 'Gibbethon ',
    6: 'Nadir ',
    7: 'Gregorios ',
    8: 'Omega',
    9: 'Sapphirus ',
    10: 'Silvius ',
    11: 'Umbra ',
    12: 'Zibia ',
    13: 'Hovland',
    14: 'Trench',
    15: 'Ermine',
    16: 'Winters',
    17: 'Faddis',
    18: 'Lomax',
    19: 'Mantooth',
    20: 'Huxley',
    21: 'Bozzelli',
    22: 'Mintz',
    23: 'Kipps',
    24: 'Cabada',
    25: 'Otto',
    26: 'Blixt',
    27: 'Pittman',
    28: 'Bisley',
    29: 'Carlisle',
    30: 'Arrington'
  };

  NameList() {}
}

class UnivCalc {
  int mas = 0, fem = 0;
  List<int> genre = [0, 0, 0, 0, 0];

  int lifeCheck = 1;
  UnivCalc() {}

  //Rolls to get a case out of n cases
  int univRoll(int n) {
    int cases = rand() % n;
    return cases;
  }

  //Calculates % stats
  double percCalc(int f, n) {
    double percFace = (f / n) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    return percRound;
  }

  //Returns a random number
  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }

  //Returns a random number between 10; Used for determining loop numbers
  int gen() {
    int value = Random().nextInt(10);
    return value;
  }

  void ocd() {
    print("");
  }
}

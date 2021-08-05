class Question {
  late String questionText;
  late bool isCorrect;

  Question.name(this.questionText, this.isCorrect);
}

class QuestionList {
  List questionBank = [
    Question.name(
        "Friends star Lisa Kudrow was originally cast in the sitcom Frasier",
        true),
    Question.name(
      "If you’re born between May 1st and 20th, then you’re a Gemini",
      true,
    ),
    Question.name("Emma Roberts is the daughter of Julia Roberts", true),
    Question.name(
        "There are over 2,500 stars on the Hollywood Walk of Fame", true),
    Question.name(
        "Fruit flies were the first living creatures sent into space", true),
    Question.name(
        "Cyclones spin in a clockwise direction in the southern hemisphere",
        true),
    Question.name("Goldfish only have a memory of three seconds", true),
    Question.name("The capital of Libya is Benghazi", true),
    Question.name("Dolly Parton is the godmother of Miley Cyrus", true),
    Question.name(
        "Roger Federer has won the most Wimbledon titles of any player", true),
    Question.name("An octopus has five hearts", true),
    Question.name(
        "Brazil is the only country in the Americas to have the official language of Portuguese",
        true),
    Question.name(
        "The Channel Tunnel is the longest rail tunnel in the world", true),
    Question.name(
        "Darth Vader famously says the line “Luke, I am your father” in The Empire Strikes Back",
        true),
    Question.name(
        "Olivia Newton-John represented the UK in the Eurovision Song Contest in 1974, the year ABBA won with “Waterloo” ",
        true),
    Question.name("Stephen Hawking declined a knighthood from the Queen", true),
    Question.name("The highest mountain in England is Ben Nevis", true),
    Question.name(
        "Nicolas Cage and Michael Jackson both married the same woman", true),
    Question.name(
        "Japan and Russia did not sign a peace treaty after World War Two so are technically still at war",
        true),
    Question.name(
        "The mathematical name for the shape of a Pringle is hyperbolic paraboloid",
        true),
    Question.name(
        "Charlie Chaplin came first in a Charlie Chaplin look-alike contest",
        true),
    Question.name("Michael Keaton’s real name is Michael Douglas", true),
    Question.name("Napoleon was of below-average height", true),
    Question.name("Donald Duck’s middle name is Fauntelroy", true),
    Question.name("The Statue of Liberty was a gift from France", true),
    Question.name(
        "According to Scottish law, it is illegal to be drunk in charge of a cow",
        true),
    Question.name("The Great Wall of China is visible from space", true),
    Question.name("The first tea bags were made of silk", true),
    Question.name("Meghan Markle’s first name is Rachel", true),
    Question.name("Warsaw is the capital of Bulgaria", true),
    Question.name("A metre is further than a yard", true),
    Question.name("A woman has walked on the moon", true),
    Question.name(
        "Flying in an aeroplane is statistically safer than driving in a car",
        true),
  ];
}

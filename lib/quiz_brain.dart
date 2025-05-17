import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('You can lead a cow downstairs but not upstairs.', false),
    Question('Approximately one quarters of human bones are in feet', true),
    Question('A slug\'s blood is green', true),
    Question('The Great Wall of China is visible from space.', false),
    Question('Lightning never strikes the same place twice.', false),
    Question('Humans and dinosaurs coexisted.', false),
    Question('Bananas grow on trees.', false),
    Question('An octopus has three hearts.', true),
    Question('Goldfish only have a memory of three seconds.', false),
    Question('Humans share 50% of their DNA with bananas.', true),
    Question('Bulls get angry when they see red.', false),
    Question('There are more stars in the universe than grains of sand on Earth.', true),
    Question('The Eiffel Tower can grow taller in summer.', true),
    Question('Water boils at 100°C at all altitudes.', false),
    Question('Sound travels faster in water than in air.', true),
    Question('The human body has four lungs.', false),
    Question('Some cats are allergic to humans.', true),
    Question('Honey never spoils.', true),
    Question('The Atlantic Ocean is the biggest ocean on Earth.', false),
    Question('Sharks are mammals.', false),
    Question('The unicorn is the national animal of Scotland.', true),
    Question('Tomatoes are vegetables.', false),
    Question('Venus is the hottest planet in the solar system.', true),
    Question('There are five senses in the human body.', false),
    Question('Humans can distinguish over a trillion different smells.', true),
    Question('Polar bears have black skin.', true),
    Question('The longest river in the world is the Amazon.', false),
    Question('An ostrich\'s eye is bigger than its brain.', true),
    Question('Adult humans have 206 bones.', true),
    Question('Bats are blind.', false),
  ];

  get context => null;

  void getNextQuestion(){
    if(_questionNumber<_questionBank.length-1) {
      _questionNumber++;
    }
  }

  bool isFinished(){
    if(_questionNumber>=_questionBank.length-1){
      return true;
    } else {
      return false;
    }
  }

  void reset(){
    _questionNumber=0;

  }

  String getQuestion(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
}
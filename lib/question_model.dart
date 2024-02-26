class Question {
  final String questationText;
  final List<Answer> answerList;

  Question(this.questationText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  // add questions and answer here
  list.add(Question(
    'Sheeg ninkii afhayeenka u ahaa asxaabtii u hijrootay ardul xabash ?',
    [
      Answer('Jacfar bin abii daalib RC', true),
      Answer('Mohamed Mascuud', false),
      Answer('Dalxa ', true),
      Answer('Umo maalik', false),
    ],
  ));
  list.add(Question(
    'Sheeg kumuu ahaa asxaabigii loo-aqoon jiray tartamaagii quraanka kariimka?',
    [
      Answer('Cumar binu cali', false),
      Answer('Cali binu daalib', false),
      Answer('C/laahi binu Cabaas RC', true),
      Answer('Cismaan ', false)
    ],
  ));
  list.add(Question(
    'Sheeg magaca rasuulka nnKh hooyadii oo saddexan ?',
    [
      Answer('Aamina bintu wahab binu cabdi manaaf', true),
      Answer('sahra bintu wahab', false),
      Answer('Caasha binu cabdi manaaf', false),
    ],
  ));
  list.add(Question(
    'Sheeg qofkii ugu hor rumeeyey rasuulka nnKh oo haween ah ?',
    [
      Answer('Hooyo Caasha', false),
      Answer('Hooyo Khadiija binti khuweylad ', true),
      Answer('Hooyo Maryan', false),
    ],
  ));
  list.add(Question(
    'Sheeg nabiga nnKh yaa ugu hor rumeeyey caruurta yar yar?',
    [
      Answer('Abdikariim Ali', false),
      Answer('Faaris Mohamed ', false),
      Answer('Cali bin abuu daalib', true),
    ],
  ));
  list.add(Question(
    'Sheeg ninkii ugu horeeyey ee muslimiinta salaad jimco tujiyay?',
    [
      Answer('Sacad bin suraara RC', false),
      Answer('Sulaybaan Faaris ', false),
      Answer('Cumar bin khadab RC', true),
      Answer('C/laahi bin Cabaas RC', false),
    ],
  ));
  list.add(Question(
    'Sheeg asxabigii bilaabay labada ragcadood ee qofka la dilaayo lagu tukado?',
    [
      Answer('Sacad bin abii RC', false),
      Answer('Qubayd bin cadi RC ', false),
      Answer('Cumar bin khadab RC', true),
      Answer('C/laahi bin Cabaas RC', false),
    ],
  ));
  list.add(Question(
    'Sheeg qofkii ugu horeeyey ee nabiga (NNKH) salaanta islaamka ku salaamay?',
    [
      Answer('Sacad bin suraara RC', false),
      Answer('Abuu darr alqafi Rc', true),
      Answer('Cumar bin khadab RC', true),
      Answer('C/laahi bin Cabaas RC', false),
    ],
  ));
  return list;
}

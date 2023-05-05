class PersonalityTestModel{
  double?extroversion;
  double?Agreeableness;
  double?conscientiousness;
  double? neurotocism;
  double? openess;

  PersonalityTestModel({
    required this.extroversion, required this.Agreeableness, required this.conscientiousness, required this.neurotocism, required this.openess
});

  PersonalityTestModel.fromJson(Map<String,dynamic>json){
    extroversion = json['extroversion'];
    Agreeableness = json['agreeableness'];
    conscientiousness = json['consientiousness'];
    neurotocism = json['neurotocism'];
    openess = json['openess'];

  }
  Map<String,double?>toJson()=>{
    'extroversion' : extroversion,
    'agreeableness' : Agreeableness,
    'consientiousness' : conscientiousness,
    'neurotocism' : neurotocism,
    "openess" : openess
  };
}
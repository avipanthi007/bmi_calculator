import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeScreenModel {
  double height;
  int weight;
  int age;
  HomeScreenModel({
    required this.height,
    required this.weight,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'weight': weight,
      'age': age,
    };
  }

  factory HomeScreenModel.fromMap(Map<String, dynamic> map) {
    return HomeScreenModel(
      height: map['height'] as double,
      weight: map['weight'] as int,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeScreenModel.fromJson(String source) => HomeScreenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

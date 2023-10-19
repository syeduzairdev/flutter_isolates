class PersonModel {
  String? name;
  String? position; // Only for employee data
  int? salary; // Only for employee data
  String? relation; // Only for relatives data
  int? age; // Only for relatives data

  PersonModel({this.name, this.position, this.salary, this.relation, this.age});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      position: json['position'],
      salary: json['salary'],
      relation: json['relation'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (position != null) data['position'] = position;
    if (salary != null) data['salary'] = salary;
    if (relation != null) data['relation'] = relation;
    if (age != null) data['age'] = age;
    return data;
  }
}

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentDataModel {
  String? childName;
  String? gender;
  Timestamp? dateTime;

  AppointmentDataModel({
    this.childName,
    this.gender,
    this.dateTime,
  });

  AppointmentDataModel copyWith({
    String? childName,
    String? gender,
    Timestamp? dateTime,
  }) {
    return AppointmentDataModel(
      childName: childName ?? this.childName,
      gender: gender ?? this.gender,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'childName': childName,
      'gender': gender,
      'dateTime': dateTime,
    };
  }

  factory AppointmentDataModel.fromMap(Map<String, dynamic> map) {
    return AppointmentDataModel(
      childName: map['childName'] != null ? map['childName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as Timestamp : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentDataModel.fromJson(String source) =>
      AppointmentDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppointmentDataModel(childName: $childName, gender: $gender, dateTime: $dateTime)';

  @override
  bool operator ==(covariant AppointmentDataModel other) {
    if (identical(this, other)) return true;

    return other.childName == childName &&
        other.gender == gender &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode => childName.hashCode ^ gender.hashCode ^ dateTime.hashCode;
}

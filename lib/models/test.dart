// To parse this JSON data, do
//
//     final testmodel = testmodelFromJson(jsonString);

import 'dart:convert';

List<Testmodel> testmodelFromJson(String str) => List<Testmodel>.from(json.decode(str).map((x) => Testmodel.fromJson(x)));

String testmodelToJson(List<Testmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Testmodel {
    int id;
    String name;
    int size;
    Supervisor supervisor;
    Class testmodelClass;
    List<Supervisor> teatchers;

    Testmodel({
        required this.id,
        required this.name,
        required this.size,
        required this.supervisor,
        required this.testmodelClass,
        required this.teatchers,
    });

    factory Testmodel.fromJson(Map<String, dynamic> json) => Testmodel(
        id: json["id"],
        name: json["name"],
        size: json["size"],
        supervisor: Supervisor.fromJson(json["supervisor"]),
        testmodelClass: Class.fromJson(json["class"]),
        teatchers: List<Supervisor>.from(json["teatchers"].map((x) => Supervisor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": size,
        "supervisor": supervisor.toJson(),
        "class": testmodelClass.toJson(),
        "teatchers": List<dynamic>.from(teatchers.map((x) => x.toJson())),
    };
}

class Supervisor {
    int id;
    FirstName firstName;
    Name lastName;
    dynamic password;
    Name phoneNumber;
    Name email;
    dynamic material;
    dynamic section;

    Supervisor({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.password,
        required this.phoneNumber,
        required this.email,
        this.material,
        this.section,
    });

    factory Supervisor.fromJson(Map<String, dynamic> json) => Supervisor(
        id: json["id"],
        firstName: firstNameValues.map[json["firstName"]]!,
        lastName: nameValues.map[json["lastName"]]!,
        password: json["password"],
        phoneNumber: nameValues.map[json["phoneNumber"]]!,
        email: nameValues.map[json["email"]]!,
        material: json["material"],
        section: json["section"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstNameValues.reverse[firstName],
        "lastName": nameValues.reverse[lastName],
        "password": password,
        "phoneNumber": nameValues.reverse[phoneNumber],
        "email": nameValues.reverse[email],
        "material": material,
        "section": section,
    };
}

enum Name {
    EMPTY,
    STRING
}

final nameValues = EnumValues({
    "الصف الأول": Name.EMPTY,
    "string": Name.STRING
});

enum FirstName {
    RANA,
    STRING
}

final firstNameValues = EnumValues({
    "rana": FirstName.RANA,
    "string": FirstName.STRING
});

class Class {
    int id;
    Name name;

    Class({
        required this.id,
        required this.name,
    });

    factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

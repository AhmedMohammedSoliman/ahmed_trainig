/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
    RegisterResponseModel({
        required this.password,
        required this.role,
        required this.creationAt,
        required this.name,
        required this.avatar,
        required this.id,
        required this.email,
        required this.updatedAt,
    });

    String password;
    String role;
    DateTime creationAt;
    String name;
    String avatar;
    int id;
    String email;
    DateTime updatedAt;

    factory RegisterResponseModel.fromJson(Map<dynamic, dynamic> json) => RegisterResponseModel(
        password: json["password"],
        role: json["role"],
        creationAt: DateTime.parse(json["creationAt"]),
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "password": password,
        "role": role,
        "creationAt": creationAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "id": id,
        "email": email,
        "updatedAt": updatedAt.toIso8601String(),
    };
}

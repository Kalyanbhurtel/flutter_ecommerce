// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final String? status;
    final String? message;
    final Data? data;

    LoginModel({
        this.status,
        this.message,
        this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final User? user;
    final String? jwtToken;

    Data({
        this.user,
        this.jwtToken,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        jwtToken: json["jwt_token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "jwt_token": jwtToken,
    };
}

class User {
    final int? id;
    final String? role;
    final String? name;
    final String? phone;
    final String? email;
    final String? password;
    final dynamic companyName;
    final dynamic companyPhone;
    final dynamic companyEmail;

    User({
        this.id,
        this.role,
        this.name,
        this.phone,
        this.email,
        this.password,
        this.companyName,
        this.companyPhone,
        this.companyEmail,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        companyName: json["company_name"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "company_name": companyName,
        "company_phone": companyPhone,
        "company_email": companyEmail,
    };
}

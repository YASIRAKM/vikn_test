import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {

  Data data;
  CustomerData customerData;

  UserModel({
   
    required this.data,
    required this.customerData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
       
        data: Data.fromJson(json["data"]),
        customerData: CustomerData.fromJson(json["customer_data"]),
      );
}

class CustomerData {
  DateTime dateOfBirth;
  String country;
  int phone;
  String state;
  dynamic city;
  String address;
  String photo;
  String countryName;
  String stateName;

  CustomerData({
    required this.dateOfBirth,
    required this.country,
    required this.phone,
    required this.state,
    required this.city,
    required this.address,
    required this.photo,
    required this.countryName,
    required this.stateName,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        country: json["Country"],
        phone: json["Phone"],
        state: json["State"],
        city: json["City"],
        address: json["Address"],
        photo: json["photo"],
        countryName: json["CountryName"],
        stateName: json["StateName"],
      );

  Map<String, dynamic> toJson() => {
        "DateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "Country": country,
        "Phone": phone,
        "State": state,
        "City": city,
        "Address": address,
        "photo": photo,
        "CountryName": countryName,
        "StateName": stateName,
      };
}

class Data {
  String firstName;
  String lastName;
  String username;
  String email;

  Data({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
      );
}

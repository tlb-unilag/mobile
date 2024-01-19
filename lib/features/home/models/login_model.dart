// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? token;
  User? user;

  LoginModel({
    this.token,
    this.user,
  });

  LoginModel copyWith({
    String? token,
    User? user,
  }) =>
      LoginModel(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  List<dynamic>? fcmTokens;
  bool? isEmailVerified;
  List<dynamic>? referrals;
  List<dynamic>? vouchers;
  int? ordersCancelled;
  int? ordersDelivered;
  bool? googleAccount;
  bool? appleAccount;
  int? walletBalance;
  String? surname;
  String? firstname;
  String? gender;
  String? phonenumber;
  String? email;
  String? image;
  String? referralCode;
  List<AddressElement>? addresses;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? isPhonenumberVerified;
  int? referralCount;
  int? withdrawableBalance;
  List<dynamic>? following;
  int? followersCount;
  String? whatsapp;
  DateTime? lastLoginAt;
  PurpleAddress? address;
  int? initialWalletBalance;
  int? initialWithdrawableBalance;
  Kuda? kuda;
  BankAccount? bankAccount;
  String? username;
  UAgent? uAgent;

  User({
    this.id,
    this.fcmTokens,
    this.isEmailVerified,
    this.referrals,
    this.vouchers,
    this.ordersCancelled,
    this.ordersDelivered,
    this.googleAccount,
    this.appleAccount,
    this.walletBalance,
    this.surname,
    this.firstname,
    this.gender,
    this.phonenumber,
    this.email,
    this.image,
    this.referralCode,
    this.addresses,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isPhonenumberVerified,
    this.referralCount,
    this.withdrawableBalance,
    this.following,
    this.followersCount,
    this.whatsapp,
    this.lastLoginAt,
    this.address,
    this.initialWalletBalance,
    this.initialWithdrawableBalance,
    this.kuda,
    this.bankAccount,
    this.username,
    this.uAgent,
  });

  User copyWith({
    String? id,
    List<dynamic>? fcmTokens,
    bool? isEmailVerified,
    List<dynamic>? referrals,
    List<dynamic>? vouchers,
    int? ordersCancelled,
    int? ordersDelivered,
    bool? googleAccount,
    bool? appleAccount,
    int? walletBalance,
    String? surname,
    String? firstname,
    String? gender,
    String? phonenumber,
    String? email,
    String? image,
    String? referralCode,
    List<AddressElement>? addresses,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    bool? isPhonenumberVerified,
    int? referralCount,
    int? withdrawableBalance,
    List<dynamic>? following,
    int? followersCount,
    String? whatsapp,
    DateTime? lastLoginAt,
    PurpleAddress? address,
    int? initialWalletBalance,
    int? initialWithdrawableBalance,
    Kuda? kuda,
    BankAccount? bankAccount,
    String? username,
    UAgent? uAgent,
  }) =>
      User(
        id: id ?? this.id,
        fcmTokens: fcmTokens ?? this.fcmTokens,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        referrals: referrals ?? this.referrals,
        vouchers: vouchers ?? this.vouchers,
        ordersCancelled: ordersCancelled ?? this.ordersCancelled,
        ordersDelivered: ordersDelivered ?? this.ordersDelivered,
        googleAccount: googleAccount ?? this.googleAccount,
        appleAccount: appleAccount ?? this.appleAccount,
        walletBalance: walletBalance ?? this.walletBalance,
        surname: surname ?? this.surname,
        firstname: firstname ?? this.firstname,
        gender: gender ?? this.gender,
        phonenumber: phonenumber ?? this.phonenumber,
        email: email ?? this.email,
        image: image ?? this.image,
        referralCode: referralCode ?? this.referralCode,
        addresses: addresses ?? this.addresses,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        isPhonenumberVerified:
            isPhonenumberVerified ?? this.isPhonenumberVerified,
        referralCount: referralCount ?? this.referralCount,
        withdrawableBalance: withdrawableBalance ?? this.withdrawableBalance,
        following: following ?? this.following,
        followersCount: followersCount ?? this.followersCount,
        whatsapp: whatsapp ?? this.whatsapp,
        lastLoginAt: lastLoginAt ?? this.lastLoginAt,
        address: address ?? this.address,
        initialWalletBalance: initialWalletBalance ?? this.initialWalletBalance,
        initialWithdrawableBalance:
            initialWithdrawableBalance ?? this.initialWithdrawableBalance,
        kuda: kuda ?? this.kuda,
        bankAccount: bankAccount ?? this.bankAccount,
        username: username ?? this.username,
        uAgent: uAgent ?? this.uAgent,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fcmTokens: json["fcmTokens"] == null
            ? []
            : List<dynamic>.from(json["fcmTokens"]!.map((x) => x)),
        isEmailVerified: json["isEmailVerified"],
        referrals: json["referrals"] == null
            ? []
            : List<dynamic>.from(json["referrals"]!.map((x) => x)),
        vouchers: json["vouchers"] == null
            ? []
            : List<dynamic>.from(json["vouchers"]!.map((x) => x)),
        ordersCancelled: json["ordersCancelled"],
        ordersDelivered: json["ordersDelivered"],
        googleAccount: json["googleAccount"],
        appleAccount: json["appleAccount"],
        walletBalance: json["walletBalance"],
        surname: json["surname"],
        firstname: json["firstname"],
        gender: json["gender"],
        phonenumber: json["phonenumber"],
        email: json["email"],
        image: json["image"],
        referralCode: json["referralCode"],
        addresses: json["addresses"] == null
            ? []
            : List<AddressElement>.from(
                json["addresses"]!.map((x) => AddressElement.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        isPhonenumberVerified: json["isPhonenumberVerified"],
        referralCount: json["referralCount"],
        withdrawableBalance: json["withdrawableBalance"],
        following: json["following"] == null
            ? []
            : List<dynamic>.from(json["following"]!.map((x) => x)),
        followersCount: json["followersCount"],
        whatsapp: json["whatsapp"],
        lastLoginAt: json["lastLoginAt"] == null
            ? null
            : DateTime.parse(json["lastLoginAt"]),
        address: json["address"] == null
            ? null
            : PurpleAddress.fromJson(json["address"]),
        initialWalletBalance: json["initialWalletBalance"],
        initialWithdrawableBalance: json["initialWithdrawableBalance"],
        kuda: json["kuda"] == null ? null : Kuda.fromJson(json["kuda"]),
        bankAccount: json["bankAccount"] == null
            ? null
            : BankAccount.fromJson(json["bankAccount"]),
        username: json["username"],
        uAgent: json["uAgent"] == null ? null : UAgent.fromJson(json["uAgent"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fcmTokens": fcmTokens == null
            ? []
            : List<dynamic>.from(fcmTokens!.map((x) => x)),
        "isEmailVerified": isEmailVerified,
        "referrals": referrals == null
            ? []
            : List<dynamic>.from(referrals!.map((x) => x)),
        "vouchers":
            vouchers == null ? [] : List<dynamic>.from(vouchers!.map((x) => x)),
        "ordersCancelled": ordersCancelled,
        "ordersDelivered": ordersDelivered,
        "googleAccount": googleAccount,
        "appleAccount": appleAccount,
        "walletBalance": walletBalance,
        "surname": surname,
        "firstname": firstname,
        "gender": gender,
        "phonenumber": phonenumber,
        "email": email,
        "image": image,
        "referralCode": referralCode,
        "addresses": addresses == null
            ? []
            : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "isPhonenumberVerified": isPhonenumberVerified,
        "referralCount": referralCount,
        "withdrawableBalance": withdrawableBalance,
        "following": following == null
            ? []
            : List<dynamic>.from(following!.map((x) => x)),
        "followersCount": followersCount,
        "whatsapp": whatsapp,
        "lastLoginAt": lastLoginAt?.toIso8601String(),
        "address": address?.toJson(),
        "initialWalletBalance": initialWalletBalance,
        "initialWithdrawableBalance": initialWithdrawableBalance,
        "kuda": kuda?.toJson(),
        "bankAccount": bankAccount?.toJson(),
        "username": username,
        "uAgent": uAgent?.toJson(),
      };
}

class PurpleAddress {
  String? id;
  City? city;
  City? state;
  String? address;
  String? directions;
  String? label;

  PurpleAddress({
    this.id,
    this.city,
    this.state,
    this.address,
    this.directions,
    this.label,
  });

  PurpleAddress copyWith({
    String? id,
    City? city,
    City? state,
    String? address,
    String? directions,
    String? label,
  }) =>
      PurpleAddress(
        id: id ?? this.id,
        city: city ?? this.city,
        state: state ?? this.state,
        address: address ?? this.address,
        directions: directions ?? this.directions,
        label: label ?? this.label,
      );

  factory PurpleAddress.fromJson(Map<String, dynamic> json) => PurpleAddress(
        id: json["_id"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        state: json["state"] == null ? null : City.fromJson(json["state"]),
        address: json["address"],
        directions: json["directions"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "city": city?.toJson(),
        "state": state?.toJson(),
        "address": address,
        "directions": directions,
        "label": label,
      };
}

class City {
  String? id;
  String? name;

  City({
    this.id,
    this.name,
  });

  City copyWith({
    String? id,
    String? name,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class AddressElement {
  Location? location;
  String? type;
  String? address;
  String? directions;
  bool? isDefault;
  String? id;

  AddressElement({
    this.location,
    this.type,
    this.address,
    this.directions,
    this.isDefault,
    this.id,
  });

  AddressElement copyWith({
    Location? location,
    String? type,
    String? address,
    String? directions,
    bool? isDefault,
    String? id,
  }) =>
      AddressElement(
        location: location ?? this.location,
        type: type ?? this.type,
        address: address ?? this.address,
        directions: directions ?? this.directions,
        isDefault: isDefault ?? this.isDefault,
        id: id ?? this.id,
      );

  factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        type: json["type"],
        address: json["address"],
        directions: json["directions"],
        isDefault: json["isDefault"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "type": type,
        "address": address,
        "directions": directions,
        "isDefault": isDefault,
        "_id": id,
      };
}

class Location {
  List<double>? coordinates;
  String? type;

  Location({
    this.coordinates,
    this.type,
  });

  Location copyWith({
    List<double>? coordinates,
    String? type,
  }) =>
      Location(
        coordinates: coordinates ?? this.coordinates,
        type: type ?? this.type,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
        "type": type,
      };
}

class BankAccount {
  String? bankCode;
  String? accountName;
  String? accountNo;

  BankAccount({
    this.bankCode,
    this.accountName,
    this.accountNo,
  });

  BankAccount copyWith({
    String? bankCode,
    String? accountName,
    String? accountNo,
  }) =>
      BankAccount(
        bankCode: bankCode ?? this.bankCode,
        accountName: accountName ?? this.accountName,
        accountNo: accountNo ?? this.accountNo,
      );

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
        bankCode: json["bankCode"],
        accountName: json["accountName"],
        accountNo: json["accountNo"],
      );

  Map<String, dynamic> toJson() => {
        "bankCode": bankCode,
        "accountName": accountName,
        "accountNo": accountNo,
      };
}

class Kuda {
  String? accountNo;
  String? trackingRef;
  String? accountName;

  Kuda({
    this.accountNo,
    this.trackingRef,
    this.accountName,
  });

  Kuda copyWith({
    String? accountNo,
    String? trackingRef,
    String? accountName,
  }) =>
      Kuda(
        accountNo: accountNo ?? this.accountNo,
        trackingRef: trackingRef ?? this.trackingRef,
        accountName: accountName ?? this.accountName,
      );

  factory Kuda.fromJson(Map<String, dynamic> json) => Kuda(
        accountNo: json["accountNo"],
        trackingRef: json["trackingRef"],
        accountName: json["accountName"],
      );

  Map<String, dynamic> toJson() => {
        "accountNo": accountNo,
        "trackingRef": trackingRef,
        "accountName": accountName,
      };
}

class UAgent {
  DateTime? activatedAt;

  UAgent({
    this.activatedAt,
  });

  UAgent copyWith({
    DateTime? activatedAt,
  }) =>
      UAgent(
        activatedAt: activatedAt ?? this.activatedAt,
      );

  factory UAgent.fromJson(Map<String, dynamic> json) => UAgent(
        activatedAt: json["activatedAt"] == null
            ? null
            : DateTime.parse(json["activatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "activatedAt": activatedAt?.toIso8601String(),
      };
}

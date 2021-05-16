import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {

    int vOrden;

    UserData({
        this.vOrden,
    });


    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        vOrden  : json["orden"]
    );

    Map<String, dynamic> toJson() => {
        "vOrden"  : vOrden
    };
}

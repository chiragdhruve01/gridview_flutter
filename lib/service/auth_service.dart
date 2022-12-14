import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:item/utils/constants.dart' as constants;

class Album {
  final String firstName;
  final String lastName;
  final String email;
  final String image;

  const Album({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: json['image'] ?? "",
    );
  }
}

class AuthService {
  // var baseUrl = "http://172.31.199.45:8000/";
  // var avdbaseUrl = "http://10.0.2.2:8000/";
  var liveUrl = "";

  Future<Response> login(String username, String password) async {
    var res = await post(Uri.parse('${constants.url}user/userlogin'),
        body: {"email": username, "password": password});
    return res;
  }

  Future<Album> getLoggedInUser(String token) async {
    try {
      if (token != "") {
        var res = await get(Uri.parse('${constants.url}accTokengwm/$token'));
        if (res.statusCode == 200) {
          return Album.fromJson(jsonDecode(res.body));
        } else {
          return Future.error("server error");
        }
      } else {
        return Future.error("no token");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getCountryList(String token) async {
    try {
      var res =
          await get(Uri.parse('${constants.url}${constants.companylist}'));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        return data['serializer'];
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getCountryDetails(String token) async {
    try {
      var res = await get(
          Uri.parse('${constants.url}${constants.companyDetail}$token'));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        return data['company'];
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getTravelList() async {
    try {
      var response =
          await get(Uri.parse('${constants.url}${constants.travellist}'));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data['serializer'];
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future register(data) async {
    var res = await post(Uri.parse('${constants.url}gwmsignup'), body: data);
    return res;
  }
}

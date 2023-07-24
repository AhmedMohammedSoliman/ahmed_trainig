class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  String? statusCode ;
  String? message ;

  LoginResponseModel({this.accessToken, this.refreshToken});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    statusCode = json["statusCode"] ;
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
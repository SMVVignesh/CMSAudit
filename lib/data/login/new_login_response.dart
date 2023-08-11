class NewLoginResponse {
  String? tokenType;
  int? expiresIn;
  String? accessToken;
  String? scope;
  String? idToken;

  NewLoginResponse(
      {this.tokenType,
        this.expiresIn,
        this.accessToken,
        this.scope,
        this.idToken});

  NewLoginResponse.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    scope = json['scope'];
    idToken = json['id_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['access_token'] = this.accessToken;
    data['scope'] = this.scope;
    data['id_token'] = this.idToken;
    return data;
  }
}
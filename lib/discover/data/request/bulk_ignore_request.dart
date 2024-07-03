class BulkIgnoreRequest {
  List<String>? ignoreUsersList;

  BulkIgnoreRequest({this.ignoreUsersList});

  BulkIgnoreRequest.fromJson(Map<String, dynamic> json) {
    ignoreUsersList = json['ignoreUsersList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ignoreUsersList'] = this.ignoreUsersList;
    return data;
  }
}

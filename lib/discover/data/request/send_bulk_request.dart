class SendBulkRequest {
  List<FriendListRequest>? friendList;

  SendBulkRequest({this.friendList});

  SendBulkRequest.fromJson(Map<String, dynamic> json) {
    if (json['friendList'] != null) {
      friendList = <FriendListRequest>[];
      json['friendList'].forEach((v) {
        friendList!.add(new FriendListRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.friendList != null) {
      data['friendList'] = this.friendList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FriendListRequest {
  String? recieverId;
  int? typeOfRequest;

  FriendListRequest({this.recieverId, this.typeOfRequest});

  FriendListRequest.fromJson(Map<String, dynamic> json) {
    recieverId = json['recieverId'];
    typeOfRequest = json['typeOfRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recieverId'] = this.recieverId;
    data['typeOfRequest'] = this.typeOfRequest;
    return data;
  }
}

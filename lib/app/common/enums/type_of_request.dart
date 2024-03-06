enum TypeOfRequest { friendRequest, superLike }

extension TypeOfRequestExtension on TypeOfRequest {
  int get value {
    switch (this) {
      case TypeOfRequest.friendRequest:
        return 1;
      case TypeOfRequest.superLike:
        return 2;
    }
  }
}

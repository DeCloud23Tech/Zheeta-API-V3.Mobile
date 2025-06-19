class PaginationParam {
  final int pageNo;
  final int pageSize;
  final String? userId;

  PaginationParam({
    required this.pageNo,
    required this.pageSize,
    this.userId,
  });

  PaginationParam copyWith({
    int? page,
    int? pageSize,
    String? userId,
  }) {
    return PaginationParam(
      pageNo: page ?? pageNo,
      pageSize: pageSize ?? this.pageSize,
      userId: userId ?? this.userId,
    );
  }
}


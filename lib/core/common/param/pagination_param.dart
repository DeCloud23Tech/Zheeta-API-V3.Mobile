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
    int? pageNo,
    int? pageSize,
    String? userId,
  }) {
    return PaginationParam(
      pageNo: pageNo ?? this.pageNo,
      pageSize: pageSize ?? this.pageSize,
      userId: userId ?? this.userId,
    );
  }
}

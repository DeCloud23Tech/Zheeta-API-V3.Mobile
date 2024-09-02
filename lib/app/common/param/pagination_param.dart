class PaginationParam {
  int pageNo;
  int pageSize;

  PaginationParam({required this.pageNo, required this.pageSize});

  PaginationParam copyWith({int? page, int? pageSize}) {
    return PaginationParam(
      pageNo: page ?? this.pageNo,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}

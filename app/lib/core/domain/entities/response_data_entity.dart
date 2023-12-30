class ResponseDataEntity<T> {
  bool success;
  String? error;
  T? data;

  ResponseDataEntity({required this.success, this.error, this.data});
}

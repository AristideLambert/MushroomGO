class FirestorePagination<T>{
  final int limit;
  List<T> result;
  List<Map<String, List<String>?>>? lastResult;
  List<Map<String, List<DateTime>?>>? lastResultDateTime;

  FirestorePagination({required this.limit ,required this.result, this.lastResult, this.lastResultDateTime});
}
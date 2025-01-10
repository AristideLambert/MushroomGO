class FirestorePagination<T>{
  final int limit;
  List<T> result;
  final List<Map<String, List<String>?>> lastResult;

  FirestorePagination({required this.limit ,required this.result, required this.lastResult});
}
import 'package:shared_preferences/shared_preferences.dart';

class SearchUtils {
  SearchUtils._();

  static const _key = 'search_history';

  static Future<void> saveHistory(List<String> history) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, history);
  }

  static Future<bool> hasHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_key);
  }

  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> addToHistory(String item) async {
    final history = await getHistory();
    if (history.contains(item)) {
      await removeHistory(item);
    }
    history.add(item);
    await saveHistory(history);
  }

  static Future<void> removeHistory(String item) async {
    final history = await getHistory();
    history.remove(item);
    await saveHistory(history);
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
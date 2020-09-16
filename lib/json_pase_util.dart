library json_pase_util;

class JsonParseUtil {
  static String parseStr(dynamic value, {bool filterNull = true}) {
    if (value == null) {
      return '';
    }
    if (value == 'null' && filterNull) {
      return '';
    }
    return '$value';
  }

  static int parseInt(dynamic value, {int defaultValue}) {
    if (value == null) {
      return defaultValue;
    }
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      if (value.isEmpty) {
        return defaultValue;
      }
      try {
        return int.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  static double parseDouble(dynamic value, {double defaultValue}) {
    if (value == null) {
      return defaultValue;
    }
    if (value is double) {
      return value;
    }
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      if (value.isEmpty) {
        return defaultValue;
      }
      try {
        return double.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  static bool parseBool(dynamic value, {bool defaultValue}) {
    if (value == null) {
      return defaultValue ?? false;
    }
    if (value is bool) {
      return value;
    }

    if (value is num) {
      return value != 0;
    }
    if (value is String) {
      return value.toLowerCase() == "true" || value != "0";
    }
    return false;
  }

  static List<T> parseList<T>(dynamic value, T Function(dynamic) itemHandler) {
    if (value == null || value is! List) {
      return [];
    }

    List<T> result = [];
    try {
      result = (value as List).map((e) => itemHandler(e)).toList();
    } catch (_) {}
    return result;
  }

  static T parseObject<T>(dynamic value, T Function(dynamic) itemHandler) {
    if (value == null || value is! Map) {
      return null;
    }

    T result;
    try {
      result = itemHandler(value);
    } catch (_) {}
    return result;
  }
}

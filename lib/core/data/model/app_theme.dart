enum AppTheme { light, dark, system }

class AppThemes {
  static AppTheme fromValue(String value) {
    if (value == "light") {
      return AppTheme.light;
    } else if (value == "dark") {
      return AppTheme.dark;
    } else {
      return AppTheme.system;
    }
  }

  static String toValue(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return "light";
      case AppTheme.dark:
        return "dark";
      case AppTheme.system:
      default:
        return "system";
    }
  }
}

import '../localizations/language_keys.dart';

class English {
  static Map<String, String> getStrings() {
    return {
      LanguageKey.appName: 'E-Commerce App',
      LanguageKey.noInternetConnection:
          'It seems you are not connected to the internet.',
      LanguageKey.oopsSomethingWentWrong: 'Oops! Something went wrong.',
      LanguageKey.products: 'Products',
      LanguageKey.reset: 'Reset',
      LanguageKey.apply: 'Apply',
      LanguageKey.searchHint: 'Search...',
      LanguageKey.priceRange: 'Price Range',
      LanguageKey.ratingRange: 'Rating Range',
      LanguageKey.noDataFound: 'No Data Found!',
      LanguageKey.runOnOfflineMode: 'Continue Offline Mode',
      LanguageKey.offlineModeTag: 'Offline',
    };
  }
}

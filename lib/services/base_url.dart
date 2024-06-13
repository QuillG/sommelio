class BaseUrl {
  //online
  static const String defaultbaseUrl = 'api.sommelio.fr';
  //localPhone
  //static const String defaultbaseUrl ='10.0.2.2:7282';
  //localComputer
  //static const String defaultbaseUrl = 'localhost:32768';

  static Uri loginUrl() {
    return Uri.https(defaultbaseUrl, '/User/Login');
  }

  static Uri registerUrl() {
    return Uri.https(defaultbaseUrl, '/User/AddUser');
  }

  static Uri getAllResumeEvents() {
    return Uri.https(defaultbaseUrl, '/Event/ResumeEvents');
  }

  static Uri getWineTypes() {
    return Uri.https(defaultbaseUrl, '/WineType');
  }

  static Uri getMainDelicacies() {
    return Uri.https(defaultbaseUrl, '/Delicacies/Principal');
  }

  static Uri getSubDelicacies(int mainId) {
    return Uri.https(defaultbaseUrl, '/Delicacies/ParentId/$mainId');
  }

  static Uri getWinesDelicacies(int mainId) {
    return Uri.https(defaultbaseUrl, 'Wine/Delicacy/$mainId');
  }

  static Uri getWinesByString(String search) {
    return Uri.https(defaultbaseUrl, 'Wine/Search/$search');
  }

  static Uri getAllWines() {
    return Uri.https(defaultbaseUrl, 'Wine');
  }

  static Uri AddWineToFavorite(int wineId, int userId) {
    return Uri.https(defaultbaseUrl, 'Wine/User/$userId/Favorite/$wineId');
  }

  static Uri getFavoriteWine(int userId) {
    return Uri.https(defaultbaseUrl, 'Wine/Favorite/$userId');
  }
}

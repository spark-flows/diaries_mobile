// coverage:ignore-file

/// Abstract classes that define functionality for data and device layers.
///
/// Will be ignored for test since all are static values and would not change.
abstract class DomainRepository {
  /// Get the string value for the [key].
  ///LoginResponsewhich [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value);

  /// Clear data from local storage for [key].
  void clearData(dynamic key);

  /// Delete box
  void deleteBox();

  /// Get stored value
  String getStringValue(String key);

  /// Get the boolean value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key);

  /// [key] : The key whose value is needed.
  Future<String> getSecuredValue(String key);

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved in secure storage.
  /// [value] : The value which needs to be saved.
  void saveValueSecurely(String key, String value);

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key);

  /// Remove all data from secure storage.
  void deleteAllSecuredValues();

  /// API to get the IP of the user
  Future<String> getIp();
}

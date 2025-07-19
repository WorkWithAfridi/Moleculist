/// A singleton service to manage feature flags in the application.
class FeatureFlaggerService {
  // Private constructor to enforce singleton pattern.
  FeatureFlaggerService._internal();

  // Static instance of the service.
  static final FeatureFlaggerService _instance = FeatureFlaggerService._internal();

  /// Factory constructor to return the singleton instance.
  factory FeatureFlaggerService() {
    return _instance;
  }

  /// Initializes the service by fetching the active feature flags.
  Future<void> initService() async {
    await getActiveFeatures();
  }

  /// List of active feature flags.
  List<String> activeFeatures = [];

  /// Fetches the active feature flags from the feature management system.
  Future<void> getActiveFeatures() async {
    // Simulating a delay (e.g., network request).
    await Future.delayed(const Duration(seconds: 1));

    // Initialize the list of features enabled by default.
    activeFeatures = [AppFeatures.compoundListFeature, AppFeatures.searchFeature, AppFeatures.loremFeature];

    // Check if specific features are enabled and add them to the active features list.
    // if (await Posthog().isFeatureEnabled(AppFeatures.eventFeature)) {
    //   activeFeatures.add(AppFeatures.eventFeature);
    // }
    // if (await Posthog().isFeatureEnabled(AppFeatures.projectFeature)) {
    //   activeFeatures.add(AppFeatures.projectFeature);
    // }

    // Add more feature checks as needed.
  }

  /// Checks whether a specific feature is enabled.
  ///
  /// [key]: The feature key to check.
  /// Returns `true` if the feature is enabled; otherwise, `false`.
  bool isFeatureEnabled(String key) {
    return activeFeatures.contains(key);
  }
}

/// A class to define and manage application feature keys.
///
/// This serves as a centralized location for defining feature flag keys
/// used throughout the application.
class AppFeatures {
  static const String compoundListFeature = 'elementListFeature';
  static const String searchFeature = 'searchFeature';
  static const String loremFeature = 'loremFeature';
}

import 'package:my_app/week5/Ex1/model/ride/ride_pref.dart';
import 'package:my_app/week5/Ex1/repository/ride_preferences_repository.dart';

import '../../dummy_data/dummy_data.dart';

class MockRidePreferencesRepository extends RidePreferencesRepository {
  final List<RidePreference> _pastPreferences = fakeRidePrefs;

  @override
  List<RidePreference> getPastPreferences() {
    return _pastPreferences;
  }

  @override
  void addPreference(RidePreference preference) {
    _pastPreferences.add(preference);
  }
}

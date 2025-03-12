// import 'package:my_app/week5/model/location/locations.dart';
// import 'package:my_app/week5/repository/ride_preferences_repository.dart';
// import 'package:my_app/week5/service/ride_prefs_service.dart';
// import 'package:my_app/week5/model/ride/ride_pref.dart';
// void main() {
//   final repository = ;

//   RidePrefService.initialize(repository);
//   final service = RidePrefService.instance;

//   final logger = ConsoleLogger();
//   service.addListener(logger);

//   Location locationDepartureTest1 =
//       Location(name: "Battambang", country: Country.cambodia);
//   Location locationArrivalTest1 =
//       Location(name: "SiemReap", country: Country.cambodia);

//   RidePreference newPreference = RidePreference(
//       departure: locationDepartureTest1,
//       departureDate: DateTime.now(),
//       arrival: locationArrivalTest1,
//       requestedSeats: 1);

//   service.setCurrentPreference(newPreference);
// }

// main.dart
// import 'package:my_app/week5/model/location/locations.dart';
// // import 'package:my_app/week5/repository/ride_preferences_repository.dart';
// import 'package:my_app/week5/service/ride_prefs_service.dart';
// import 'package:my_app/week5/model/ride/ride_pref.dart';
// import 'package:my_app/week5/repository/mock/mock_ride_preferences_repository.dart';

// void main() {
//   // Initialize the repository and service
//   final repository = MockRidePreferencesRepository();
//   RidePrefService.initialize(repository);
//   final service = RidePrefService.instance;

//   // Add the console logger as a listener
//   final logger = ConsoleLogger();
//   service.addListener(logger);

//   // Create test location data
//   Location locationDepartureTest1 = Location(name: "Battambang", country: Country.cambodia);
//   Location locationArrivalTest1 = Location(name: "SiemReap", country: Country.cambodia);

//   // Create a new RidePreference
//   RidePreference newPreference = RidePreference(
//     departure: locationDepartureTest1,
//     departureDate: DateTime.now(),
//     arrival: locationArrivalTest1,
//     requestedSeats: 1,
//   );

//   // Set the new preference, which should trigger the listener
//   service.setCurrentPreference(newPreference);
// }

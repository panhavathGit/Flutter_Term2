import 'package:my_app/week3/model/ride/ride.dart';
import 'package:my_app/week3/model/ride_pref/ride_pref.dart';
import 'package:my_app/week3/dummy_data/dummy_data.dart';
import 'package:my_app/week3/service/rides_service.dart';

void main() {
  print("Ride Search Test");

  ///  Ride preference (London to Paris)
  RidePref testPreference = RidePref(
    departure: fakeLocations[0], 
    departureDate: DateTime.now().add(Duration(days: 1)),
    arrival: fakeLocations[3], 
    requestedSeats: 2,
  );

  List<Ride> matchingRides = RidesService.getRidesFor(testPreference);

  /// Check for available rides
  if (matchingRides.isNotEmpty) {
    print("Available Rides:");

    /// Print the matching rides
    for (var ride in matchingRides) {
      print(ride);
    }
  } else {
    print("No rides");
  }
}
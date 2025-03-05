import 'package:my_app/week4/model/ride_pref/ride_pref.dart';
import 'package:my_app/week4/repository/mock/rides_repository.dart';
import 'package:my_app/week4/model/ride/ride.dart';
// import 'package:flutter/material.dart';
// import 'package:my_app/week4/repository/mock/mock_ride_repository.dart';
// import '../dummy_data/dummy_data.dart';

// //
// /   This service handles:
// /   - The list of available rides
// /
// class RidesService {
//   static List<Ride> availableRides = fakeRides;

//   ///
//   ///  Return the relevant rides, given the passenger preferences
//   ///
//   static List<Ride> getRidesFor(RidePreference preferences) {
//     // For now, just a test
//     return availableRides
//         .where((ride) =>
//             ride.departureLocation == preferences.departure &&
//             ride.arrivalLocation == preferences.arrival)
//         .toList();
//   }
// }
class RidesService {
  static RidesService? _instance;

  final RidesRepository ridesRepository;

  RidesService._internal(this.ridesRepository);

  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    }
  }

  static RidesService get instance {
    if (_instance == null) {
      throw Exception(
          "You should initialize your service first. Please call the initialize");
    }
    return _instance!;
  }

  List<Ride> getRidesFor(RidePreference preference, RidesFilter? filter) {
    List<Ride> availableRides = ridesRepository.getRides(preference, filter);

    return availableRides.where((ride) {
      bool matchesPreference = ride.departureLocation == preference.departure &&
          ride.arrivalLocation == preference.arrival &&
          ride.availableSeats >= preference.requestedSeats;

      if (filter != null) {
        //if we use this it can give 2 options null and true.
        //which mean null still allow pet and true still allow pet
        if (filter.acceptPets == true && ride.acceptPet != true) {
          return false;
        }
      }
      return matchesPreference;
    }).toList();
  }
}

class RidesFilter {
  bool? acceptPets;

  RidesFilter(this.acceptPets);
}

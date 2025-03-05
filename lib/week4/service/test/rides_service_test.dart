import 'package:my_app/week4/repository/mock/mock_ride_repository.dart';
import 'package:my_app/week4/service/rides_service.dart';
import 'package:my_app/week4/model/ride/ride.dart';
import 'package:my_app/week4/model/ride_pref/ride_pref.dart';
import 'package:my_app/week4/model/ride/locations.dart';
// import 'package:flutter/material.dart';

void main() {
  // Step 1: Initialize the singleton with a repository
  RidesService.initialize(MockRideRepository());

  // Step 2: Get the instance and fetch rides
  Location locationDepartureTest1 =
      Location(name: "Battambang", country: Country.cambodia);
  Location locationArrivalTest1 =
      Location(name: "SiemReap", country: Country.cambodia);

  RidePreference preference = RidePreference(
      departure: locationDepartureTest1,
      departureDate: DateTime.now(),
      arrival: locationArrivalTest1,
      requestedSeats: 1);
//   RidesFilter? filter = RidesFilter(true);

  List<Ride> rides = RidesService.instance.getRidesFor(preference, null);

  print("Available rides: ${rides.length}");
}

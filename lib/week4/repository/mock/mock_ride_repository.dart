import 'package:my_app/week4/model/ride/ride.dart';
import 'package:my_app/week4/repository/mock/rides_repository.dart';
import 'package:my_app/week4/model/ride/locations.dart';
import 'package:my_app/week4/model/user/user.dart';
import 'package:my_app/week4/model/ride_pref/ride_pref.dart';
import 'package:my_app/week4/service/rides_service.dart';

class MockRideRepository extends RidesRepository {
  final List<Ride> mockRides = [  
    Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "SiemReap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
        driver: User(firstName: "Kannika"),
        availableSeats: 2,
        pricePerSeat: 17.0,
        acceptPet: false),
    Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "SiemReap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
        driver: User(firstName: "Chhaylim"),
        availableSeats: 0,
        pricePerSeat: 17.0,
        acceptPet: false),
    Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "SiemReap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
        driver: User(firstName: "Mengtech"),
        availableSeats: 1,
        pricePerSeat: 17.0,
        acceptPet: false),
    Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "SiemReap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
        driver: User(firstName: "Limhao"),
        availableSeats: 2,
        pricePerSeat: 17.0,
        acceptPet: true),
    Ride(
        departureLocation:
            Location(name: "Battambang", country: Country.cambodia),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "SiemReap", country: Country.cambodia),
        arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
        driver: User(firstName: "Sovanda"),
        availableSeats: 1,
        pricePerSeat: 17.0,
        acceptPet: false),
  ];

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    // Filtering rides based on the provided preference
    return mockRides.where((ride) {
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

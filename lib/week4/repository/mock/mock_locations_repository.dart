import 'package:my_app/week4/model/ride/locations.dart';
import 'package:my_app/week4/repository/mock/locations_repository.dart';

class MockLocationsRepository extends LocationsRepository {
  final List<Location> myFakeLocations = [
    Location(name: "Phnom Penh", country: Country.cambodia),
    Location(name: "Siem Reap", country: Country.cambodia),
    Location(name: "Battambang", country: Country.cambodia),
    Location(name: "Sihanoukville", country: Country.cambodia),
    Location(name: "Kampot", country: Country.cambodia),
  ];

  @override
  List<Location> getLocations() {
    return myFakeLocations;
  }
}

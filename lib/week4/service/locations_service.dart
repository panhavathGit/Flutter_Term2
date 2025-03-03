import 'package:my_app/week4/model/ride/locations.dart';
import 'package:my_app/week4/repository/mock/mock_locations_repository.dart';
import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  // static const List<Location> availableLocations = fakeLocations;
  static final List<Location> availableLocations = MockLocationsRepository().getLocations();
}

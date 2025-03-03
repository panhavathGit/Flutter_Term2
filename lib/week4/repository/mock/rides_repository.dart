import 'package:my_app/week4/model/ride/ride.dart';
import 'package:my_app/week4/model/ride_pref/ride_pref.dart';
import 'package:my_app/week4/service/rides_service.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePreference preference, RidesFilter? filter);
}

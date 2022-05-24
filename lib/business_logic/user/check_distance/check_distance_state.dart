part of 'check_distance_cubit.dart';

@immutable
abstract class CheckDistanceState {}

class CheckDistanceInitial extends CheckDistanceState {}

class CheckDistanceSuccessState extends CheckDistanceState {
 final ApiAddress apiAddress;
  CheckDistanceSuccessState(this.apiAddress);


}
class CheckDistanceErrorState extends CheckDistanceState  {
  final String message;
  CheckDistanceErrorState(this.message);
}
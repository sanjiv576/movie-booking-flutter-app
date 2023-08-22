import 'package:equatable/equatable.dart';

class SeatEntity extends Equatable {
  final String seat;
  const SeatEntity(this.seat);

  factory SeatEntity.fromJson(Map<String, dynamic> json) {
    return SeatEntity(
      json['seat'] as String,
    );
  }

  @override
  List<Object?> get props => [seat];

  @override
  String toString() {
    return seat;
  }
}

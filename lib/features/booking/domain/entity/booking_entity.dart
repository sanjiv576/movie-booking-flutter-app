import 'package:equatable/equatable.dart';
import 'package:movie_ticket_booking/features/booking/domain/entity/seat.dart';

class BookingEntity extends Equatable {
  final String? id;
  final String userName;
  final String movieName;
  final String? userId;
  final String? movieId;
  final String time;
  final String date;
  final List<dynamic> seatNumber;
  // final List<SeatEntity> seatNumber;
  final String charge;

  const BookingEntity({
    this.id,
    required this.userName,
    required this.movieName,
    this.userId,
    this.movieId,
    required this.time,
    required this.date,
    required this.seatNumber,
    required this.charge,
  });

  // convert object to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'movieName': movieName,
        'userId': userId,
        'movieId': movieId,
        'time': time,
        'date': date,
        'seatNumber': seatNumber,
        'charge': charge,
      };

  // convert json to object
  factory BookingEntity.fromJson(Map<String, dynamic> json) {
    //  final List<dynamic> jsonFavorites = json['seat'];
    // final List<SeatEntity> seats = jsonFavorites
    //     .map<SeatEntity>((json) => SeatEntity.fromJson(json))
    //     .toList();

    return BookingEntity(
      id: json['id'] as String,
      userName: json['userName'] as String,
      movieName: json['movieName'] as String,
      userId: json['userId'] as String,
      movieId: json['movieId'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
      seatNumber: json['seatNumber'] as List<dynamic>,
      charge: json['charge'] as String,
    );
  }

  @override
  String toString() {
    return 'Movie id : $id, userName: $userName, movieName: $movieName, userId: $userId, movieId: $movieId, time: $time, date: $date, seatNumber: $seatNumber, charge: $charge)';
  }

  @override
  List<Object?> get props => [
        id,
        userName,
        movieName,
        userId,
        movieId,
        time,
        date,
        seatNumber,
        charge
      ];
}

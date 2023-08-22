// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:json_annotation/json_annotation.dart';

// import '../../domain/entity/booking_entity.dart';
// import '../../domain/entity/seat.dart';

// part 'booking_api_model.g.dart';

// final bookingApiModelProvider = Provider((ref) => BookingApiModel.empty());

// @JsonSerializable()
// class BookingApiModel {
//   @JsonKey(name: '_id')
//   final String? id;
//   final String userName;
//   final String movieName;
//   final String? userId;
//   final String? movieId;
//   final String time;
//   final String date;
//   final List<SeatEntity> seatNumber;
//   final String charge;

//   BookingApiModel({
//     this.id,
//     required this.userName,
//     required this.movieName,
//     this.userId,
//     this.movieId,
//     required this.time,
//     required this.date,
//     required this.seatNumber,
//     required this.charge,
//   });

//   BookingApiModel.empty()
//       : this(
//           id: '',
//           userName: '',
//           movieName: '',
//           userId: '',
//           movieId: '',
//           time: '',
//           date: '',
//           seatNumber: [],
//           charge: '',
//         );

//   // convert json to object
//   // factory BookingApiModel.fromJson(Map<String, dynamic> json) =>
//   //     _$BookingApiModelFromJson(json);

//   // convert object to json
//   Map<String, dynamic> toJson() => _$BookingApiModelToJson(this);

//   // convert to entity
//   BookingEntity toEntity() => BookingEntity(
//         id: id,
//         userName: userName,
//         movieName: movieName,
//         userId: userId,
//         movieId: movieId,
//         time: time,
//         date: date,
//         seatNumber: seatNumber,
//         charge: charge,
//       );

//   // convert to list of enitities
//   List<BookingEntity> toEntityList(List<BookingApiModel> models) =>
//       models.map((model) => model.toEntity()).toList();
// }

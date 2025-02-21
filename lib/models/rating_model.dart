import 'package:equatable/equatable.dart';

class RatingModel extends Equatable {
  final num rate;
  final int count;

  const RatingModel(this.rate, this.count);

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      map['rate'] as num,
      map['count'] as int,
    );
  }

  @override
  List<Object?> get props => [rate, count];
}

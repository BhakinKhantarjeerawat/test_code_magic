import 'package:equatable/equatable.dart';

class CatFact extends Equatable {
  const CatFact({required this.fact, required this.length});
  final String fact;
  final int length;

  @override
  List<Object?> get props => [fact, length];

  @override
  bool get stringify => true;

  factory CatFact.fromJson(Map<String, dynamic> json) {
    // return CatFact(fact: json['fact'], length: json['length']);
        return CatFact(fact: json['fact'] ?? 'field "fact" is null', length: json['length']);
  }

}

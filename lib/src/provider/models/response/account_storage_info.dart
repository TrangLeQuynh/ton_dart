import 'package:ton_dart/src/serialization/serialization.dart';
import 'package:blockchain_utils/numbers/numbers.dart';

class AccountStorageInfoResponse with JsonSerialization {
  final BigInt usedCells;
  final BigInt usedBits;
  final BigInt usedPublicCells;
  final BigInt lastPaid;
  final BigInt duePayment;

  const AccountStorageInfoResponse({
    required this.usedCells,
    required this.usedBits,
    required this.usedPublicCells,
    required this.lastPaid,
    required this.duePayment,
  });

  factory AccountStorageInfoResponse.fromJson(Map<String, dynamic> json) {
    return AccountStorageInfoResponse(
      usedCells: BigintUtils.parse(json['used_cells']),
      usedBits: BigintUtils.parse(json['used_bits']),
      usedPublicCells: BigintUtils.parse(json['used_public_cells']),
      lastPaid: BigintUtils.parse(json['last_paid']),
      duePayment: BigintUtils.parse(json['due_payment']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'used_cells': usedCells.toString(),
      'used_bits': usedBits.toString(),
      'used_public_cells': usedPublicCells.toString(),
      'last_paid': lastPaid.toString(),
      'due_payment': duePayment.toString(),
    };
  }
}

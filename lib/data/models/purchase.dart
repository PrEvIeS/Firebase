import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

@freezed
class Purchase with _$Purchase {
  const factory Purchase({
    String? id,
    required String name,
    required bool purchased,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, Object?> json) =>
      _$PurchaseFromJson(json);
}

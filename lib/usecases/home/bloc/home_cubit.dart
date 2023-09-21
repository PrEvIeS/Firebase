import 'package:bloc/bloc.dart';
import 'package:flutter_template/data/models/purchase.dart';
import 'package:flutter_template/data/repositories/purchase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PurchaseRepository purchaseRepository;

  HomeCubit({required this.purchaseRepository})
      : super(const HomeState.initial());

  void markPurchased(String? id, bool marked) {
    try {
      emit(HomeState.marking());
      purchaseRepository.markPurchased(id, marked);
      emit(HomeState.success());
    } catch (e) {}
  }

  void addNewPurchase(Purchase purchase) {
    try {
      emit(HomeState.addition());
      purchaseRepository.addPurchase(purchase);
      emit(HomeState.success());
    } catch (e) {}
  }

  void reset() {
    emit(HomeState.initial());
  }
}

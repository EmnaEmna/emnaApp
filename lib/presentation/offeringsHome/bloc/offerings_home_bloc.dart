import 'package:bloc/bloc.dart';
import 'package:emnapp/presentation/offeringsHome/models/auction_bidding_model.dart';
import 'package:emnapp/presentation/offeringsHome/models/listfavorite_item_model.dart';
import 'package:emnapp/presentation/offeringsHome/models/listpngwing_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'offerings_home_event.dart';
part 'offerings_home_state.dart';

class OfferingsHomeBloc extends Bloc<OfferingsHomeEvent, OfferingsHomeState> {
  OfferingsHomeBloc(OfferingsHomeState initialState) : super(initialState) {
    // on<OfferingsHomeEvent>((event, emit) {
    //   // TODO: implement event handler
    // }
    on<OfferingsHomeEvent>(_onInitialize );
  }
   List<ListpngwingItemModel> fillListpngwingItemList() {
    return List.generate(4, (index) => ListpngwingItemModel());
  }

  List<ListfavoriteItemModel> fillListfavoriteItemList() {
    return List.generate(3, (index) => ListfavoriteItemModel());
  }

  _onInitialize(
    OfferingsHomeEvent event,
    Emitter<OfferingsHomeState> emit,
  ) async {
    emit(state.copyWith(
      inputFieldController: TextEditingController(),
    ));
    emit(state.copyWith(
        auctionBiddingModelObj: state.auctionBiddingModelObj?.copyWith(
      listpngwingItemList: fillListpngwingItemList(),
      listfavoriteItemList: fillListfavoriteItemList(),
    )));
  }
}



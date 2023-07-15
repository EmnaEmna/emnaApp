part of 'offerings_home_bloc.dart';

 class OfferingsHomeState extends Equatable {
   OfferingsHomeState({
    this.inputFieldController,
    this.auctionBiddingModelObj,
   });
  
    TextEditingController? inputFieldController;

  AuctionBiddingModel? auctionBiddingModelObj;

 @override
  List<Object?> get props => [
        inputFieldController,
        auctionBiddingModelObj,
      ];
  OfferingsHomeState copyWith({
    TextEditingController? inputFieldController,
    AuctionBiddingModel? auctionBiddingModelObj,
  }) {
    return OfferingsHomeState(
      inputFieldController: inputFieldController ?? this.inputFieldController,
      auctionBiddingModelObj:
          auctionBiddingModelObj ?? this.auctionBiddingModelObj,
    );
  }
}


//class OfferingsHomeInitial extends OfferingsHomeState {}

import 'package:equatable/equatable.dart';
import 'listpngwing_item_model.dart';
import 'listfavorite_item_model.dart';

// ignore: must_be_immutable
class AuctionBiddingModel extends Equatable {
  AuctionBiddingModel(
      {this.listpngwingItemList = const [],
      this.listfavoriteItemList = const []});

  List<ListpngwingItemModel> listpngwingItemList;

  List<ListfavoriteItemModel> listfavoriteItemList;

  AuctionBiddingModel copyWith(
      {List<ListpngwingItemModel>? listpngwingItemList,
      List<ListfavoriteItemModel>? listfavoriteItemList}) {
    return AuctionBiddingModel(
      listpngwingItemList: listpngwingItemList ?? this.listpngwingItemList,
      listfavoriteItemList: listfavoriteItemList ?? this.listfavoriteItemList,
    );
  }

  @override
  List<Object?> get props => [listpngwingItemList, listfavoriteItemList];
}

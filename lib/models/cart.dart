import 'package:hindi_course/core/store.dart';
import 'package:hindi_course/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{



 late  CatalogModel _catalog;
  //CatalogModel get catalog => _catalog;
  set  catalog(CatalogModel newCatalog) => _catalog =newCatalog;


//maintains ids of products in cart
  List<int> itemIds = [];
  

  //get items from cart ids
List<Item?> get items => itemIds.map((e) => _catalog.getbyid(e)).toList();

  num get totalPrice =>
    //0.0 as not 0 so that updated val is of type double
     items.fold(0.0, (total, current) { 
      if( current!=null)
      return (total + current.price);//this updates total which is of type double due to initial val 0.0
      else return 0;}
      );
     
    
  

  void add(Item item){
    itemIds.add(item.id);
  }

   void remove(Item? item){
    itemIds.remove(item?.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
      store?.cart.itemIds.add(item.id);

    
  }

}
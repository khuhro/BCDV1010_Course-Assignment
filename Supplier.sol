// SPDX-License-Identifier: MIT
pragma solidity ^0.4.17;


contract Supplier {

  /*
    declare Two event 
    1. Event ItemAdded sends one parameter, unsigned data in idItem
    2. Event ProcessAnOrder sends three parameters 
       data type uint for idOfCustomer,  uint idOrder, bool status

  */
  event ItemAdded(uint idItem);
  event ProcessAnOrder(uint idOfCustomer, uint idOrder, bool status);

  /*
    Declaration Struct Item Object
      Datattype uint of idItem
      Datatype string of itemName
      Datattype uint of price
  */
  struct Item {
    uint idItem;
    string itemName;
    uint price;
  }

  /*
    Declaration Struct Orderlog Object
      Datattype uint of idOfCustomer
      Datatype uint of idOrder
      Datattype bool of status
  */
  struct Orderlog {
    uint idOfCustomer;
    uint idOrder; 
    bool status;
  }


  /* 
    Declared the STATE variable numItemsForSale as uint data type
    Declared the STATE variable numOrdersProcessed as uint data type
    Mapping unsigned to Item and stored in items
    Mapping unsigned to Orderlog and stored in orderlogs
  */
  uint numItemsForSale;
  uint numOrdersProcessed;
  mapping (uint => Item) items;
  mapping (uint => Orderlog) orderLogs;


  /*
    Function addItem to add the item and visiabity is public
    Input Parameters of the function
      Name: _itemName and datatype: string
      Name: _price and datatype: uint

    idItem stored the ID of the item and than increased by one
    items stored the idItem, and idItem as uint, name as string, and price as uint
    send ItemAdded event
    
  */
  function addItem(string memory _itemName, uint _price) public {
    uint idItem = numItemsForSale++;
    items[idItem] = Item(idItem, _itemName, _price);
    emit ItemAdded(idItem);
  }


   /*
    Function processOrder to proces the oder and visiabity is public
    Input Parameters of the function
      Name: _idOrder and datatype: uint
      Name: _idCustomer and datatype: uint

    orderLogs stored the Order ID, and idCustomer as uint, idOrder as uint and status bool
    numOrdersProcessed increased by one
    send ProcessAnOrder event
  */
  function processOrder(uint _idOrder, uint _idCustomer) public {
    orderLogs[_idOrder] = Orderlog(_idCustomer, _idOrder, true);
    numOrdersProcessed++;
    emit ProcessAnOrder(_idCustomer, _idOrder, true);
  }


    /*
      Function getItem, get the Item and visiabity is public
      Input Parameters of the function
        Name: _idItem and datatype: uint

    Function Returns
      items name as string and items price in uint
  */
  function getItem(uint _idItem) view public returns (string memory, uint){
    return (items[_idItem].itemName, items[_idItem].price);
  }

    /*
      Function getTotalNumberOfItemsForSale, get the Total number of the sale, only reads and visiabity is public
      Input Parameters of the function
        Name: _idItem and datatype: uint

    Function Returns
      items name as string and items price in uint
      number of sale in uint
  */
  function getTotalNumberOfItemsForSale() view public returns (uint) {
    return numItemsForSale;
  }

    /*
      Function getTotalNumberOfOrdersProcessed, get the Total oderes processed, only reads and visiabity is public
      Input Parameters of the function
        Name: _idItem and datatype: uint

    Function Returns
      number of Orders Processed as uint
     
  */
  function getTotalNumberOfOrdersProcessed() view public returns (uint){
    return numOrdersProcessed;
  }


}
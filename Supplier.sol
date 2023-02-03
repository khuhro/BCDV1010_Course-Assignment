// SPDX-License-Identifier: MIT
pragma solidity ^0.4.17;


contract Supplier {


  // Comment...
  event ItemAdded(uint idItem);
  event ProcessAnOrder(uint idOfCustomer, uint idOrder, bool status);


  // Comment...
  struct Item {
    uint idItem;
    string itemName;
    uint price;
  }
  struct Orderlog {
    uint idOfCustomer;
    uint idOrder; 
    bool status;
  }


  // Comment...
  uint numItemsForSale;
  uint numOrdersProcessed;
  mapping (uint => Item) items;
  mapping (uint => Orderlog) orderLogs;



  // Comment...
  function addItem(string memory _itemName, uint _price) public {
    uint idItem = numItemsForSale++;
    items[idItem] = Item(idItem, _itemName, _price);
    emit ItemAdded(idItem);
  }


  // Comment...
  function processOrder(uint _idOrder, uint _idCustomer) public {
    orderLogs[_idOrder] = Orderlog(_idCustomer, _idOrder, true);
    numOrdersProcessed++;
    emit ProcessAnOrder(_idCustomer, _idOrder, true);
  }


  // Comment...
  function getItem(uint _idItem) view public returns (string memory, uint){
    return (items[_idItem].itemName, items[_idItem].price);
  }


  
  function getTotalNumberOfItemsForSale() view public returns (uint) {
    return numItemsForSale;
  }


  function getTotalNumberOfOrdersProcessed() view public returns (uint){
    return numOrdersProcessed;
  }


}
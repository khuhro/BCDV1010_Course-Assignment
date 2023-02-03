// SPDX-License-Identifier: MIT
pragma solidity ^0.4.17;


contract CustomerDB {


  // Comment...
  event OrderPurchased(uint idOrder);
 event OrderShipped(uint idOrder);


  // Comment...
  struct Customer {
    uint idCustomer;
    string customerName;
  }
  struct Order {
    uint idOrder;
    uint idCustomer;
    string itemName;
    uint quantity;
    bool shipped;
  }


  // Comment...
  uint idOrder = 0;
  mapping (uint => Customer) customers;
  mapping (uint => Order) orders;


  // Comment...
  constructor() public {
      
// Currently adding customers in the constructor.
      // ***
      // *** NOTE: As part of the assignment commenting all the code to show your understanding, 
      // *** you need to write a function to add Customers through the Remix interface instead of in the constructor, and delete the constructor.

      customers[0] = Customer(0, "John Smith");
      customers[1] = Customer(1, "Sarah Webster");
      customers[2] = Customer(2, "Dev Patel");
     
  }


  // Comment...
  function purchaseItem(uint _custId, string _itemName, uint _quantity) public {
    idOrder++;
    orders[idOrder] = Order(idOrder, _custId, _itemName, _quantity, false);
    emit OrderPurchased(idOrder);
  }


  // Comment...
  function shipItem(uint _idOrder) public {      
      orders[_idOrder].shipped = true;
      emit OrderShipped(_idOrder);
  }
  
  // Comment...
  function getOrderDetails(uint _idOrder) view public returns (uint, string, string, uint, bool){
    uint cust = orders[_idOrder].idCustomer;
    return (cust, customers[cust].customerName, orders[_idOrder].itemName, orders[_idOrder].quantity, orders[_idOrder].shipped);
  }


}

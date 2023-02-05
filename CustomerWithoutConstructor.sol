// SPDX-License-Identifier: MIT
pragma solidity ^0.4.17;


contract CustomerDB {


   /*
    declare Two event 
    1. Event OrderPurchased sends one parameter, uint data in idOrder
    2. Event OrderShipped sends one parameter, uint data in idOrder
  */
  event OrderPurchased(uint idOrder);
  event OrderShipped(uint idOrder);


    /*
    Declaration Struct Customer Object
      Data type uint of idCustomer
      Data type string of customerName
  */
  struct Customer {
    uint idCustomer;
    string customerName;
  }

  contract Customer {
  struct CustomerData {
    string name;
    string email;
    string password;
  }

  CustomerData[] public customers;

  function addCustomer(uint _idCustomer, string memory _customerName) public {
    customers.push(CustomerData( _idCustomer, _customerName));
  }
}

    /*
    Declaration Struct Order Object
      Data type uint of idOrder
      Data type uint of idCustomer
      Data ype string of itemName
      Data type uint of quantity
      Data type bool of shipped
  */
  struct Order {
    uint idOrder;
    uint idCustomer;
    string itemName;
    uint quantity;
    bool shipped;
  }


    /* 
    Declared the STATE variable idOrder as uint datat and, assign value as 0
    Mapping uint to Customer and stored in customers
    Mapping uint to Order and stored in orders
  */
  uint idOrder = 0;
  mapping (uint => Customer) customers;
  mapping (uint => Order) orders;

/*
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

*/

    /*
    Function purchaseItem to purchase the item and visiabity is public
      Three Input Parameters of the function
      Name: _custId and data type: uint
      Name: _itemName and data type: string
      Name: _quantity and data type: uint

    STATE variable idOrder increased by one
    orders stored the idOrder, and idOrder as uint,_custId as uint, name as string, and price as uint
    send OrderPurchased event
    
  */
  function purchaseItem(uint _custId, string _itemName, uint _quantity) public {
    idOrder++;
    orders[idOrder] = Order(idOrder, _custId, _itemName, _quantity, false);
    emit OrderPurchased(idOrder);
  }


    /*
    Function shipItem to the item shipped and visiabity is public
    Input Parameters of the function
      Name: _idOrder and datatype: uint

    orders stored the Order ID, and status bool as true
    send OrderShipped event
  */
  function shipItem(uint _idOrder) public {      
      orders[_idOrder].shipped = true;
      emit OrderShipped(_idOrder);
  }
  
     /*
      Function getOrderDetails, get the order ID, only reads and visiabity is public
      Input Parameters of the function
        Name: _idOrder and datatype: uint

    Declare local variable cust as uint data type assigned 

    Function Returns
      customer's ID as uint,
      custormer's Name as string,
      order's Name as string,
      order quantity as uint,
      order status as bool  
  */
  function getOrderDetails(uint _idOrder) view public returns (uint, string, string, uint, bool){
    uint cust = orders[_idOrder].idCustomer;
    return (cust, customers[cust].customerName, orders[_idOrder].itemName, orders[_idOrder].quantity, orders[_idOrder].shipped);
  }


}

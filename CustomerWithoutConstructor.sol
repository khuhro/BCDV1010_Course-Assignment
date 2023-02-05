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
    Replaced the constructor with addCustomerWithoutConstructor
    The Customer struct data store in customersList
    Function addCustomerWithoutConstructor to add custormer to array and visiabity is public
      Two Input Parameters of the function
      Name: _idCustomer and data type: uint
      Name: _customerName and data type: string

    The customer information added to customersList through push method
    */
  Customer[] public customersList;

  function addCustomerWithoutConstructor(uint _idCustomer, string memory _customerName) public {
    customersList.push(Customer(_idCustomer, _customerName));
  }

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

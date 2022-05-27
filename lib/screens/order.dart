import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pizza_store/repository/product_repo.dart';
import 'package:pizza_store/widgets/product_card.dart';

import '../models/product.dart';

class Order extends StatefulWidget {
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  ProductRepo product = ProductRepo.getInstance();
  // product.getProducts();
  List<Product> products = [];
  dynamic error;
  getProductsList(List<Product> product) {
    //this funtion is passed into songsService initialize function which will call this function when we get songs through API call & pass those songs into this function as argument to this file while calling this function
    this.products =
        product; //increase scope of songs list so that we can use it outside
    setState(() {}); //re-render so that they will be displayed
  }

  getError(dynamic error) {
    //this function is passed into songsService initialize function which will call this function on error with API call
    print("Error found in network call $error");
    setState(() {});
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _productList(Size deviceSize) {
    List<Widget> list = products.map((product) => card(product)).toList();
    return Container(
      height: deviceSize.height/1.4,
      child: SingleChildScrollView(
        child: Column(
          children: list,
        ),
      ),
    );
  }

  // List<Products> items = [];
  @override
  Widget build(BuildContext context) {
    int cartItems = 55; 
    Size deviceSize = MediaQuery.of(context).size;
    product.getProducts(getProductsList, getError);
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      body: Container(
        child: Column(
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text('Order Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18,color: Colors.indigo.shade700)),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.info_outline,color: Colors.indigo.shade700,),
                                SizedBox(width: 10),
                                Icon(Icons.menu,color: Colors.indigo.shade700,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Text("My Cart $cartItems",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18,color: Colors.indigo.shade700)),
                          ),
                          
                        ],
                      ),
                    ),

                    products.isEmpty ? _loading() : _productList(deviceSize)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pizza_store/Utils/stringHelper.dart';
import 'package:pizza_store/models/product.dart';

class card extends StatelessWidget {
  late Product product;
  card(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(height: 200, width: 200, child: Image.network(product.URL)),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    product.name,
                    style:
                        TextStyle(fontSize: 15, color: Colors.indigo.shade700),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        product.price.toString(),
                        style: TextStyle(
                            fontSize: 14, color: Colors.indigo.shade700),
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.add_box_outlined,color: Colors.indigo.shade700))
                  ],
                ),
                Container(
                  child: Text(
                    reduceString(product.desc),
                    style:
                        TextStyle(fontSize: 14, color: Colors.indigo.shade700),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

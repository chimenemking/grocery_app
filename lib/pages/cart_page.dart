

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),), 
      body: Consumer<CartModel>(
        builder: (context, value, child){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //List of cart items
               Padding(
          padding:const EdgeInsets.symmetric(horizontal:24.0),
          child: Text("My Cart",
          style: 
            GoogleFonts.notoSerif(
               fontSize: 36,
               fontWeight: FontWeight.bold,
            ),),
        ),
        Expanded(
          child: ListView.builder(
          itemCount: value.cartItems.length,
          padding: EdgeInsets.all(12),
          itemBuilder:(context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[300], 
              borderRadius:BorderRadius.circular(12)),
              child: ListTile(
                leading: Image.asset(value.cartItems[index][2],height: 36,),
                title: Text(value.cartItems[index][0]),
                subtitle: Text('\$'+ value.cartItems[index][1]),
                trailing: IconButton(
                  onPressed: () => Provider.of<CartModel>(context, listen: false).removeItemFromCart(index), 
                  icon: Icon(Icons.cancel)),
                ),
            ),
          );
        },
        ),
        ),
        //total + pay 
        Padding(
          padding: const EdgeInsets.all(36.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.green, 
            borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("total price",
                   style: TextStyle(color: Colors.green[100]),),
                   
                   const SizedBox(height:4),
                    Text(
                      "\$" + value.calculateTotal(),
                     style: const TextStyle(color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.bold)),
                ],
               ),
               //pay now button 
               Container( 
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.green.shade100),
                  borderRadius: BorderRadius.circular(12),),
                  padding: EdgeInsets.all(12),
                child: Row(
                  children: const [
                    Text(
                      "Pay now",
                       style: TextStyle( color: Colors.white),
                        ),
                        Icon(Icons.arrow_forward_ios,
                        size: 16,
                        color:Colors.white)
                  ],
                ),
               )
              ],
            ),
          ),
        )
      ],
      );
      },
      ),
    );
  }
}
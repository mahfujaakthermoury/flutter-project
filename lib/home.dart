import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/produt_View.dart';


import 'package:carousel_slider/carousel_slider.dart';

import 'controller.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller _controller = Get.put(Controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fatchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (_controller.isLoadingProduct.value) {
        return CircularProgressIndicator();
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true
                    ),
                    items: imgList
                        .map((item) => Container(
                      child: Center(
                          child:
                          Image.network(item, fit: BoxFit.cover, width: 800)),
                    ))
                        .toList(),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("Product List" ,style: TextStyle(fontSize: 30))),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:imgList.length,
                  itemBuilder: (BuildContext context ,  index){
                    return Container(
                      child: Image.network(imgList[index]),
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                    );
                  },
                ),
              ),

              Container(

                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: _controller.productList.length,
                    itemBuilder: (ctx, int) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  View(_controller.productList[int])),
                            );
                          },
                          child:
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(20),
                            color: Colors.blue[100],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  "happybuy.appsticit.com/"+ _controller.productList[int].img1,
                                  height: 200,
                                  width: 250,

                                ),
                                Column(
                                  children: [


                                    Text("Product Name:"+_controller.productList[int].name, textAlign: TextAlign.center,),
                                    Text("Product Price:"+_controller.productList[int].price, textAlign: TextAlign.center,),
                                    Text("Product Selling price:"+_controller.productList[int].sellingPrice, textAlign: TextAlign.center,),
                                    ]
                                     ),
                                  ],
                                ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }
    }));
  }
}
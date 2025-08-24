import 'package:flutter/material.dart';
import 'package:grocery_app/widget/product_card.dart';
import 'package:grocery_app/widget/category_card.dart';
import 'package:grocery_app/widget/promo_banner.dart';
import 'package:grocery_app/widget/searchbar.dart';
import 'package:grocery_app/widget/store_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              // Deliver to
              const Text(
                'Deliver to',
                style: TextStyle(color: Color(0xFF777777), fontSize: 14),
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Text(
                    'Jakarta, Indonesia',
                    style: TextStyle(
                      color: Color(0xFF0D0D0D),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF777777),
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/search',
                  ); // <-- use your named route
                },
                child: SearchBarWidget(hintText: 'Search anything'),
              ),

              const SizedBox(height: 20),

              const PromoCarousel(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryCard(
                      title: 'Meat & Fish',
                      imageUrl:
                          'https://media.istockphoto.com/id/1156027693/photo/fresh-salmon-steak-with-a-variety-of-seafood-and-herbs.jpg?s=612x612&w=0&k=20&c=FnY31V37yG5Ip4ejRttubUHBS8PPTaZfHHukDsEDjc0=',
                    ),
                    SizedBox(width: 15),
                    CategoryCard(
                      title: 'Fruits & Vegetables',
                      imageUrl:
                          'https://centerforfamilymedicine.com/wp-content/uploads/2020/06/Center-for-family-medicine-The-Health-Benefits-of-Eating-10-Servings-Of-Fruits-_-Veggies-Per-Day.jpg',
                    ),
                    SizedBox(width: 15),
                    CategoryCard(
                      title: 'Snacks',
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCyQ8DydqLYwBHztTJTaLz9pXq2aedD0WePA&s',
                    ),
                    SizedBox(width: 15),
                    CategoryCard(
                      title: 'Dairy',
                      imageUrl:
                          'https://domf5oio6qrcr.cloudfront.net/medialibrary/9685/iStock-544807136.jpg',
                    ),
                    SizedBox(width: 15),
                    CategoryCard(
                      title: 'Beverages',
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGDdk1UdMd7gcFH9mWa4cUe6s__FjQsxbvwA&s',
                    ),
                    SizedBox(width: 15),
                    CategoryCard(
                      title: 'Bakery',
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5InRupB0UJD7x9Gbc1N19tf8-PozZi-gTsw&s',
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Choice",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Product(
                      title: "Sprite Can",
                      size: "100 ml",
                      price: "\$1.50",
                      oldPrice: "\$2.10",
                      imageUrl:
                          "https://i0.wp.com/thedieline.com/wp-content/uploads/2022/05/65a5c249-0a78-43dd-b035-238311381538_SpriteDielinebottlehoriz.jpg?fit=1581%2C948&ssl=1",
                    ),
                    Product(
                      title: "Egg Pasta",
                      size: "40 gr",
                      price: "\$15.99",
                      oldPrice: "\$18.99",
                      imageUrl:
                          "https://www.allrecipes.com/thmb/8eg2mEDhj_-wTppSadAddLSXZCw=/0x512/filters:no_upscale():max_bytes(150000):strip_icc()/11991-egg-noodles-Beauty-3x4-22172e14a61644a8962c42871debbf21.jpg",
                    ),
                    Product(
                      title: "Coca Cola",
                      size: "200 ml",
                      price: "\$2.00",
                      oldPrice: "\$2.50",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4QgaytMuztR2IuTWShNGuMTXYX5jpVvvEVw&s",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Popluar Store",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/storePage');
                    },
                    child: StoreWidget(
                      storeName: "Nippon Mart",
                      distanceTime: "4 km  •  15 mins",
                      rating: "⭐ 4.8",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlI1j7V70C_7ygnBN2coYFTPHDkSeP5N4P1Q&s",
                    ),
                  ),

                  StoreWidget(
                    storeName: "Fresh Mart",
                    distanceTime: "2 km  •  5 mins",
                    rating: "⭐ 4.6",
                    imageUrl:
                        "https://play-lh.googleusercontent.com/sk9bWJ_X98w2g2Wj9qwsQUPcGlWWtld3QmbGQVYV8GnKayCX6jD3tJWk3DwtWMTMPtmD",
                  ),
                  StoreWidget(
                    storeName: "Jaya Mart",
                    distanceTime: "12 km  •  36 mins",
                    rating: "⭐ 4.3",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT40r8CJqJXrCyCTHNpqFge7noClx8EqdVlQA&s",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

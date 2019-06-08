import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => new _LandingState();
 }
class _LandingState extends State<Landing> {
  String baseImagesUrl = 'https://image.tmdb.org/t/p/';
  List<String> items = ['Mi Perfil', 'Noticias', 'Mensajes', 'Eventos', 'La Ruta del Café'];

  @override
  void initState() {
    super.initState();
    
  }



  Widget _buildAccess() => Container(
    height: 180,
    child: CarouselSlider(
    // items: items == null
    // ? <Widget>[Center(child: CircularProgressIndicator())]
    // : items.map((item) => _buildAccessItem(item)).toList(),
    items: <Widget>[
    _buildAccessItem('Mi Perfil', Icons.person),
          _buildAccessItem('Noticias', Icons.new_releases),
          _buildAccessItem('Mensajes', Icons.sms),
          _buildAccessItem('Eventos', Icons.calendar_today),
          _buildAccessItem('Ruta del café', Icons.wrap_text),
    ],
    autoPlay: false,
    height: 150,
    viewportFraction: 0.65,
    enlargeCenterPage: true,
    initialPage: 0,

  )
  );

  Widget _buildAccessItem(String item, IconData icon) {
    double _widthCard = MediaQuery.of(context).size.width * 0.6;

    return Material(
      elevation: 8,
      child: InkWell(
        onTap: () {
          // ir a...
        },
        child: Container(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Icon(
                icon,
                size: 60,
                color: Theme.of(context).primaryColor
              ),
              Text(item, style: TextStyle(color: Theme.of(context).primaryColor))
            ]
          ),
          width: _widthCard,
        )
      )
    );
  }

  Widget _myCircleAvatar(String url) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
      radius: 30,
    );
  }

  Widget _coffeeLoverData(int catas) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            '# catas', 
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w100
            )
          ),
        ),
        Text(
          '$catas', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor
          )
        )
      ]
    );
  }

  Widget _baristaData(int catas, int experiences, int formations) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
        child: Column(      
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  '# catas', 
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w100
                  )
                ),
              ),
              Text(
                '$catas', 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor
                )
              )
            ]
          ),
          // Divider(),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Experiences', 
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w100
                  )
                ),
              ),
              Text(
                '$experiences', 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor
                )
              )
            ],
          ),
          // Divider(),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Formations', 
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w100
                  )
                ),
              ),
              Text(
                '$formations', 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor
                )
              )
            ],
          )            
        ],
      )
    );
  }

  Widget _coffeeLover() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          children: <Widget>[
            _myCircleAvatar('https://randomuser.me/api/portraits/med/men/65.jpg'),
            _coffeeLoverData(22)
          ]
        )
      ),
    );
  }

  Widget _barista() {
    return Card(      
      elevation: 4,
      margin: EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        padding: EdgeInsets.fromLTRB(8,4,8,0),
        child: Row(
          children: <Widget>[
            _myCircleAvatar('https://randomuser.me/api/portraits/med/women/65.jpg'),
            _baristaData(22, 6, 3)
          ]
        ),
      )
    );
  }

  Widget _coffeeShops() {
    final card =  Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 160,
            child: Image(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-F_zteDKGcodj45pBtGQG6Y6_wqePwqBdV2PSslVsvixeMj0'),
              fit: BoxFit.cover
            )
          ),
          Container(
            // color: Color(0xAA1F1F1F),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Titulo Titulo Titulo', style: TextStyle(color: Colors.grey[600] , fontSize: 16), textAlign: TextAlign.start, overflow: TextOverflow.ellipsis,),
                Text('SubTitulo, SubTitulo, SubTitulo', style: TextStyle(color: Colors.grey[600], fontSize: 9, ), textAlign: TextAlign.start, overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 20),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(8)
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1, offset: Offset(3,3))
        ]
      ),
    );
  }

  Widget _coffeeRoasters() {
    final card = Card(  
      margin: EdgeInsets.only(right: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Image(
            image: NetworkImage('http://elgatobarista.es/wp-content/uploads/2018/11/ineffable-coffee-roasters.jpg'),
            fit: BoxFit.fitWidth
          ),
          Container(

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text('INEFFABLE ROASTER', style: TextStyle(color: Colors.grey[600] , fontSize: 16), textAlign: TextAlign.start, overflow: TextOverflow.ellipsis,)
            )
          )
        ],
      )
    );

    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: card
    );
  }


  Widget _buildCoffeeLoversList() {
    MediaQueryData data;
    data = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 160,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Coffe Lovers', 
              style: TextStyle(
                fontSize: 14, color: Theme.of(context).primaryColor, 
                fontStyle: FontStyle.italic, 
                fontWeight: FontWeight.w300
              )
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _coffeeLover(), _coffeeLover(), _coffeeLover(), _coffeeLover(),
                _coffeeLover(), _coffeeLover(), _coffeeLover(), _coffeeLover(),
                _coffeeLover(), _coffeeLover(), _coffeeLover(), _coffeeLover(),
                // Container() 
              ],
            )
          )
        ],
      )
    );
  }

  Widget _buildBaristasList() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 160,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Baristas', 
              style: TextStyle(
                fontSize: 14, color: Theme.of(context).primaryColor, 
                fontStyle: FontStyle.italic, 
                fontWeight: FontWeight.w300
              )
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _barista(), _barista(), _barista(), _barista(), _barista(),
                _barista(), _barista(), _barista(), _barista(), _barista(),
                _barista(), _barista(), _barista(), _barista(), _barista(),
                // Container() 
              ],
            )
          )
        ],
      )
    );
  }

  Widget _buildCoffeeShopsList() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 260,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Coffee shops', 
              style: TextStyle(
                fontSize: 14, color: Theme.of(context).primaryColor, 
                fontStyle: FontStyle.italic, 
                fontWeight: FontWeight.w300
              )
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _coffeeShops(), _coffeeShops(), _coffeeShops(), _coffeeShops(),
                _coffeeShops(), _coffeeShops(), _coffeeShops(), _coffeeShops(),
                _coffeeShops(), _coffeeShops(), _coffeeShops(), _coffeeShops(),
                // Container() 
              ],
            )
          )
        ],
      )
    );
  }

  Widget _buildRoastersList() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 280,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Coffee roasters', 
              style: TextStyle(
                fontSize: 14, color: Theme.of(context).primaryColor, 
                fontStyle: FontStyle.italic, 
                fontWeight: FontWeight.w300
              )
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _coffeeRoasters(), _coffeeRoasters(), _coffeeRoasters(), _coffeeRoasters(),
                _coffeeRoasters(), _coffeeRoasters(), _coffeeRoasters(), _coffeeRoasters(),
                _coffeeRoasters(), _coffeeRoasters(), _coffeeRoasters(), _coffeeRoasters(),
                // Container() 
              ],
            )
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
     backgroundColor: Theme.of(context).backgroundColor,
     appBar: AppBar(
       title: Text('Panel del usuario'),
       centerTitle: true,
     ),
     body: NestedScrollView(
       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
         return <Widget>[
           SliverAppBar(  
             backgroundColor: Theme.of(context).backgroundColor,
             automaticallyImplyLeading: false,           
             title: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Accesos', 
                    style: TextStyle(
                      fontSize: 14, color: Theme.of(context).primaryColor, 
                      fontStyle: FontStyle.italic, 
                      fontWeight: FontWeight.w300
                    )
                  ),
                ) 
              ),
             expandedHeight: 210,
             floating: true,
             pinned: true,
             flexibleSpace: FlexibleSpaceBar(
               background: Stack(
                 
                 children: <Widget>[
                   Padding(
                     padding: EdgeInsets.only(top: 45,),
                     child: _buildAccess()
                   )
                 ]
               )
             ),
           )
         ];
       },
       body: ListView(
         children: <Widget>[
           Divider(),
           _buildCoffeeLoversList(),
           Divider(),
           _buildBaristasList(),
           Divider(),
           _buildCoffeeShopsList(),
           Divider(),
           _buildRoastersList(),
           SizedBox(height: 40)
         ],
       ),
     )
   );
  }
}
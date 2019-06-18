import 'package:artis_app/locale/AppLang.dart';
import 'package:artis_app/widgets/shared/ArtisDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// Clase que crea página de inicio para el usuario no logueado
/// 
/// Crea la pantalla de llegada del usuario que no realizó un login
class LandingNoLogged extends StatefulWidget {
  @override
  _LandingState createState() => new _LandingState();
 }
class _LandingState extends State<LandingNoLogged> {

  /// String que guarda ruta a imagen temporal
  String baseImagesUrl = 'https://image.tmdb.org/t/p/';

  /// GlobalKey ScaffoldState que provee la capacidad de seleccionar el scaffold para agregar un SnackBar
  GlobalKey<ScaffoldState> _keyScaffoldLandigNoLogged = GlobalKey<ScaffoldState>();
  String text;

  @override
  void initState() {
    super.initState();
  }


  /// Función que crea los accesos para el usuario no logueado
  /// 
  /// Esta función privada crea una Columna contenedora del espacio que muestra los accesos posibles para
  /// un usuario No Logueado
  Widget _buildAccessNoLogged() => Container(
    height: 200,
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            AppLang.of(context).trans('landingAccess'),
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 14, color: Theme.of(context).primaryColor, 
              fontStyle: FontStyle.italic, 
              fontWeight: FontWeight.w300
            )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildAccessItem(AppLang.of(context).trans('landingItemsEvents'), Icons.calendar_today),
            _buildAccessItem(AppLang.of(context).trans('landingItemsTheCoffeeRoute'), Icons.wrap_text),
          ],
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/createUser');
          },
          child: Text(
            AppLang.of(context).trans('landingNoLoggedCreateUser'), 
            textAlign: TextAlign.center,
            style: TextStyle(              
              fontSize: 18, color: Theme.of(context).primaryColor, 
              fontStyle: FontStyle.italic, 
              fontWeight: FontWeight.w300
            )
          ),
        )
      ]
    )
  //   child: CarouselSlider(
  //   // items: items == null
  //   // ? <Widget>[Center(child: CircularProgressIndicator())]
  //   // : items.map((item) => _buildAccessItem(item)).toList(),
  //   items: <Widget>[
  //   _buildAccessItem('Mi Perfil', Icons.person),
  //         _buildAccessItem('Noticias', Icons.new_releases),
  //         _buildAccessItem('Mensajes', Icons.sms),
  //         _buildAccessItem('Eventos', Icons.calendar_today),
  //         _buildAccessItem('Ruta del café', Icons.wrap_text),
  //   ],
  //   autoPlay: false,
  //   height: 150,
  //   viewportFraction: 0.65,
  //   enlargeCenterPage: true,
  //   initialPage: 0,

  // )
  );

  /// Función que crea cada uno de los accesos del usuario no logueado
  /// 
  /// Esta función privada recibe un String item y un IconData icon para crear cada uno de los 
  /// items de acceso para el usuario no logueado. El ancho de cada item es el 40% de la pantalla
  Widget _buildAccessItem(String item, IconData icon) {
    double _widthCard = MediaQuery.of(context).size.width * 0.4;

    return Material(
      elevation: 8,
      child: InkWell(
        onTap: () {
          // ir a...
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
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

  /// Función que crea un avatar circular
  /// 
  /// Esta función privada recibe un String url con la ruta a la imagen de perfil y es contenida por
  /// un CircleAvatar con un radio de 30 unidades.
  Widget _myCircleAvatar(String url) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
      radius: 30,
    );
  }

  /// Función que crea los datos de los coffeelovers
  /// 
  /// Esta función privada recibe un int catas que es el valor a mostrar para cada coffeelover como 
  /// dato dinamico que proviene de la llamada http.
  Widget _coffeeLoverData(int catas) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            AppLang.of(context).trans('landingNumberTastings'), 
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

  /// Función que crea los datos de los baristas
  /// 
  /// Esta función privada recibe un int catas, int experiences, int formations que son los valores a mostrar para cada baristas como 
  /// dato dinamico que proviene de la llamada http.
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
                  AppLang.of(context).trans('landingNumberTastings'), 
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
                  AppLang.of(context).trans('landingNumberExperiences'), 
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
                  AppLang.of(context).trans('landingNumberFormations'),
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

  /// Función que crea un coffeelover
  /// 
  /// Esta función privada crea una Card con el avatar y la data de un coffeelover
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

  /// Función que crea un barista
  /// 
  /// Esta función privada crea una Card con el avatar y la data de un barista
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

  /// Función que crea una cafetería
  /// 
  /// Esta función privada crea un Container que mustra una imagen de la cafetería y datos de la misma
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

  /// Función que crea un tostador
  /// 
  /// Esta función privada crea un Container que mustra una imagen del tostador y datos del mismo
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

  /// Función que crea una lista de coffeelovers
  /// 
  /// Esta función privada crea una lista de coffeelover que provienen de una llamada http
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
              AppLang.of(context).trans('landingCoffeeLovers'), 
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

  /// Función que crea una lista de baristas
  /// 
  /// Esta función privada crea una lista de baristas que provienen de una llamada http
  Widget _buildBaristasList() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 170,
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

  /// Función que crea una lista de cafeterías
  /// 
  /// Esta función privada crea una lista de cafeterías que provienen de una llamada http
  Widget _buildCoffeeShopsList() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 270,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              AppLang.of(context).trans('landingCoffeeShop'), 
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

  /// Función que crea una lista de tostadores
  /// 
  /// Esta función privada crea una lista de tostadores que provienen de una llamada http
  Widget _buildRoastersList() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 290,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              AppLang.of(context).trans('landingCoffeeRoasters'),
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
    key: _keyScaffoldLandigNoLogged,
     backgroundColor: Theme.of(context).backgroundColor,
     appBar: AppBar(
       title: Text(AppLang.of(context).trans('landingUserNotLoggedIn')),
       centerTitle: true,
     ),
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
           Divider(),
           _buildAccessNoLogged(),
           SizedBox(height: 40)
         ],
       ),
       drawer: ArtisDrawer(),
     
   );
  }
}
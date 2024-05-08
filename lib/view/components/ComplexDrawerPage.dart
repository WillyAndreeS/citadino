
import 'package:cached_network_image/cached_network_image.dart';
import 'package:citadino/view/caja/cajaPedidos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';


bool selected2 = false;
bool selected = false;

class ComplexDrawerPage extends StatefulWidget {
  List? menu = [];
  int? intro = 0;
  int? selectDrawerItem2;
  ComplexDrawerPage({Key? key, this.menu, this.selectDrawerItem2, this.intro})
      : super(key: key);

  @override
  _ComplexDrawerPageState createState() => _ComplexDrawerPageState();
}

class _ComplexDrawerPageState extends State<ComplexDrawerPage> {
  String estadoIntro = "0";
  int? selectDrawerItem3 = 0;


  callback(String newValue) {
    setState(() {
      widget.selectDrawerItem2 = int.parse(newValue);
    });
  }

  _getMenuAdministrador(String pos, String pos2) {
    setState(() {
    });
//haber
    switch (pos) {
      case "0":
        return const CajaPedidos();


    // default: ModuloEnConstruccion();
    }
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        child: Scaffold(
      appBar: appBar(),
      body: _getMenuAdministrador(
          widget.selectDrawerItem2!.toString(), selectDrawerItem3!.toString()),
      drawer: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(45), bottomRight: Radius.circular(45)),
          child: ComplexDrawer(menu: widget.menu!, callback: callback)),
      drawerScrimColor: Colors.transparent,

      //backgroundColor: kPrimaryColor
    ),  onWillPop: () async => false);
  }

  AppBar appBar() {

    return AppBar(
      backgroundColor: Colors.blue[900],
      foregroundColor: Colors.white,
      //backgroundColor: const Color(0XFF00AB74),
      title: Row(
        children: [Row(children: [
            Container(
                child: const Text(
                  "Citadino",
                  style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: "Schyler"),
                )),
          ])
        ],
      ),
    );
  }

  Widget body() {
    return Center(
      child: Container(
        foregroundDecoration: const BoxDecoration(
          color: Colors.black,
          backgroundBlendMode: BlendMode.saturation,
        ),
        child: const FlutterLogo(
          size: 150,
        ),
      ),
    );
  }
}

class ComplexDrawer extends StatefulWidget {
  List? menu = [];
  Function callback;
  ComplexDrawer({Key? key, this.menu, required this.callback})
      : super(key: key);

  @override
  _ComplexDrawerState createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  //dont set it to 0
  bool isExpanded = true;
  List submenuid = [];


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: row(),
      color: Colors.transparent,
    );
  }

  Widget row() {
    return Row(children: [
      blackIconTiles(),
      invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(45), bottomRight: Radius.circular(45)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/logo-citadino.jpg"))),
                child: controlTile(),
              ),
              Divider(height: 7,color: Colors.grey,),
              SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.menu!.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool selected = selectedIndex == index;
                    return Container(
                        decoration: selected == true
                            ? const BoxDecoration(
                            color: Color(0X306E98D9),
                            borderRadius:
                            BorderRadius.all(Radius.circular(16)))
                            : null,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: ExpansionTile(
                            onExpansionChanged: (z) {
                              setState(() {
                                print("PRUEBA EXPANSION");
                                submenuid.clear();
                                selectedIndex = index;

                                for (int e = 0;
                                e < submenusInicio!.length;
                                e++) {
                                  if (widget.menu![index]["alias"] ==
                                      submenusInicio![e]["idalias"]) {
                                    var objeto = {
                                      "idalias": submenusInicio![e]["idalias"],
                                      "descripcion": submenusInicio![e]
                                      ["descripcion"],
                                      "icono": submenusInicio![e]["icono"],
                                      "idsubmenu": submenusInicio![e]
                                      ["idsubmenu"]
                                    };
                                    submenuid.add(objeto);
                                  }
                                }

                                if (submenuid.isEmpty) {
                                  Navigator.of(context).pop();
                                  selectDrawerItem =
                                      int.parse(widget.menu![index]["alias"]);
                                  //print("posi: "+selectDrawerItem.toString());
                                  widget
                                      .callback(widget.menu![index]["alias"]);
                                }


                              });
                            },
                            leading: CachedNetworkImage(imageUrl: widget.menu![index]["icono"],width: 25, color: Colors.black,placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: Colors.blueAccent)),
                                errorWidget: (context, url, error) => const Icon(Icons.error)),
                            title: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                              widget.menu![index]["descripcion"],
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                            trailing: submenuid.isEmpty
                                ? null
                                : Icon(
                              selected
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            children:  submenuid.map((subMenu) {
                              return  selected ? sMenuButton(subMenu["descripcion"], false,
                                  subMenu["icono"], subMenu["idsubmenu"]): Container();
                            }).toList()));
                  },
                ),
              ),
              const Divider(),
              Container(
                  decoration: selected2 == true
                      ? const BoxDecoration(
                      color: Color(0X3000AB74),
                      borderRadius: BorderRadius.all(Radius.circular(16)))
                      : null,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                    onExpansionChanged: (z) {
                      setState(() {
                        selected2 = true;
                      });
                      showDialog(
                          context: context,
                          builder: (context) => const CustomDialogsLogout(
                            title: "Sesión",
                            description: "¿Deseas Cerrar Sesión?",
                            imagen: "assets/images/cerrar-sesion.png",
                          ));
                    },
                    title: const Text(
                      "Cerrar Sesión",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5),
                    ),

                  )
              ),
              accountTile(),
            ],
          ),
        ));
  }

  Widget controlTile() {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 30),
      child: GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height * 0.09,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )),

        onTap: expandOrShrinkDrawer,
      ),
    );
  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: 100,
      color: Colors.white,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.green),
              child: controlButton()),
          Divider(thickness: 1, color: Colors.grey),
          Expanded(
            child: ListView.builder(
                itemCount: widget.menu!.length,
                itemBuilder: (contex, index) {
                  // if(index==0) return controlButton();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      height: 27,
                      alignment: Alignment.center,
                      child: Image.network(widget.menu![index]["icono"],
                          color: Colors.black),
                    ),
                  );
                }),
          ),
          Container(
              color: Colors.blueGrey,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              child: accountButton()),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    // List<CDM> _cmds = cdms..removeAt(0);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: isExpanded ? 0 : 125,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: widget.menu!.length,
                itemBuilder: (context, index) {
                  //CDM cmd = cdms[index];
                  // if(index==0) return Container(height:95);
                  //controll button has 45 h + 20 top + 30 bottom = 95

                  for (int e = 0; e < submenusInicio!.length; e++) {
                    if (widget.menu![index]["alias"] ==
                        submenusInicio![e]["idalias"]) {
                      var objeto = {
                        "idalias": submenusInicio![e]["idalias"],
                        "descripcion": submenusInicio![e]["descripcion"],
                        "icono": submenusInicio![e]["icono"],
                        "idsubmenu": submenusInicio![e]["idsubmenu"]
                      };
                      submenuid.add(objeto);
                    }
                  }

                  bool selected = selectedIndex == index;
                  bool isValidSubMenu = selected && submenuid.isNotEmpty;
                  return subMenuWidget(submenuid, isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/menu.png',
            height: 40,
          ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu ? Colors.blueGrey : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index]["descripcion"];
            String submenuid = submenus[index]["idsubmenu"];
            print("subffff: " + submenuid);
            return sMenuButtonmini(subMenu, index == 0, submenuid);
          }),
    );
  }

  Widget sMenuButton(
      String subMenu, bool isTitle, String subMenuIcono, String alias) {
    return InkWell(
      onTap: () {
        //handle the function
        //if index==0? donothing: doyourlogic here
        Navigator.of(context).pop();
        widget.callback!(alias);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.18),
            child: Row(children: [
              CachedNetworkImage(imageUrl: subMenuIcono,width: 25, color: Colors.black,placeholder: (context, url) => Center(child: CircularProgressIndicator(color: kPrimaryColor)),
                  errorWidget: (context, url, error) => Icon(Icons.error)),
              //  Image.network(subMenuIcono, )),
              SizedBox(width: 5),
              Text(
                subMenu,
                style: TextStyle(
                  fontSize: isTitle ? 17 : 14,
                  color: isTitle ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ])),
      ),
    );
  }

  Widget sMenuButtonmini(String subMenu, bool isTitle, String alias) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        widget.callback(alias);
        //handle the function
        //if index==0? donothing: doyourlogic here
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          subMenu,
          style: TextStyle(
            fontSize: isTitle ? 17 : 14,
            color: isTitle ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
                "http://web.acpagro.com/app-gcp/index.php/Imagenfacial/examinarFotoAcpLocation/46978207"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
//prueba commit
  Widget accountTile() {
    return Container(
      color: Colors.blueGrey,
      child: ListTile(
        leading: accountButton(usePadding: false),
        title: Text("CITADINO",
            style: TextStyle(
              color: Colors.white,
            )),
        subtitle: Text("Cafetería",
            style: TextStyle(
              color: Colors.white70,
            )),
        onTap: () {
          /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()));*/
        },
      ),
    );
  }

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}

class CustomDialogsLogout extends StatelessWidget {
  final String? title, description, buttontext, imagen, nombre;
  final Image? image;

  const CustomDialogsLogout(
      {Key? key,
        this.title,
        this.description,
        this.buttontext,
        this.image,
        this.imagen,
        this.nombre})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: dialogContents(context),
    );
  }

  dialogContents(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 20, left: 20),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                imagen!,
                width: 64,
                height: 64,
              ),
              const SizedBox(height: 20.0),
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Divider(),
              const SizedBox(height: 10.0),
              Text(
                description!,
                style: const TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24.0),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ]),
                      child: MaterialButton(
                        //color: kArandano,
                          onPressed: () {
                            selected2 = false;
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              SystemNavigator.pop();
                            }
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cerrar Sesión",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ]),
                      child: MaterialButton(
                        //color: kArandano,
                          onPressed: () {

                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

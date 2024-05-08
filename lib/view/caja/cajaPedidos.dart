import 'package:citadino/view/caja/mesaDetalle.dart';
import 'package:citadino/viewmodel/venta/ventaList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../viewmodel/caja/cajaList.dart';
import '../../viewmodel/mesas/MesasList.dart';

class CajaPedidos extends StatefulWidget {
  const CajaPedidos({super.key});

  @override
  State<CajaPedidos> createState() => _CajaPedidosState();
}

class _CajaPedidosState extends State<CajaPedidos> {
  final myControllerFecha = TextEditingController();
  String? _datetime;
  String? monto_incial = "0";
  String? efectivo = "0";
  String? anulada = "0";
  String? tarjeta = "0";
  String? yape = "0";
  String? plim = "0";
  String? transferencia = "0";
  String? egresos = "0";
  String? ingresos = "0";
  String? efectivo_caja = "0";
  String? mesa1 = "R";
  String? mesa2 = "R";
  String? mesa3 = "R";
  String? mesa4 = "R";
  String? mesa5 = "R";
  String? mesa6 = "R";
  String? mesa7 = "R";
  String? mesa8 = "R";
  String? mesa9 = "R";
  String? mesa10 = "R";
  String? mesa11 = "R";
  String? mesa12 = "R";
  String? mesa13 = "R";
  String? mesa14 = "R";




  var maskFormatter =  MaskTextInputFormatter(
      mask: '##-##-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  void _showDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2030),keyboardType: TextInputType.text,
        initialEntryMode: DatePickerEntryMode.calendarOnly).then((value) {
      setState(() {
        if(value.toString() != "null"){
          String fecha = value.toString().substring(8, 10)+"-"+value.toString().substring(5,7 )+"-"+value.toString().substring(0, 4);
          myControllerFecha.text = fecha;
          _datetime = value.toString();
        }
        listarMontosCaja();
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CargarDia();
    listarMontosCaja();

  }

  Future<void>CargarDia() async{
    var fecha = DateTime.now();
    String dia_actual = fecha.toString().substring(8,10)+"-"+fecha.toString().substring(5,7)+"-"+fecha.toString().substring(0,4);

    myControllerFecha.text = dia_actual;
  }

  Future<void>listarMontosCaja() async{
    String fecha_seleccionada = myControllerFecha.text;
    String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

    List? data = await CajaList().RecibirDatosCaja(fecha);
    List? data_mesas = await MesasList().RecibirDatosMesas(fecha);
    setState(() {
      monto_incial = data![0]["monto_inicial"];
      efectivo = data[0]["ventas_efectivo"];
      anulada = data[0]["ventas_anuladas"];
      tarjeta = data[0]["ventas_tarjeta"];
      yape = data[0]["credito"];
      plim = data[0]["plim"];
      transferencia = data[0]["ingresos_extra"];
      egresos = data[0]["egresos"];
      ingresos = data[0]["ingresos"];
      efectivo_caja = data[0]["efectivo_caja"];
      if(data_mesas!.isEmpty){
        mesa1 = "R";
        mesa2 = "R";
        mesa3 = "R";
        mesa4 = "R";
        mesa5 = "R";
        mesa6 = "R";
        mesa7 = "R";
        mesa8 = "R";
        mesa9 = "R";
        mesa10 = "R";
        mesa11 = "R";
        mesa12 = "R";
        mesa13 = "R";
        mesa14 = "R";
      }else{
        for(int i = 0; i < data_mesas.length; i++){

          if(data_mesas[i]["mesa"] == "Mesa 1"){
            mesa1 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 2"){
            mesa2 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "PARA LLEVAR"){
            mesa14 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 3"){
            mesa3 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 4"){
            mesa4 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 5"){
            mesa5 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 6"){
            mesa6 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 7"){
            mesa7 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 8"){
            mesa8 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 9"){
            mesa9 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 10"){
            mesa10 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 11"){
            mesa11 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 12"){
            mesa12 = data_mesas[i]["estado"] ?? "R";
          }else if(data_mesas[i]["mesa"] == "Mesa 13"){
            mesa13 = data_mesas[i]["estado"] ?? "R";
          }
        }
      }

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Container( child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.blue, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("MONTO INICIAL", style: TextStyle(color:Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),),
                  Text("S/.${monto_incial}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.green, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("EFECTIVO", style: TextStyle(color:Colors.green, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${efectivo}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.red, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("VENTAS ANULADAS", style: TextStyle(color:Colors.red, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${anulada}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.lightBlue, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TARJETA", style: TextStyle(color:Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 16),),
                  Text("S/.${tarjeta}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.purple, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("YAPE", style: TextStyle(color:Colors.purple, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${yape}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.lightBlue, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("PLIM", style: TextStyle(color:Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${plim}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.black54, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("TRANSFERENCIA", style: TextStyle(color:Colors.black54, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${transferencia}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.red, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("EGRESOS", style: TextStyle(color:Colors.red, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${egresos}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.lightBlue, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("INGRESOS", style: TextStyle(color:Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${ingresos}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height *0.1,
                decoration: const BoxDecoration(color: Colors.white,
                    border: Border(left: BorderSide(color: Colors.green, width: 5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ]),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("EFECTIVO EN CAJA", style: TextStyle(color:Colors.green, fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("S/.${efectivo_caja}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 22),)
                    ],)
              )
            ],
          ),
          Divider(height: 5,),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () async{
                        String fecha_seleccionada = myControllerFecha.text;
                        String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                        List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 1");
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 1",detalle: detalle)));
                      },
                      child:
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      width: MediaQuery.of(context).size.width* 0.1,
                      height: MediaQuery.of(context).size.height *0.1,
                      decoration:  BoxDecoration(color: mesa1 == "R" ? Colors.green: Colors.red,

                          borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ]),
                      child: Text("MESA 1", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    )),
                    GestureDetector(
                      onTap: () async{
                        String fecha_seleccionada = myControllerFecha.text;
                        String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                        List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 2");
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 2",detalle: detalle)));
                      },
                      child:Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      width: MediaQuery.of(context).size.width* 0.1,
                      height: MediaQuery.of(context).size.height *0.1,
                      decoration:  BoxDecoration(color: mesa2 == "R" ? Colors.green: Colors.red,

                          borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ]),
                      child: Text("MESA 2", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    )),
                  ],)

                ],),
                Column(children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width:
                    MediaQuery.of(context).size.width *0.15,
                    //height: 50.0,
                    padding: const EdgeInsets.only(
                        top: 0.0,
                        bottom: 0.0,
                        left: 5.0,
                        right: 16.0),
                    decoration:  BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0)
                        ]),
                    child:  Container(
                      padding: EdgeInsets.all(5),
                      // margin: EdgeInsets.only(left: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width *0.03,
                      child: Row(children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.025,
                          child: IconButton(onPressed: ()async{
                            _showDatePicker();
                           // await listarMontosCaja();
                          }, icon: const Icon(
                            Icons.date_range,
                            color: Colors.black,
                          )),
                        ),

                        Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width *0.1,
                            child: TextFormField(
                              inputFormatters: [
                                maskFormatter,
                                //LengthLimitingTextInputFormatter(10),
                              ],

                              keyboardType: TextInputType.number,
                              //enabled: false,
                              cursorColor: Colors.blue,
                              controller: myControllerFecha,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Fecha. (31-01-1991)',
                                  hintStyle:  TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black45,
                                      fontSize: 12)),
                            ))],
                      ),
                    ),
                  ),
                ],)



              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container( child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.1,
                  decoration: const BoxDecoration(color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.1,
                  decoration: const BoxDecoration(color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                ),
              GestureDetector(
                onTap: () async{
                  String fecha_seleccionada = myControllerFecha.text;
                  String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                  List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 3");
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 3",detalle: detalle)));
                },
                child:Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.05,
                  height: MediaQuery.of(context).size.height *0.15,
                  decoration:  BoxDecoration(color: mesa3 == "R" ? Colors.green: Colors.red,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                  child: Text("MESA 3", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                )),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 6",)));
                },
                child:Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only( left: 100, right: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.08,
                  decoration:  BoxDecoration(color: mesa6 == "R" ? Colors.green: Colors.red,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                  child: Text("MESA 6", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                )),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric( horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.08,
                  decoration: const BoxDecoration(color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),

                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric( horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.08,
                  decoration: const BoxDecoration(color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric( horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.08,
                  decoration: const BoxDecoration(color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.001,
                  height: MediaQuery.of(context).size.height *0.2,
                  decoration: const BoxDecoration(color: Colors.white,),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric( horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.08,
                  decoration: const BoxDecoration(color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15)), ),
                ),
                GestureDetector(
                    onTap: () async{
                      String fecha_seleccionada = myControllerFecha.text;
                      String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                      List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 12");
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 12",detalle: detalle)));
                    },
                    child:Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric( horizontal: 15),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.08,
                  decoration:  BoxDecoration(color: mesa12 == "R" ? Colors.green: Colors.red,

                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                  child: Text("MESA 12", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                )),

              ],
            ),)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container( child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.1,
                    height: MediaQuery.of(context).size.height *0.1,
                    decoration: const BoxDecoration(color: Colors.white,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.1,
                    height: MediaQuery.of(context).size.height *0.1,
                    decoration: const BoxDecoration(color: Colors.white,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                  ),
              GestureDetector(
                onTap: () async{
                  String fecha_seleccionada = myControllerFecha.text;
                  String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                  List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 4");
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 4",detalle: detalle)));
                },
                child:Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.10,
                    height: MediaQuery.of(context).size.height *0.10,
                    decoration:  BoxDecoration(color: mesa4 == "R" ? Colors.green: Colors.red,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                    child: Text("MESA 4", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  )),
                  GestureDetector(
                    onTap: () async{
                      String fecha_seleccionada = myControllerFecha.text;
                      String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                      List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 5");
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 5",detalle: detalle)));
                    },
                      child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.10,
                    height: MediaQuery.of(context).size.height *0.10,
                    decoration:  BoxDecoration(color: mesa5 == "R" ? Colors.green: Colors.red,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                    child: Text("MESA 5", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  )),
              GestureDetector(
                  onTap: () async{
                    String fecha_seleccionada = myControllerFecha.text;
                    String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                    List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 7");
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 7",detalle: detalle)));
                  },
                child:Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.10,
                    height: MediaQuery.of(context).size.height *0.10,
                    decoration:  BoxDecoration(color: mesa7 == "R" ? Colors.green: Colors.red,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                    child: Text("MESA 7", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  )),
              GestureDetector(
                  onTap: () async{
                    String fecha_seleccionada = myControllerFecha.text;
                    String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                    List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 8");
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 8",detalle: detalle)));
                  },
                child:Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.10,
                    height: MediaQuery.of(context).size.height *0.10,
                    decoration:  BoxDecoration(color: mesa8 == "R" ? Colors.green: Colors.red,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                    child: Text("MESA 8", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  )),
              GestureDetector(
                  onTap: () async{
                    String fecha_seleccionada = myControllerFecha.text;
                    String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                    List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 9");
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 9",detalle: detalle)));
                  },
                child:Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.10,
                    height: MediaQuery.of(context).size.height *0.10,
                    decoration:  BoxDecoration(color: mesa9 == "R" ? Colors.green: Colors.red,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                    child: Text("MESA 9", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.001,
                    height: MediaQuery.of(context).size.height *0.2,
                    decoration: const BoxDecoration(color: Colors.grey,),
                  ),
              GestureDetector(
                  onTap: () async{
                    String fecha_seleccionada = myControllerFecha.text;
                    String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                    List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 10");
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 10",detalle: detalle)));
                  },
                child:Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.10,
                    height: MediaQuery.of(context).size.height *0.10,
                    decoration:  BoxDecoration(color: mesa10 == "R" ? Colors.green: Colors.red,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                    child: Text("MESA 10", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  )),
              GestureDetector(
                  onTap: () async{
                    String fecha_seleccionada = myControllerFecha.text;
                    String fecha = fecha_seleccionada.toString().substring(6,10)+"-"+fecha_seleccionada.toString().substring(3,5)+"-"+fecha_seleccionada.toString().substring(0,2);

                    List? detalle = await VentaList().RecibirDatosVentas(fecha, "Mesa 11");
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MesaDetalle(mesa: "Mesa 11",detalle: detalle)));
                  },
                child:Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: MediaQuery.of(context).size.width* 0.10,
                    height: MediaQuery.of(context).size.height *0.10,
                    decoration:  BoxDecoration(color: mesa11 == "R" ? Colors.green: Colors.red,

                        borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ]),
                    child: Text("MESA 11", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  )),

                ],
              ),)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  width: MediaQuery.of(context).size.width* 0.01,
                  height: MediaQuery.of(context).size.height *0.02,
                  decoration: const BoxDecoration(color: Colors.green,

                      borderRadius: BorderRadius.all(Radius.circular(15))),

                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width* 0.1,
                  height: MediaQuery.of(context).size.height *0.02,
                  decoration: const BoxDecoration(color: Colors.white,

                      borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text("LIBRE")
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  width: MediaQuery.of(context).size.width* 0.01,
                  height: MediaQuery.of(context).size.height *0.02,
                  decoration: const BoxDecoration(color: Colors.red,

                      borderRadius: BorderRadius.all(Radius.circular(15))),

                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width* 0.1,
                    height: MediaQuery.of(context).size.height *0.02,
                    decoration: const BoxDecoration(color: Colors.white,

                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text("OCUPADO")
                ),

              ],
            ),
          ],)



        ],)),
      ),
    );
  }
}

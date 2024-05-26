
import 'package:citadino/model/carta.dart';
import 'package:citadino/view/caja/cajaPedidos.dart';
import 'package:citadino/view/components/ComplexDrawerPage.dart';
import 'package:citadino/viewmodel/producto/ProductoList.dart';
import 'package:citadino/viewmodel/venta/ventaDelete.dart';
import 'package:citadino/viewmodel/venta/ventaDetailSave.dart';
import 'package:citadino/viewmodel/venta/ventaSave.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../model/utils/searchDialogDelegate.dart';

class MesaDetalle extends StatefulWidget {
  String? mesa;
  List? detalle;
   MesaDetalle({super.key, this.mesa, this.detalle});

  @override
  State<MesaDetalle> createState() => _MesaDetalleState();
}

class _MesaDetalleState extends State<MesaDetalle> {
  //List pedido = [{"CANTIDAD": "1", "PRODUCTO":"LATTE MOCCACINO", "SUBTOTAL": "12.00"},{"CANTIDAD": "2", "PRODUCTO":"JUGO DE FRESA", "SUBTOTAL": "10.00"}];
  List? carta = [];
  List mesas = [{"IDMESA": "MESA 1", "MESA":"MESA 1"},{"IDMESA": "MESA 2", "MESA":"MESA 2"},{"IDMESA": "MESA 3", "MESA":"MESA 3"},
    {"IDMESA": "MESA 4", "MESA":"MESA 4"},{"IDMESA": "MESA 5", "MESA":"MESA 5"},{"IDMESA": "MESA 6", "MESA":"MESA 6"},
    {"IDMESA": "MESA 7", "MESA":"MESA 7"},{"IDMESA": "MESA 8", "MESA":"MESA 8"},{"IDMESA": "MESA 9", "MESA":"MESA 9"},
    {"IDMESA": "MESA 10", "MESA":"MESA 10"},{"IDMESA": "MESA 11", "MESA":"MESA 11"},{"IDMESA": "MESA 12", "MESA":"MESA 12"},
    {"IDMESA": "MESA 13", "MESA":"MESA 13"},{"IDMESA": "PARA LLEVAR", "MESA":"PARA LLEVAR"}];
  String mesaseleccionada = "";
  int codigo_venta = 0;
  final myControllerUser = TextEditingController();
  List<Carta> listcarta = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ListarProductosCarta();
  }

  Future<void>ListarProductosCarta()async{
    String nombre = "";
    if(widget.detalle!.isNotEmpty){
      codigo_venta = int.parse(widget.detalle![0]["nro_venta"]);
    }else{
      codigo_venta = 0;
    }

    carta = await ProductoList().RecibirDatosCarta(nombre);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:  Text(
          "DETALLE DE ${widget.mesa.toString().toUpperCase()}",
          style: TextStyle(fontFamily: "Schyler", color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:  Colors.white,),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ComplexDrawerPage(menu: [{"alias":"0", "descripcion": "CAJA", "estado": "1", "icono":"https://firebasestorage.googleapis.com/v0/b/gcp-movil.appspot.com/o/LOGO%20ACP_SOBRE%20VERDE%20Y%20BLANCO%202021-10%20(1).png?alt=media&token=68dca214-c9b6-41aa-9c15-27aa473511b0"
            }],selectDrawerItem2: 0,)));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Row(children: [

            Column(
              children: [
              Row(
                children: [
                  GestureDetector(child: Container(

                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 15),
                      width: MediaQuery.of(context).size.width* 0.15,
                      height: MediaQuery.of(context).size.height* 0.05 ,
                      decoration: const BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ] ),
                      child: Text("GENERAR PRE-CUENTA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                  ),),
                  SizedBox(width: 15,),
                  GestureDetector(child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width* 0.15,
                      height: MediaQuery.of(context).size.height* 0.05 ,
                      decoration: const BoxDecoration(color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ] ),
                      child:Text("CERRAR MESA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                  ),),
                  SizedBox(width: 15,),
                  GestureDetector(
                      onTap: (){
                        setState(() {

                        });
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.04,
                          height: MediaQuery.of(context).size.height * 0.06,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.print, color: Colors.white,))),
                ],),
              Container(

                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(child: Container(
                            margin: EdgeInsets.only(left: 15),
                            width: MediaQuery.of(context).size.width* 0.03,
                            height: MediaQuery.of(context).size.height* 0.05 ,
                            decoration: const BoxDecoration(color: Colors.green,
                                borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 10.0),
                                  )
                                ] ),
                            child: Icon(Icons.change_circle, color: Colors.white,)
                        ),),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: FormHelper.dropDownWidget(context, "SELECCIONA UNA MESA", widget.mesa.toString().toUpperCase(), mesas, (onChangedVal){
                              setState((){
                                mesaseleccionada = onChangedVal;
                                //idbonoseleccionado = onChangedVal;
                              });

                            }, (onValidateVal){
                              if(onValidateVal == null){
                                return "Por favor selecciona una mesa";
                              }
                              return null;
                            },
                                borderColor: Colors.black,
                                borderFocusColor: Colors.white,
                                borderRadius: 20,
                                borderWidth: 0,
                                focusedBorderWidth: 0,
                                enabledBorderWidth: 0,
                                optionValue: "IDMESA",
                                optionLabel: "MESA"

                            )),
                      ],),

                  ],),
              ),
              Container(
          margin: EdgeInsets.symmetric( horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width* 0.4,
            height: MediaQuery.of(context).size.height *0.05,
            decoration: const BoxDecoration(color: Colors.blue,
                border: Border(left: BorderSide(color: Colors.blue, width: 5), right: BorderSide(color: Colors.blue, width: 5)),
                borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  )
                ]),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("CANTIDAD", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                VerticalDivider(thickness: 2, color: Colors.black,width: 5,),
                Text("PRODUCTO", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                VerticalDivider(thickness: 2, color: Colors.black,width: 5,),
                Text("SUBTOTAL", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
              ],)
        ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                itemCount: widget.detalle!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      width: MediaQuery.of(context).size.width* 0.1,
                      height: MediaQuery.of(context).size.height *0.1,
                      decoration: const BoxDecoration(color: Colors.white,
                          border: Border(left: BorderSide(color: Colors.blue, width: 5), right: BorderSide(color: Colors.blue, width: 5)),
                          borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ]),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(widget.detalle![index]["cantidad"], style: TextStyle(color:Colors.black, fontSize: 20),textAlign: TextAlign.center,),
                          Text(widget.detalle![index]["producto"], style: TextStyle(color:Colors.black, fontSize: 20),textAlign: TextAlign.center),
                          Text(widget.detalle![index]["subtotal"], style: TextStyle(color:Colors.black, fontSize: 20),textAlign: TextAlign.center),
                          GestureDetector(
                            onTap: () async{
                              double total = 0;
                              for(int i = 0; i <widget.detalle!.length; i++){
                                total = total + double.parse(widget.detalle![i]["subtotal"]);
                              }
                              double subtotal = total - double.parse(widget.detalle![index]["subtotal"]);
                             int? dato =  await VentaDetailDelete().DeleteDetailDatosVentas(codigo_venta.toString(), widget.detalle![index]["item"], widget.detalle![index]["codigo_articulo"], subtotal.toString(), "0");
                             if(dato == 200){
                               setState(() {
                                 widget.detalle!.removeAt(index);
                               });
                             }


                            },
                            child: Container(
                            width: MediaQuery.of(context).size.width* 0.03,
                            height: MediaQuery.of(context).size.height* 0.05 ,
                            decoration: const BoxDecoration(color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          )
                          ] ),
                            child: Icon(Icons.delete, color: Colors.white,)
                          ),)
                        ],)
                  );
                }
              )),

            ],),
            Column(
              children: [
                  GestureDetector(
                      onTap: ()async {
                        setState(() {
                          for(int i = 0; i< carta!.length; i++){
                            listcarta.add(Carta(idproducto: carta![i]["codigo"].toString(), descripcion: carta![i]["nombre"], precio: carta![i]["precio"].toString(), cantidad: "0")) ;
                          }

                        });
                        var result = await showSearch(
                          context: context,
                          delegate: SearchDialogDelegate(listcarta),
                        );
                        if(result.toString() != "null"){

                          List <Carta> carta_res = [];
                          carta_res.add(result!);
                          for(int i = 0; i<carta_res.length; i++){
                            print("CAT1:" +carta_res[i].cantidad.toString());
                            double subtotal = int.parse(carta_res[i].cantidad.toString()) * double.parse(carta_res[i].precio.toString());
                            setState(() {
                              widget.detalle!.add({"cantidad":carta_res[i].cantidad.toString(), "producto":carta_res[i].descripcion, "precio": carta_res[i].precio.toString(), "subtotal":subtotal.toString()} );
                            });

                          }

                        }
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.04,
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.search, color: Colors.white,))),

              Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width* 0.4,
                  height: MediaQuery.of(context).size.height *0.05,
                  decoration: const BoxDecoration(color: Colors.red,
                      border: Border(left: BorderSide(color: Colors.red, width: 5), right: BorderSide(color: Colors.red, width: 5)),
                      borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0),
                        )
                      ]),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("PRODUCTO", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                      VerticalDivider(thickness: 2, color: Colors.black,width: 5,),
                      Text("PRECIO", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),

                    ],)
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: carta!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async{
                            final result = await showDialog(
                                context: context,
                                builder: (context) =>    WillPopScope(child: CustomDialogsCantidadDetalle(
                                    codigo: "-"
                                ), onWillPop:  () async => false,));
                            if(result != "0"){
                              if(codigo_venta == 0){
                                var fecha = DateTime.now();
                                String dia_actual = fecha.toString().substring(0,4)+"-"+fecha.toString().substring(5,7)+"-"+fecha.toString().substring(8,10);
                                String hora = fecha.toString().substring(11,14)+fecha.toString().substring(14,16);

                                String letras = "-";
                                List? rpta = await VentaSave().SaveDatosVentas(dia_actual, widget.mesa!, "2", hora, letras);
                                if(rpta![0]["ESTADO"] == 200){
                                  double subtotal = double.parse(carta![index]["precio"]) * int.parse(result);
                                  int? dato = await VentaDetailSave().SaveDetailDatosVentas("UND", carta![index]["codigo"], "3",result.toString(), carta![index]["precio"], subtotal.toString(), "0", "-", subtotal.toString(), "0", rpta[0]["DATO"].toString());
                                  if(dato == 200){
                                    setState(() {
                                      double subtotal = double.parse(carta![index]["precio"]) * int.parse(result);
                                      widget.detalle!.add({"cantidad":result, "producto":carta![index]["nombre"], "precio":carta![index]["precio"], "subtotal":subtotal.toString()});
                                    });
                                  }
                                }else{
                                  print("ERROR");
                                }
                              }else{
                                double subtotal = double.parse(carta![index]["precio"]) * int.parse(result);
                                int? dato = await VentaDetailSave().SaveDetailDatosVentas("UND", carta![index]["codigo"], "3",result.toString(), carta![index]["precio"], subtotal.toString(), "0", "-", subtotal.toString(), "0", codigo_venta.toString());
                                if(dato == 200){
                                  setState(() {
                                    double subtotal = double.parse(carta![index]["precio"]) * int.parse(result);
                                    widget.detalle!.add({"cantidad":result, "producto":carta![index]["nombre"], "precio":carta![index]["precio"], "subtotal":subtotal.toString()});
                                  });
                                }
                              }

                            }


                          },
                            child: Container(

                            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width* 0.1,
                            height: MediaQuery.of(context).size.height *0.1,
                            decoration: const BoxDecoration(color: Colors.white,
                                border: Border(left: BorderSide(color: Colors.red, width: 5), right: BorderSide(color: Colors.red, width: 5)),
                                borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow:  [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 10.0),
                                  )
                                ]),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(carta![index]["nombre"], style: TextStyle(color:Colors.black, fontSize: 18),),
                                Text(carta![index]["precio"], style: TextStyle(color:Colors.black, fontSize: 18),),


                              ],)
                        ));
                      }
                  )
              )
            ],)
          ],)
        ),
      ),
    );
  }
}

class CustomDialogsCantidadDetalle extends StatefulWidget {

  final String? codigo;

  const CustomDialogsCantidadDetalle({Key? key, this.codigo})
      : super(key: key);
  @override
  CustomDialogsCantidadDetalleState createState() => CustomDialogsCantidadDetalleState();

}

class CustomDialogsCantidadDetalleState extends State<CustomDialogsCantidadDetalle>{

  @override
  final myControllerAsignacion = TextEditingController();
  final myControllerDetalle = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    myControllerAsignacion.text = "1";
  }


  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: dialogContents(context),
    );
  }


  dialogContents(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          width: size.width*0.2,
          height: size.height*0.4,
          padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          margin: const EdgeInsets.only(top: 10),
          decoration:
          BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15), boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            )
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20.0),
              Text(
                "Datos de pedido",
                style:  const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Divider(),
              const SizedBox(height: 10.0),
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Container(
                      child: Column(children: [

                        Container(
                            decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 3.0,
                                offset: Offset(0.0, 5.0),
                              )
                            ]),
                            alignment: Alignment.center,
                            width: size.width * 0.8,
                            height: size.height * 0.06,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(

                              controller: myControllerAsignacion,
                              cursorColor: const Color(0xFFC41A3B),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                  fontSize: 18),
                              decoration: const InputDecoration(

                                icon: Icon(
                                  Icons.discount,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                hintText: 'CANTIDAD',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black45,
                                    fontSize: 18),
                              ),
                              onChanged: (val) {
                                print(val);
                              },
                            )),
                        SizedBox(height: 15,),
                        Container(
                            decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15)), boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 3.0,
                                offset: Offset(0.0, 5.0),
                              )
                            ]),
                            alignment: Alignment.center,
                            width: size.width * 0.8,
                            height: size.height * 0.06,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(

                              controller: myControllerDetalle,
                              maxLines: 4,
                              cursorColor: const Color(0xFFC41A3B),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                  fontSize: 18),
                              decoration: const InputDecoration(

                                icon: Icon(
                                  Icons.note,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                hintText: 'DETALLE',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black45,
                                    fontSize: 18),
                              ),
                              onChanged: (val) {
                                print(val);
                              },
                            )),
                      ],)
                  )
                //},)

              ),
              const SizedBox(height: 24.0),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
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
                          onPressed: () async{
                            Navigator.pop(context,myControllerAsignacion.text);
                          },
                          child: const Text(
                            "Agregar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
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
                            Navigator.pop(context,"0");
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
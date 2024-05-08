
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



import '../../constants.dart';
import '../../view/caja/mesaDetalle.dart';
import '../carta.dart';

class SearchDialogDelegate extends SearchDelegate<Carta> {
  final List<Carta> carta;

  List<Carta> _filter = [];

  SearchDialogDelegate(this.carta);
  @override
  String get searchFieldLabel => "Buscar";


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    IconButton(

      onPressed: () {
        close(context,   Carta(  idproducto: '', descripcion: '', precio: '', cantidad: ''));
      },
      icon: const Icon(Icons.arrow_back),
    );
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].descripcion!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _filter = carta.where((carta) {
      return carta.descripcion!.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    /*return ListView.builder(
      itemCount: _filter.length,v
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].nombre),
        );
      },
    )*/
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) { return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: _filter.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                  onTap: () async{
                    final result = await showDialog(
                        context: context,
                        builder: (context) =>    WillPopScope(child: CustomDialogsCantidadDetalle(
                            codigo: "-"
                        ), onWillPop:  () async => false,));
                    if(result != "0"){
                      setState(() {
                        var objeto = Carta(idproducto: _filter[index].idproducto, descripcion: _filter[index].descripcion, precio: _filter[index].precio, cantidad: result.toString());

                        Navigator.pop(context, objeto);
                      });
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
                       Text(_filter[index].descripcion!, style: TextStyle(color:Colors.black, fontSize: 18),),
                       Text(_filter[index].precio!, style: TextStyle(color:Colors.black, fontSize: 18),),


                     ],)
               )
              );
            }
        );});
  }
}

import 'package:flutter/material.dart';

const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

// ignore: constant_identifier_names
const url_base = "https://190.223.54.4/";
//const url_base = "https://web.acpagro.com/";

const double kDefaultPadding = 20.0;

const kSpacingUnit = 10;


class Constants {
  static const radius = 35.0;
  static const padding = 15.0;
}
const kPrimaryColor = Color(0xFF00AB74);
const kDarkPrimaryColor = Color(0xFF00AB74);
const kArandano = Color(0xFF455AB4);
const kDarkSecondaryColor = Color(0xFF757A63);
const kPanetone = Color(0xFF4FB75A);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);
const MenuColor = Color(0XFF107512);
const MenuPrincipal = Color(0XFF7FC880);
const iconMenu = Color(0XFF89AA4E);
const moradoacp = Color(0XFF7B4480);
const azulacp = Color(0XFF3B5977);
const amarilloacp = Color(0xFFE0C354);
bool isPlaying = false;

int? selectDrawerItem = 0;
int? tipomenuprincipal = 0;
int? selectedIndex = 0;
String? nombreUsuario = "";
String? nombreCultivo = "";
String? dniUsuario;
String? dniUsuarioinvitadoutilidades;
List? menuconst = [];
List? submenusInicio = [];
int? estado_sesion = 0;
String? token_movil;
String? version_actual = "";
String? empresaUsuario = "";
String? tipoUsuario = "";
String? fnacimiento = "";
bool hasInternets = false;
List menusgcp = [];
String? titulomenu = "";
String? imagenmenu = "";

final ttok1 = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9";
final ttok2 = "eyJpc3MiOiJodHRwczpcL1wvd2ViLmFjcGFncm8uY29tXC9tYXF1aW5hcmlhIiwic3ViIjoiMjA0NjE2NDI3MDYiLCJhdWQiOiJhcGlfdGtfZ2NwIiwiaWF0IjoxNjczOTI5MzE2LCJqdGkiOiIwMDgifQ";
final ttok3 = "sost2KnRWTh4ZHXhn3dP1MyGz53MoYyoTY9xEdQdhME";




final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kLightSecondaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'SFProText',
    bodyColor: kLightSecondaryColor,
    displayColor: kLightSecondaryColor,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
    color: kDarkSecondaryColor,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'SFProText',
    bodyColor: kDarkSecondaryColor,
    displayColor: kDarkSecondaryColor,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
);

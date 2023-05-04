import 'package:rive/rive.dart';

class RiveModel {
  String src, artboard, stateMachineName, title;
  late SMIBool? input;

  RiveModel(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveModel> sideMenu = [
  RiveModel(
    'assets/riv/icons.riv',
    artboard: 'HOME',
    stateMachineName: "HOME_interactivity",
    title: 'Home',
  ),
  RiveModel(
    'assets/riv/icons.riv',
    artboard: 'SEARCH',
    stateMachineName: "SEARCH_Interactivity",
    title: 'Search',
  ),
  RiveModel(
    'assets/riv/icons.riv',
    artboard: 'LIKE/STAR',
    stateMachineName: "STAR_Interactivity",
    title: 'Favorites',
  ),
  RiveModel(
    'assets/riv/icons.riv',
    artboard: 'CHAT',
    stateMachineName: "CHAT_Interactivity",
    title: 'Chat',
  ),
  RiveModel(
    'assets/riv/icons.riv',
    artboard: 'TIMER',
    stateMachineName: "TIMER_Interactivity",
    title: 'Historic',
  ),
  RiveModel(
    'assets/riv/icons.riv',
    artboard: 'BELL',
    stateMachineName: "BELL_Interactivity",
    title: 'Notification',
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xo_game/Custom_widget.dart';
import 'package:xo_game/Model.dart';

class xo_game extends StatefulWidget {
  const xo_game({super.key});

  @override
  State<xo_game> createState() => _xo_gameState();
}

class _xo_gameState extends State<xo_game> {
  @override
    String player="X";
    bool  winner=false;
    String last_player="";


  void updatePlayer(String newPlayer) {
    setState(() {
      player = newPlayer;
    });
  }
  void updateLastPlayer(String newPlayer) {
    setState(() {
      last_player = newPlayer;
      winner=true;
    });
  }

  void resetGame() {
    setState(() {
      player = "X";
      board = List.filled(9, "");
      table = List.filled(8, 0);
      winner = false;
      last_player="";
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("X-O Game",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Text(
              winner ? "The Winner is $last_player" : "The Player $player TURN",
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          )
            ),
       SizedBox(height: 20,),
       Expanded(
         child: Custom_widget_Grid(player,updatePlayer,updateLastPlayer,winner),
         
       ),
             
       ElevatedButton.icon(onPressed: resetGame,
       icon: Icon(Icons.refresh_sharp), label: Text("Restart")),
        SizedBox(height: 100,),


        ],
      ),
    );
  }
}

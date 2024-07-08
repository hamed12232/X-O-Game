import 'package:flutter/material.dart';
import 'package:xo_game/Model.dart';


class Custom_widget_Grid extends StatefulWidget {
  
String player;
Function(String) onPlayer;
Function(String) onLastPlayer;
bool winner=false;

Custom_widget_Grid(this.player,this.onPlayer,this.onLastPlayer,this.winner);
  @override
  State<Custom_widget_Grid> createState() => _Custom_widgetState();
}

class _Custom_widgetState extends State<Custom_widget_Grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10,crossAxisCount: 3,mainAxisSpacing: 10),
          itemCount: 9,
          itemBuilder: ( BuildContext, index) {
            return GestureDetector(

              onTap: widget.winner?null: () {
                setState(() {
                      if (board[index].isEmpty) {
                      board[index] = widget.player;
                      bool hasWon = IsWinner(index, widget.player);
                      if (hasWon) {
                        widget.onLastPlayer(widget.player);
                      } else {
                        widget.onPlayer(widget.player == "X" ? "O" : "X");
                      }
                    }

                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent
                ),
                child: Text("${board[index]}",style: TextStyle(
                  fontSize: 45,fontWeight: FontWeight.bold,color: board[index]=="X"?Colors.black:Color.fromARGB(255, 243, 94, 7)),),
              ),
              

            );
            
          },
          
          );
  }
}
bool IsWinner(int i,player){
  int sum=player=="X"?1:-1;
  int row=i~/3;
  int col=i%3;
  table[row]+=sum;
  table[col+3]+=sum;

  if(row==col){
  table[6]+=sum;

  }if(row==2-col){
  table[7]+=sum;
  }
  if(table.contains(3)||table.contains(-3)){
  return true;
  }else{
    return false;
  }

}

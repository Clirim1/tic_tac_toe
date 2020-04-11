import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_Button.dart';
import 'package:tic_tac_toe/Costum_Dialog.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List<Game_Button> button_List;
  var player_1;
  var player_2;
  var active_player;
  int player1_result = 0;
  int player2_result = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button_List = do_Init();
  }

  List<Game_Button> do_Init() {
    player_1 = new List();
    player_2 = new List();
    active_player = 1;

    var game_buttons = <Game_Button>[
      new Game_Button(id: 1),
      new Game_Button(id: 2),
      new Game_Button(id: 3),
      new Game_Button(id: 4),
      new Game_Button(id: 5),
      new Game_Button(id: 6),
      new Game_Button(id: 7),
      new Game_Button(id: 8),
      new Game_Button(id: 9),
    ];
    return game_buttons;
  }

  void play_Game(Game_Button game_button) {
    setState(() {
      if (active_player == 1) {
        game_button.text = "X";
        game_button.back_graund = Colors.blueAccent;
        active_player = 2;
        player_1.add(game_button.id);
      } else {
        game_button.text = "O";
        game_button.back_graund = Colors.greenAccent;
        active_player = 1;
        player_2.add(game_button.id);
      }
      game_button.enable = false;
      int winner = chek_Winner();
      if (winner == -1) {
        if (button_List.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => new Costum_Dialog(
                  "Game Draw", "Pres resset button to start again.", reset_Game));
        }
      }
    });
  }

  int chek_Winner() {
    var winer = -1;
    if (player_1.contains(1) && player_1.contains(2) && player_1.contains(3)) {
      winer = 1;
      player1_result++;
    }
    if (player_2.contains(1) && player_2.contains(2) && player_2.contains(3)) {
      winer = 2;
      player2_result++;
    }
    if (player_1.contains(4) && player_1.contains(5) && player_1.contains(6)) {
      winer = 1;
      player1_result++;
    }
    if (player_2.contains(4) && player_2.contains(5) && player_2.contains(6)) {
      winer = 2;
      player2_result++;
    }
    if (player_1.contains(7) && player_1.contains(8) && player_1.contains(9)) {
      winer = 1;
      player1_result++;
    }
    if (player_2.contains(7) && player_2.contains(8) && player_2.contains(9)) {
      winer = 2;
      player2_result++;
    }
    if (player_1.contains(1) && player_1.contains(4) && player_1.contains(7)) {
      winer = 1;
      player1_result++;
    }
    if (player_2.contains(1) && player_2.contains(4) && player_2.contains(7)) {
      winer = 2;
      player2_result++;
    }
    if (player_1.contains(2) && player_1.contains(5) && player_1.contains(8)) {
      winer = 1;
      player1_result++;
    }
    if (player_2.contains(2) && player_2.contains(5) && player_2.contains(8)) {
      winer = 2;
      player2_result++;
    }
    if (player_1.contains(1) && player_1.contains(5) && player_1.contains(9)) {
      winer = 1;
      player1_result++;
    }
    if (player_2.contains(1) && player_2.contains(5) && player_2.contains(9)) {
      winer = 2;
      player2_result++;
    }
    if (player_1.contains(3) && player_1.contains(5) && player_1.contains(7)) {
      winer = 1;
      player1_result++;
    }
    if (player_2.contains(3) && player_2.contains(5) && player_2.contains(7)) {
      winer = 2;
      player2_result++;
    }
        if (player_2.contains(3) && player_2.contains(6) && player_2.contains(9)) {
      winer = 2;
      player2_result++;
    }
      if (player_1.contains(3) && player_1.contains(6) && player_1.contains(9)) {
      winer = 1;
      player1_result++;
    }
    if (winer != -1) {
      if (winer == 1) {
        showDialog(
            context: context,
            builder: (_) => new Costum_Dialog("Player 1 Won",
                "Pres the reset button to start again.", reset_Game));
      } else {
        showDialog(
            context: context,
            builder: (_) => new Costum_Dialog("Player 2 Won",
                "Pres the reset button to start again.", reset_Game));
      }
    }
    return winer;
  }

  void reset_Game() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
      button_List = do_Init();
    });
  }

  void reset_Game1() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
      button_List = do_Init();
      player1_result = 0;
      player2_result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Center(child: new Text("Tic Tac Toe"))),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemCount: button_List.length,
              itemBuilder: (context, i) => new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    onPressed: button_List[i].enable
                        ? () => play_Game(button_List[i])
                        : null,
                    child: new Text(button_List[i].text,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 20.0)),
                    color: button_List[i].back_graund,
                    disabledColor: button_List[i].back_graund,
                  )),
            ),
          ),
          new MaterialButton(
            height: 40.0,
            minWidth: 40.0,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: new Text(("Player 1 result = " + player1_result.toString()),
                style: new TextStyle(color: Colors.white, fontSize: 20.0)),
            onPressed: () => {},
            splashColor: Colors.white,
          ),
          new MaterialButton(
            height: 40.0,
            minWidth: 40.0,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: new Text(("Player 2 result = " + player2_result.toString()),
                style: new TextStyle(color: Colors.white, fontSize: 20.0)),
            onPressed: () => {},
            splashColor: Colors.white,
          ),
          new RaisedButton(
            child: new Text("Reset",
                style: new TextStyle(color: Colors.white, fontSize: 30.0)),
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(20.0),
            onPressed: reset_Game1,
          ),
        ],
      ),
    );
  }
}
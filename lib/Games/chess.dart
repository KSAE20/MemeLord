import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class chess extends StatefulWidget {
  const chess({Key? key}) : super(key: key);

  @override
  State<chess> createState() => _chessState();
}

class _chessState extends State<chess> {
  ChessBoardController controller = ChessBoardController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chess Game"),
      ),
      body: Center(
        child: ChessBoard(
          controller: controller,
          boardColor: BoardColor.green,
          boardOrientation: PlayerColor.white,
          onMove: () {
            //
          }
        ),
      ),
    );
  }
}
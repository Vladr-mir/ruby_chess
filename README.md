# Ruby Chess

This project is an implementation of the chess game in the ruby languaje. to play the game run the command: `ruby lib/main.rb`.

## Movement rules

Each player have their own set of pieces they can move using the [rules of chess](http://www.chessvariants.org/d.chess/chess.html).

To move your piece use the [algebraic notation of chess](https://en.wikipedia.org/wiki/Chess_notation) like this: "`Nf3 Nc6`". if the move is valid the position of the piece will be updated and your turn will finish, else the position will not be updated and you will be asked to enter a valid move.

- Eeach row is labeled from `1` to `8`
- Each column is labeled from `a` to `h`

This project uses the [Portable Game Notation](https://en.wikipedia.org/wiki/Portable_Game_Notation)

### Abbreviations

|Piece|Symbol|Notation|
|:--- | :---: | ---: |
| Pawn | ♟ | P |
| Knight | ♞ | N |
| Bishop | ♝ | B |
| Rook | ♜ | R |
| Queen | ♛ | Q |
| King  | ♚ | K |
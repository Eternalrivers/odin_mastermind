# odin_mastermind
Project: Mastermind

Construct a board
  *INITIALIZE an array that will contain colors in a specific order through which the player must determine the colors as well as its order.

Play Game
  * INITIALIZE the board
  * INITIALIZE a human and computer player
  * Computer player will set the winning condition
    -the condition is an array that will contain colors in a specific order 
    -the player must determine the colors as well as its order.
  * REPEAT
    * Human player will guess the colors as well as its order
    * Computer player will provide feedback on the accuracy of the guess
      -"RED" means that a color is correct but the order is wrong
      -"WHITE" means that a color is correct and in a correct order
  * UNTIL
    * Human player correctly guess the color with its correct order
    * Human player incorrectly guess for 12 turns


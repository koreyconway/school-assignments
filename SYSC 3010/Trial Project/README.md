Trial Project - Push Button
===========================

This is a multiplayer push button game. The first to reach 20 button pushes wins!


Technical Overview
------------------

This game requires a Java server and 2 Raspberry Pi's (one with a Gertboard, and the other with PiFace). Each rPi detects when a particular button is pushed and sends a UPD packet to the server to update the score.

There are three components to this game. Each component has it's own README.md file to describe how to set it up and run the program. The order of starting the programs does not matter. 

- server/README.md
- piface/README.md
- gertboard/README.md


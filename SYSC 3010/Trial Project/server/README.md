Trial Project - Server
======================

This is an Eclipse Java project for the server part of our Trial Project game. The source code is kept within "src" and the binaries in "bin".

The main class for the project is called "Server" and is in the package called "org.sgnexus.trialproject".


Run Instructions
----------------

- open terminal
- go to bin folder
- on the terminal:
	$ java org.sgnexus.trialproject.Server
	or
	$ java org/sgnexus/trialproject/Server


Technical Information
---------------------
The server binds to port 55555. It is setup to have 2 players, but can be recompiled with a different constant to support other amounts. Displaying the game results does not work well within eclipse because eclipse doesn't support the clear screen character.
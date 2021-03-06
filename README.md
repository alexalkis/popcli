# popcli

An amiga application that pops a cli when hotkey is pressed. (right amiga - escape)


## Original documentation

    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* |_o_o|\\ Copyright (c) 1986 The Software Distillery.  All Rights Reserved */
    /* |. o.| || This program may not be distributed without the permission of   */
    /* | .  | || the authors.                                                    */
    /* | o  | ||    Dave Baker     Ed Burnette  Jay Denebeim John Mainwaring     */
    /* |  . |//     Gordon Keener  Jack Rouse   John Toebes  Doug Walker         */
    /* ======                    BBS:(919)-471-6436                              */ 
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

    POPCLI III by John Toebes © 1987 The Software Distillery.  All Rights Reserved
     235 Trillingham Ln, Cary, NC 27511
     
    Contributions to continue development of this and other fine products for the
    Amiga should be sent to the Software Distillery at the above address.
    
    Other Products produced by the Software Distillery are:
       BLINK    - the Turbo-charged Alink replacement
       HACK     - The Amiga port of the famous UNIX game
       LARN     - Another famous UNIX game
       MEMWATCH - Protects your machine from random trashes
       MAKE     - A software development tool one shouldn't be without
       KERMIT   - The World renown file transfer protocol brought to the Amiga
       ICONEXEC, SETALTERNATE, SETWINDOW - Icon manipulation tools
       TSIZE    - A short utility for determining directory sizes.
    All of these are available on our BBS.

    Permission is hereby granted to distribute this program provided both this
    documentation accompanies the executable and that no charge is made for its
    distribution.
    
    POPCLI (pronounced POP-SEE-EL-EYE) is designed to solve two problems at once.
    First it provides a simple way of starting another CLI at any time without
    having to load workbench or exit whatever program you may be using.  Second
    it has a builtin screen saver mode that automatically turns off the Amiga
    display when there has been no input for a given period of time.
    
    Once POPCLI is running, you can use it to get a new CLI from whatever program
    you are running by pressing Left Amiga and ESC at the same time.  What this
    does is to bring the workbench screen to the front and then start up a new
    CLI window on the workbench screen.  This is extremely handy when you start
    a program from CLI and then find you need to do a CLI command.
    
    The other function that POPCLI performs is to blank the screen for you.  This
    saves on the wear of the monitor phospher.  It will do this for you
    automatically any time that you have not pressed any key or moved the mouse
    for a given period of time regardless of what has been written to the screen.
    This is useful when you leave the Amiga on unattended so that you don't have
    to mess with the brightness control or worse yet tunr the monitor off putting
    wear and tear on its power supply.  Furthermore it only takes a touch of the
    mouse or any key on the keyboard to bring it all back.
    
    To use POPCLI, you need to execute the command:
      POPCLI <seconds> <key> <command>
    
    Where <seconds> is any number of seconds after which the screen saver is to
    go into effect.  If nothing is specified it defaults to turning off the
    screen after 300 seconds. (Five minutes)  Note that it makes its decision to
    shut blank the screen solely upon the absence of any keyboard, gameport, or
    mouse input.  Even if a program is printing to the screen it will shut down.
    This is not a problem, to unblank the screen merely move the mouse or touch any
    key (SHIFT or CTRL are excellent choices since they don't do anything).
    
    <key> is the scan code of the key that you wish to act as the command 
    executer.  By default this is the Escape key although you may set it to any
    other key if an application you use wants to conflict with PopCLI's choice.
    
    <command> is the command to be executed when the Left Amiga and ESC keys are
    pressed simaultaneously.  By default the command is
       NEWCLI >NIL:
    to bring up a CLI window in the center of the screen.  Note the >NIL: on the
    command to supress any output that the NEWCLI program may give.  This is
    important because at the time the command is executed, the original window
    may be long gone.  If you wish to have a CLI come up elsewhere on the screen
    you can put the window definition in the command such as:
       NEWCLI >NIL: CON:0/0/640/200/MYCLI
    Which will open a CLI to fill the entire screen.  POPCLI does no parsing on
    the command, merely passing the ENTIRE string without any processing to
    AmigaDOS.
    
    If you wish to specify a command with POPCLI you must include the seconds
    value followed by one or more spaces.  Some valid commands are:
       POPCLI 200
       POPCLI 200 NEWCLI >NIL: CON:0/0/640/100/MYWINDOW
       POPCLI 10
       POPCLI 180 NEWCLI >NIL: CON:0/10/640/120/POPUP
    
    
    Terminating POPCLI:
    -------------------
    Once PopCLI has been installed, you can terminate it with the command:
       POPCLI QUIT
    
    You can change the default interval by giving a number:
       POPCLI 5      -  sets the default timeout to 5 seconds.
    This is handy when you want to blank the screen immediately.  Setting the
    interval to a very large number:
       POPCLI 99999
    Will keep PopCLI from blanking your screen.
    
    Note that you can also use this to change the command that it executes or even
    the default key.  Setting the interval does not affect the command to be
    executed.
    
    
    Installing PopCLI:
    ------------------
    To install a copy of POPCLI on your workbench, put a copy of POPCLI in your
    C directory and edit the Startup-Sequence file in the S directory to add
    a POPCLI command of your own taste.
    
    Notes:
    1) POPCLI blanks the screen by creating a one bit-blane lo-res screen in front
       of all other screens and setting the background color to solid black.  It
       then turns off the display freeing the cycles for any program that might
       be running.
    2) Once the screen blanks, if the AMIGA is left undisturbed for 68.096 years
       the screen may briefly flash back on for the next 68.096 years.  I have not
       taken the time to test this.  If this turns out to be a problem, please
       let me know.
    
    Enhancements Provided under POPCLI II:
    
    * POPCLI now runs from WORKBENCH.  An icon is provided for doing so.  When
      run from workbench, the default command and default times will be used.
    
    * When run from CLI, the original window now goes away.  In doing so, it
      also appears that incompatibilities with 1.2 have been removed.  Please
      feel free to comment on potential future improvements.
    
    * The size of the screen used to blank the display has been reduced to reduce
      memory required to blank the screen.
    
    * POPCLI has been recompiled to take advantage of the latest features of 3.04
      Lattice and BLINK.  Although source is being distributed, it is not likely
      that a version of POPCLI could be reconstructed without these products.
    
    Enhancements Provided under PopCLI III:
    
    * POPCLI has again been recompiled with Lattice 4.0 and Blink 6.9.  The source
      provided will NOT compile with other than the latest version of Lattice.
    
    * POPCLI now self installs itself using the seglist splitting technique of
      CBack.  Because of this, you may freely change the timeout interval or command
      without having to reboot your machine.


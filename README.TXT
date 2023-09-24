DOSRBC

This is the DOSRBC project. It is basically the RBC, except for DOS systems. It
should, hopefully, be cross-compatible between DOS systems like FreeDOS, MS-DOS
and the like.

Introduction/Rationale

When I wrote the original RBC project, I mainly had modern operating systems in
mind like Linux, MacOS and Windows, since these are the only modern PC gaming
platforms I know. I am not sure about the statistics of networked DOS systems or
how many DOS systems these days even have properly installed networking
capabilities on the software and OS side. The concern however is the same.
Offline footprint of DOS games and online leaks of anything done in these games
or the traces they leave behind. In order to use this, you need some kind of
storage medium. The simplest one to use is probably a diskette/floppy drive or a
USB flash drive plugged into a diskette drive emulator/floppy disk drive
emulator, but the choice is completely up to you.

To see which games are currently supported, please read the SUPPORT document.
Code portions of this project have been tested on FreeDOS.

Quick start guide

1. Go offline. Do this by any method of your choice. Either use a physical
   ethernet killswitch, a physical wi-fi killswitch, disable all network
   adapters or, if you really have to, pull the ethernet cable.
2. Copy all three scripts to a backup medium of your choice
3. Install your games to a destination such as `C:\GAMES`
4. Declare this path as `DOSGRDIR` variable in the beginning of each script
5. Run the restore script. This doesn't make sense on a first run though!
6. Start your gaming session.
7. When you're done playing, run the backup script.
8. Finally, run the cleanup script and remove the storage medium.

Integrity checking

To easily check the integrity of the files located in this repository on Linux,
simply issue the command:
`sha512sum -c CHECKSUM.txt`

#### Closing note

*This project is far from perfect and you should not rely on it solely in terms
of DOS video game privacy. Not to mention that it is impossible for me alone to
test every single thing, including edge cases; therefore, bugs will occur one
way or another. With having said this, I hope you appreciate the effort.*

#### Licensing
This project is licensed under the GNU GPL 3.0 license. To read it, please
refer to the LICENSE document.


MineTest - Sound block
======================
This is mod for game: MineTest.

Allows to play OGG file.


It easy to set up.

1. Copy OGG file to mesecons_soundblock\sounds folder.
2. Take soundblock (type /give <player> mesecons_soundblock:block on the chat or search block in the inventory).
3. Place soundblock on the ground.
4. Click right button of mouse on soundblock - it opens configuration window.

- Channel - (string) channel's name,
- Hearing distance - (int) max. distance between block and player. If is greater than declared, player don't hear anything from block,
- Volume

5. Next connect soundblock using digilines with e.g. microcontroller.
6. If you want play sound, type in e.g. controller:

digiline_send("channel", "oggfilename")

where:
**channel** - name of earlier declared channel
**oggfilename** - name of ogg file in "mesecons_soundblock\sounds folder" without file extension

If is correct you should listen sound file.


**Depends:**
- digilines
- mesecons

**License:**
CC BY 4.0


# Bubbles
#### Description:
Generates contoured and moving transparent circles of various sizes and randomly placed on the screen. The outline turns red for all circles that are at the mouse location. A mouse click inverts the shade of gray of the selected circles. Finally, pressing the spacebar removes all circles that are on top of others.

#### Installation:
This program requires LÖVE 11.3 framework. Version 11.3 is included here. You can also download the  "AppImage x86_64" at: https://love2d.org/

For Linux nothing needs to be installed, but keep the following in mind:

1. The AppImage needs to be made executable. Right click the file > Properties > Permissions-tab > "Allow executing file as program" checkbox. Alternatively use the terminal:

	```$ chmod +x <filename>```

2. The program folder "bubbles" and the "AppImage x86_64" should be at the same level in the directory structure. In other words folder "X" should contain a subfolder "bubbles" and the file for "AppImage x86_64".

#### Use:
How to run bubbles on Linux:

1. Open Terminal in folder "X"
2. Run bubbles using 

    ```$ ./love-11.3-x86_64.AppImage bubbles```

Note that "love-11.3-x86_64.AppImage" could have a different name if downloaded.

#### Credits:
Based on video 7.3 and onwards from playlist: https://www.youtube.com/playlist?list=PLRqwX-V7Uu6Zy51Q-x9tMWIv9cueOFTFA
Note that these videos are all in JavaScript and not Lua/LÖVE.

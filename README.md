blink
=====

This git repositery show howuse TDD to developpe a IOS MVC application. 

Applciation goal
----------------
The application flash a label periodicly. The "blink" text colors are reversed each periods seconds. 
User can update period with 2 buttons.  

Source architecture
-------------------

| Sources                 | Tests                  |
|:-----------------------:|:----------------------:|
| epiBlinkModel.(h/)      | blinkModelTests.m      |
| Main.storyboard         | blinkVeiwTests.m       |
| epiViewController.(h/m) | blinkControllerTests.m |

And

| mocks classes        |
|:--------------------:|
| mockBlinkModel.(h/m) |

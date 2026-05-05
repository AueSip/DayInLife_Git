# Project Title

Include for each contributer:

Name: Scott

Student Number:  A00033224

Class Group: TU984


# Video

[![YouTube](./Screenshot/Thumbnail.png)](https://youtu.be/k1n3TPAd9bM?si=3BMkchFsWIXRLfMq)

# Screenshots
Titlescreen Image
![Title](./Screenshot/4Monster.jpg)
3D Gameplay Image
![Gameplay](./Screenshot/1Monster.jpg)
2D Gameplay Image
![2DGame](./Screenshot/GameplayMonster2D.jpg)

# Description of the project
A Game for the Creative Coding 2026 Day In A College Students Life Assignment.
A Monster themed game where you must fish out as many monsters from a vending machine in a set amount of time. 
It is a chaotic arcate themed game that simulates a students life choices surrounding their precious Monster Energy!

# Instructions for use
Run the Game from the web browser at [Itch](https://auesip.itch.io/wheres-my-monster_)
Collect As Many Monsters As You Can!
Left Click to Interact
Left Click To Move the coin!
A and D to SHAKE THE MACHINE

# How it works:
Where's My Monster utilises Instantiation, Abstraction and Parameter Based Procedural Generation for its gameplay loops to function.

Core Loop
- Interact with keypad
- Activate 2D Minigame
- Monster falls
- Collect Score + Monster
- 
External Feedback Loops 1
- Monster Gets stuck
- Player must shake A and D Keys to unstuck it
- Monster Falls
- 
External Feedback Loops 2
- Player Requests Specific Monster
- Player Collects Requested Monster
- Background Score Multiplier Increases


# List of classes/assets in the project

| Class/asset | Source | Use |
|-----------|-----------|-----------|
| GlobalVars.gd | Self written | Stores Hi-Score |
| vending_game_manager.gd | Self written | Communicator For All Scripts |
| SoundHandler.gd | Self written | Alters Audio Pitch Randomly |
| 2d_minigame.gd | Self written | Manages 2D Scene |
| end_screen.gd | Self written | Handles The End Screen UI |
| front_piece.gd | Self written | Animations For Opening Slots |
| Minigame_Coin.gd | Self written | Coin Collision Handler |
| monster_can.gd | Self written | Monster Can Initialisation |
| physical_button.gd | Self written | Keypad Button Handler |
| playerScript.gd | Self written | Player Input Handler |
| start_screen.gd | Self written | Handles The Titlescreen UI |
| vending_slot.gd | Self written | Holds and Generates Monster Cans |
| WallScript.gd | Self written | Randomisation Of 2D Scene |

# What I am most proud of in the assignment
- Scott Fowler
Design and Visual Cohesion. The Game is wrapped up nicely as a complete package with a core gameplay loop and two external motivation loops that compliment it.
The visual effects and sound design using custom made sounds lead to a satisfying finish to the game.

# What I learned
Instantiation and Procedural features go hand in hand. With these two tricks utilised I was able to generate random variants of the game on "Start" instead of hard-coding any specific elements.

# Proposal submitted earlier can go here (if there is one):

#Code Examples

##GlobalVars
```GDScript
extends Node

class_name GlobalVars

var score:int
var coins:int
var MonstersCollected:int

func SetCoins(coin:int):
	coins = coin

```

##vending_game_manager
```

```

##SoundHandler
```

```

##2d_minigame
```

```

##end_screen
```

```

##front_piece
```

```

##Minigame_Coin
```

```

##monster_can
```

```

##physical_button
```

```

##playerScript
```

```

##start_screen
```

```

##vending_slot
```

```

##WallScript
```

```


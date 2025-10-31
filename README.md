# Undead-Dawn
[![Athena Award Badge](https://img.shields.io/endpoint?url=https%3A%2F%2Faward.athena.hackclub.com%2Fapi%2Fbadge)](https://award.athena.hackclub.com?utm_source=readme)

This is Undead Dawn: a top-down game where you play as a civilian 10 years into the future. The world in 2035 is overrun with undead creatures after a deadly disease spread rampant through the populations You return to your hometown to find it completely abandoned, with only  the undead left. Kill every one in order to win, or face dire consequences. Good luck!

My inspiration for this project was my love for dystopian fiction, especially those set in zombie apocalypses (such as The Last of Us games, and The Walking Dead Telltale game series). I once again chose the godot game engine as I've become increasingly more familiar with gdscript and the godot editor, enabling me to explore even more avenues and implement game mechanics so as enemy and player attacks, heart health bars, respawning ability, and pick ups. 

I made Undead Dawn firstly by creating my map - this part was very time consuming, especially considering the amount of collision shapes I had to introduce for the different object nodes. I could've made this a more efficient process if the objects were imported as a sprite sheet and I used a tileset with collisions. Then I added my character, created animations for idle, walk and attack, before coding in all of the movement. I learnt how to use an animation player and animation tree, which meant that I could streamline my code, making it more time-efficient. After that, I coded the logic for the zombie, and I used several Area2D shapes and collision shapes for hitboxes and chase areas, so that the zombie could take damage but also detect when the player was in the area, causing it to automatically follow the player.

I struggled with a lot of the coding logic, especially to do with a wave system that I wanted to implement but unfortunately didn't have enough time to do. So that is my next goal! I also learnt the importance of collision layers and masks - very often they were the root of any errors I was getting!

Controls: WASD / arrows
Food can pickups give you a 5 second speed boost!
Bandage pickups give you a heal of 2 hearts!

Happy gaming!

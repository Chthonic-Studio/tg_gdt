# The Guildmaster

## Overview
The Guildmaster is a game developed by Chthonic Studio. This repository contains all the source code and assets for the game.

## Table of Contents
- [Overview](#overview)
- [Project Structure](#project-structure)
- [Character System](#character-system)
- [Leveling System](#leveling-system)
- [AI](#ai)
- [Mission System](#mission-system)
- [Combat System](#combat-system)
- [Inventory System](#inventory-system)
- [Dependencies](#dependencies)
- [Building and Running](#building-and-running)
- [Contributing](#contributing)
- [License](#license)

## Overview

### The Guildmaster Game Design One Pager 

**Platform**: PC

**Target Audience**: Fans of Story Generators (RimWorld, Prison Architect, Kenshi).

**Game Mantra**: Guildmaster Simulator game about managing an adventurers' guild in a medieval fantasy world

**Design Pillars**:
- **Deep Guild Management**: Take control of every facet of your Adventurer's Guild. Recruit promising heroes, equip them for success, and assign them to conquer the Tower's monstrous floors. Strategize their approach, manage resources, and guide them through hundreds of branching events that shape your guild's destiny. But time is limited: can you unite your guild and overcome the Tower's threats before the world's fate is sealed?
- **Strategic Guidance, not Direct Control**: While you can't micromanage adventurers in the field, your leadership is crucial. Set their mentality (aggressive, cautious, etc.), select their equipment, and provide tactical direction. Witness the impact of your choices as your adventurers navigate perilous quests and conquer the Tower floor-by-floor.
- **A Living World**: Experience decades of simulated time, filled with triumphs, tragedies, and hilarious mishaps. The guild, town, and even your adventurers' lives progress realistically, creating a rich tapestry of stories that will stay with you long after the game ends.

**Premise**
In this unique medieval fantasy experience, lead the charge as a seasoned Elf Guildmaster. Though your centuries of experience lie beyond direct combat, your strategic mind remains sharp. Wield a new kind of power – leadership – to manage your Adventurer's Guild. Recruit promising heroes, hone their skills, and guide them on critical missions to conquer the Tower, a monstrous keep threatening the world's very existence. But time is not your friend – can you unite your guild and strategically overcome this looming threat before it's too late?

**Gameplay**
The player controls almost all aspects of the management of the Adventurer’s Guild: Recruitment of new adventurers, management of the Guild’s arks, control over the guild employees’ tasks, deciding the course of action over hundreds of possible events, guidance for the adventurers, management of the quests and the teams that take them, and command over the strategic efforts to conquer the Tower, a massive structure that threatens to end the world if not conquered before 500 in-game years passes. 

You can send adventurers on automatic missions, but you can also decide to guide them during important quests or Tower floors. During a mission, you can’t give direct orders to the adventurers, but you can assign them a mentality, select their gear, and provide general direction over where to go. 

The main goal of the game is to build a Guild strong enough to take on the Tower, one floor at a time, while also experiencing dozens of years of simulated history, giving space to hilarious stories and some total tearjerkers. The AI of the adventurers, guild employees, and even the citizens of the town have been implemented as realistic as possible, in a way that allows for a high degree of autonomy. 

**Features**
- Simulator-style gameplay
- Autobattler-style missions where you can only direct your units with general orders
- A complex AI that simulates real behavior over centuries of game history
- A fun but deep storytelling behind the backstory of the world
- Hundreds of events to keep the player engaged during the course of gameplay


## Project Structure
The project is organized into the following directories:

## Character System
The character system handles all aspects of character creation, management, and behavior in the game.

### Main Components


## Leveling System
The leveling system manages the experience points and leveling up mechanics for characters. 

### Main Components


## AI
The AI of the characters, npcs and enemies. We use an Utility AI method for all AIs. There are 2 main categories of AI: Town AI and Combat AI. 

Town AI refers to all the AI of characters and NPCs while on town, where they simulate real-life behavior of exploring, talking with each other, studying, practicing, even commiting murder. Each action (Ex: Exploring, Go to Tavern, Spar, etc.) is created in its own separate file, and those documents are then referenced from the CharacterTownAI script. 

Combat AI refers to the AI of character while on a mission, and the AI of monsters that they encounter. 

### Main Components


#### Character AI
Characters have a separate AI system while in town, to handle behavior while out of missions. We use a Utility AI system in the game.

##### Components


## Mission System

In development. We'll use a system where the player receives missions or quests and is able to select a group of character to send them into the mission. Some of these missions are autocompleted in the background, while others transport the player into a different map, where they can select the strategy the characters will follow. 

## Combat System
In development. 

We'll use a combat system similar to Clash Royale/Warcraft Rumble, where the player is able to dictate the general direction and strategy of characters, but the end decisions are done by the AI. Example: The player will be able to set a character with a Healer stance, and set them to staying in the back of the group, but the Character Combat AI will be the one determining in the end of the character heals or attacks.

## Inventory System
There are multiple types of inventories: Each character has an inventory with capacity of up to 10 items, each NPC holds up to 5 items, each store has an inventory of items that are renewed after a few in-game days, and also of items that can be from character that sold their items to that store, items that the store brought from the Guild, or that the store owner gained from other source and decided to put it up for sale. 

### Components 


## Dependencies


## Building and Running


## Contributing


## License 

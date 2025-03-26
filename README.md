# AntiCheat - Kill Exploit Detection & Kick

## Description
This script monitors player activity on the server and detects "kill exploits," where a player achieves more than 3 kills within 0.5 seconds. If this is detected, the player is automatically kicked from the server.

## Features
- **Kill Exploit Detection**: The script checks if a player has more than 3 kills within 0.5 seconds.
- **Automatic Kick**: Upon detecting a kill exploit, the player is immediately kicked with the message ("Kill Exploit: More than 3 kills in 0.5 seconds").
- **Admin Log**: A console log is generated to notify which player was kicked and the reason why.

## Installation
1. Download the script and place it into your server's `resources` folder.
2. Make sure to start the script in your server's `server.cfg` file by adding the line `start <script_name>`.
3. Ensure all relevant events and functions are properly loaded.

## Usage
- The script is automatically activated when installed correctly on your server.
- Players who violate the kill exploit rules will be automatically kicked from the server.

## Example Log Entry
When a player is kicked, the following log entry will appear in the console:

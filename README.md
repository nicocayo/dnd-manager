# D&D Campaign Manager

A comprehensive web application to help Dungeon Masters manage their D&D campaigns.

## Features
- Campaign management with multiple worlds
- Character tracking (PCs, NPCs, enemies)
- Session logging and notes
- Combat encounter management
- Location and world building tools

## Setup
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dnd-campaign-manager.git
cd dnd-campaign-manager

# Install dependencies
bundle install

# Setup database
rails db:create
rails db:migrate

# Start server
rails server

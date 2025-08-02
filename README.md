# Synesthesia Grid

A fully functional interactive grid for synesthesia-type associations between various concepts and sensory descriptors.

## 🙏 Credits

**Original Project:** [Kaden Taylor](https://github.com/kadenjtaylor) - whose Elm hackathon prototype inspired this AI collaboration challenge.

## 🚀 The Story Behind This Project

This project started as a **quick AI collaboration challenge** - taking a friend's Elm hackathon prototype and turning it into a fully functional web application in just **20 minutes** using AI assistance.

**The Challenge:** Transform a static synesthesia data collection tool into an interactive, user-friendly application with real-time editing, dynamic grid management, and professional documentation.

**The Result:** A complete, working application that demonstrates the power of human creativity + AI assistance for rapid prototyping and problem-solving.

## Features

✅ **Interactive Cell Editing**: Click any cell to edit intensity values (0-9)
✅ **Add/Remove Rows**: Add new concepts or remove existing ones
✅ **Add/Remove Columns**: Add new sensory descriptors or remove existing ones
✅ **Color-coded Intensity**: Visual color gradient from red (0) to green (9)
✅ **Real-time Updates**: Changes are applied immediately
✅ **User-friendly Interface**: Clear buttons and input fields

## How to Use

1. **Edit Cells**: Click on any cell in the grid to edit its intensity value
2. **Add Rows**: Enter a new concept name and click "Add Row"
3. **Add Columns**: Enter a new sensory descriptor and click "Add Column"
4. **Delete Rows/Columns**: Click the "×" button next to any row or column header
5. **Intensity Values**: Use 0-9 scale where:
   - 0 = Red (no association)
   - 5 = Yellow (moderate association)
   - 9 = Green (strong association)

## Data Model

A 3D grid where:
- **Rows** are concepts/nouns (e.g., "the sun", "coffee", "love")
- **Columns** are sensory descriptors/adjectives (e.g., "bright", "spicy", "bitter")
- **Cell values** represent intensity ratings (0-9) answering questions like "How [spicy] is [the sun]?"

## Example

```
"How [spicy] is [the sun]? => 5"
"How [bright] is [the sun]? => 8"
"How [bitter] is [coffee]? => 7"
```

## Technical Details

- **Language**: Elm (functional programming)
- **Architecture**: Model-View-Update pattern
- **Styling**: Inline CSS with color-coded intensity visualization
- **Dependencies**: elm/browser, elm/core, elm/html, elm/json

## Running the Application

1. Make sure you have Node.js installed
2. Install Elm: `npm install -g @elm/compiler`
3. Compile: `npx elm make src/Main.elm --output=index.html`
4. Open `index.html` in your browser

## Future Enhancements

- [ ] Local storage for data persistence
- [ ] Export/import functionality
- [ ] Multiple user support
- [ ] Statistical analysis
- [ ] Advanced filtering and search

## Why This Project?

Originally a hackathon project idea, this tool serves multiple purposes:
- **Data Science Practice**: Collecting and analyzing synesthetic associations
- **AI Training**: Helping robots write better metaphors
- **Research**: Studying cross-modal associations in human cognition
- **Education**: Teaching about synesthesia and sensory associations

## The AI Collaboration Experience

This project demonstrates how AI can accelerate development:
- **20-minute transformation** from prototype to production-ready app
- **Rapid problem-solving** with technical challenges
- **Immediate documentation** and user guides
- **Professional polish** with proper error handling and UX

The result is a testament to the power of human creativity combined with AI assistance for rapid prototyping and development.

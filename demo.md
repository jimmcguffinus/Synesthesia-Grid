# Synesthesia Grid Demo

## Getting Started

1. **Open the Application**: Open `index.html` in your web browser
2. **Explore the Interface**: You'll see a grid with concepts (rows) and sensory descriptors (columns)

## Interactive Features Demo

### 1. Edit Cell Values
- **Click any cell** in the grid to edit its intensity value
- **Enter a number** from 0-9 and press Enter or click outside to save
- **Watch the color change** - red (0) to green (9) based on intensity

### 2. Add New Concepts
- **Type a concept name** in the "New Row" field (e.g., "chocolate", "music", "anger")
- **Click "Add Row"** to add it to the grid
- **Start filling in values** for the new concept

### 3. Add New Sensory Descriptors
- **Type a descriptor** in the "New Column" field (e.g., "warm", "sharp", "sweet")
- **Click "Add Column"** to add it to the grid
- **Fill in values** for existing concepts with the new descriptor

### 4. Delete Rows/Columns
- **Click the "×" button** next to any row or column header to delete it
- **Confirm the deletion** - the row/column and all its data will be removed

## Example Data Entry

Try entering these associations to see how the system works:

### For "the sun":
- **bright**: 8 (strong association)
- **spicy**: 5 (moderate association)
- **warm**: 9 (very strong association)

### For "coffee":
- **bitter**: 7 (strong association)
- **warm**: 6 (moderate-strong association)
- **spicy**: 3 (weak association)

### For "music":
- **loud**: 6 (moderate-strong association)
- **smooth**: 4 (moderate association)
- **bright**: 2 (weak association)

## Color Coding Guide

- **Red (#FF0000)**: 0 - No association
- **Orange (#FF4600)**: 1 - Very weak association
- **Yellow-Orange (#FF8800)**: 2 - Weak association
- **Yellow (#FFAD00)**: 3 - Weak-moderate association
- **Yellow-Green (#FFC500)**: 4 - Moderate association
- **Yellow (#EEE600)**: 5 - Moderate association
- **Light Green (#D5E600)**: 6 - Moderate-strong association
- **Green (#CFE600)**: 7 - Strong association
- **Bright Green (#8CE600)**: 8 - Very strong association
- **Dark Green (#5EE600)**: 9 - Extremely strong association

## Tips for Best Results

1. **Be consistent** with your intensity ratings
2. **Think intuitively** - go with your first impression
3. **Consider cultural associations** (e.g., red = hot, blue = cold)
4. **Don't overthink** - synesthesia is often subconscious
5. **Add your own concepts** that interest you

## Use Cases

- **Research**: Study cross-modal associations in cognition
- **Education**: Teach about synesthesia and sensory processing
- **Data Collection**: Gather data for AI metaphor generation
- **Personal Exploration**: Discover your own synesthetic tendencies
- **Artistic Inspiration**: Use associations for creative projects

## Technical Notes

- All data is stored in memory (refreshing the page will reset data)
- The application uses Elm's functional programming paradigm
- Color coding provides immediate visual feedback
- The interface is responsive and user-friendly 
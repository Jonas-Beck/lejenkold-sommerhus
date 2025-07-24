# Content Management Guide

## 📄 **Overview**

All website content is managed through a single JSON file, making updates simple and non-technical. No code changes required for most content updates.

## 🗂️ **Content Structure**

### **Main Content File**

**Location**: `src/data/content.json`

This file controls all dynamic content on your summer house website:

```json
{
  "property": {
    /* Property information */
  },
  "contact": {
    /* Contact details */
  },
  "description": {
    /* Property descriptions */
  },
  "features": {
    /* Facilities and equipment */
  },
  "pricing": {
    /* Seasonal pricing */
  },
  "images": {
    /* Hero image and gallery */
  }
}
```

## 🏠 **Property Information**

```json
"property": {
  "title": "Diernæs Strandby 98",
  "subtitle": "Lille, privat og hyggeligt sommerhus ved Diernæs bugt",
  "address": "Diernæs Strandby 98, 6100 Haderslev",
  "location": "Diernæs bugt, 6100 Haderslev"
}
```

**When to update:**

- Change property name or description
- Update address information

## 📞 **Contact Information**

```json
"contact": {
  "email": "lejenkold@gmail.com",
  "phone": "53 80 58 36",
  "phoneFormatted": "53 80 58 36"
}
```

**When to update:**

- New email address
- Phone number changes
- Format phone differently for display

## 📝 **Descriptions**

```json
"description": {
  "main": "Main property description...",
  "highlight": "Special highlight (e.g., beach distance)",
  "annex": "Information about the annex..."
}
```

**Tips:**

- Keep main description concise but informative
- Use highlight for key selling points
- Update seasonally if needed

## 🏡 **Features & Equipment**

```json
"features": {
  "facilities": [
    "Rummelig udestue med sofa og spisebord",
    "Soveværelse med dobbeltseng",
    "Add new items here..."
  ],
  "equipment": [
    "50/50 bredbånd",
    "Varmepumpe/aircon",
    "Add new equipment here..."
  ]
}
```

**Easy to maintain:**

- Add new items to arrays
- Remove outdated equipment
- Reorder by importance

## 💰 **Pricing Management**

```json
"pricing": {
  "seasons": [
    {
      "name": "Høj Sæson",
      "period": "Uge 26-32",
      "price": "3.500 Kr.",
      "colorClass": "text-green-600"
    }
  ],
  "extras": {
    "annex": {
      "name": "Anneks",
      "price": "+1.000 Kr. pr. uge"
    }
  }
}
```

**Common updates:**

- **Price changes**: Update the `price` field
- **Season periods**: Modify `period` text
- **New extras**: Add to `extras` object
- **Colors**: Change `colorClass` for different visual emphasis

### **Color Options:**

- `text-green-600` - Green (high season)
- `text-orange-600` - Orange (medium season)
- `text-blue-600` - Blue (low season)
- `text-red-600` - Red (special offers)

## 🖼️ **Image Management**

### **Hero Image**

```json
"hero": {
  "src": "/images/front.jpg",
  "alt": "Diernæs Strandby 98 - Sommerhus facade"
}
```

### **Gallery Images**

```json
"gallery": [
  {
    "src": "/images/outside.jpg",
    "thumbnail": "/images/thumbs/outside-thumb.jpg",
    "alt": "Sommerhuset set udefra",
    "category": "Udvendigt"
  }
]
```

**Categories:**

- `Udvendigt` - Exterior views, garden, parking
- `Indvendigt` - Interior rooms, living spaces
- `Anneks` - Separate sleeping area
- `Omgivelser` - Beach, nature, local area

## 🔄 **How to Make Updates**

### **1. Quick Price Update**

```json
// Change from:
"price": "3.000 Kr."
// To:
"price": "3.200 Kr."
```

### **2. Add New Equipment**

```json
"equipment": [
  "50/50 bredbånd",
  "Varmepumpe/aircon",
  "Ny mikrobølgeovn"  // <- Add new item
]
```

### **3. Update Contact Info**

```json
"contact": {
  "email": "new-email@lejenkold.dk",  // <- Update
  "phone": "87 65 43 21",             // <- Update
  "phoneFormatted": "87 65 43 21"     // <- Update
}
```

### **4. Add New Gallery Image**

```json
{
  "src": "/images/new-room.jpg",
  "thumbnail": "/images/thumbs/new-room-thumb.jpg",
  "alt": "New room description",
  "category": "Indvendigt"
}
```

## ⚡ **Benefits of This System**

1. **Single Source of Truth** - All content in one place
2. **No Code Knowledge Needed** - Edit JSON directly
3. **Consistent Updates** - Same data used everywhere
4. **Version Control** - Track all content changes
5. **Easy Seasonal Updates** - Update prices, descriptions quickly

## 🚨 **Important Notes**

- **Always backup** before making changes
- **Test changes** on development site first
- **JSON syntax** must be correct (commas, quotes, brackets)
- **Image paths** must match actual files in `public/images/`

## 📅 **Seasonal Maintenance Tasks**

**Every Season:**

- [ ] Update pricing for new season
- [ ] Review and update property description
- [ ] Add any new photos from recent improvements
- [ ] Update availability calendar (if implemented)

**Annually:**

- [ ] Review all equipment/facilities lists
- [ ] Update contact information if changed
- [ ] Refresh hero image if needed
- [ ] Check all image links work correctly

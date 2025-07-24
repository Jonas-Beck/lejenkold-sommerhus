# Image Setup Guide

## Adding Images to Your Summer House Site

### Hero Image (House Front)

Replace the placeholder at `public/images/hero-house-front.jpg` with a high-quality photo of your house front.

- **Recommended size**: 1200x600px or larger
- **Format**: JPG or WebP
- **Shows**: Main exterior view of the summer house

### Gallery Images

Add your photos to the `public/images/` directory and update the `galleryImages` array in `src/pages/index.astro`.

**Recommended photos to include:**

1. **Exterior views** - Different angles of the house and surroundings
2. **Living room** - Showing the sofa bed and seating area
3. **Kitchen** - With appliances and dining area
4. **Bedroom** - The main bedroom with double bed
5. **Bathroom** - Toilet and shower facilities
6. **Outdoor area** - Patio/deck with outdoor furniture
7. **Annex** - If available, the separate sleeping area
8. **Beach/surroundings** - Views of the nearby beach and area

### Image Optimization Tips

- **Size**: Keep images under 2MB for web performance
- **Dimensions**: 1200x800px or similar 3:2 aspect ratio works well
- **Quality**: Use 80-90% JPEG quality for good balance of size/quality
- **Thumbnails**: Optionally create smaller versions (300x200px) for faster loading

### Updating the Gallery

Edit the `galleryImages` array in `src/pages/index.astro`:

```typescript
const galleryImages = [
  {
    src: "/images/your-photo.jpg",
    alt: "Description in Danish",
  },
  // ... more images
];
```

### Future Enhancement

Consider using the separate `src/data/images.ts` file for better organization when you have many images.

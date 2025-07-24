# Image Management Guide

## 📸 **Overview**

This guide covers all aspects of managing images for your summer house website, from uploading photos to creating thumbnails and optimizing performance.

## 🗂️ **Image Structure**

### **Directory Layout**

```
public/images/
├── front.jpg                    # Hero image
├── outside.jpg                  # Main exterior view
├── outside1.jpg, outside2.jpg   # Additional exterior views
├── terrace1.jpg, terrace2.jpg   # Terrace areas
├── livingroom.jpg, kitchen.jpg  # Interior rooms
├── annex.jpg, annex1.jpg       # Annex area
├── beach.jpg                   # Surroundings
└── thumbs/                     # Thumbnail directory
    ├── outside-thumb.jpg       # 300x300px thumbnails
    ├── livingroom-thumb.jpg
    └── ...
```

## 🖼️ **Image Types**

### **1. Hero Image**

**Purpose**: Main header image shown at top of page
**Current**: `front.jpg` (1280x960px)
**Recommended**:

- **Aspect ratio**: 16:9 or 3:2 (more web-friendly)
- **Size**: 1280x720px (16:9) or 1280x853px (3:2)
- **Format**: JPG with 80-90% quality
- **File size**: Under 500KB

### **2. Gallery Images**

**Purpose**: Showcase different areas of the property
**Current**: 19 images across 4 categories
**Recommended**:

- **Size**: 1200x800px maximum
- **Format**: JPG (80-90% quality) or WebP
- **File size**: Under 1MB each

### **3. Thumbnails**

**Purpose**: Fast-loading preview images for gallery grid
**Size**: 300x300px (square)
**Format**: JPG with 70-80% quality
**File size**: Under 100KB each

## 📋 **Image Categories**

### **Udvendigt (Exterior)**

- House exterior from different angles
- Garden and outdoor areas
- Parking space
- Terrace and patio areas

**Current images**: `outside.jpg`, `outside1-3.jpg`, `terrace1-3.jpg`

### **Indvendigt (Interior)**

- Living room with sofa bed
- Kitchen and dining area
- Bedroom
- Bathroom
- Outdoor room/conservatory

**Current images**: `livingroom.jpg`, `kitchen.jpg`, `bedroom1.jpg`, `bathroom.jpg`, `udestue.jpg`

### **Anneks (Annex)**

- Separate sleeping area
- Annex bedroom details

**Current images**: `annex.jpg`, `annex1.jpg`

### **Omgivelser (Surroundings)**

- Beach and nature views
- Local area attractions
- Walking paths to beach

**Current images**: `beach.jpg`

## 🔧 **Thumbnail Generation**

### **Automatic Method**

Use the provided script to generate thumbnails for all images:

```bash
# Run the dynamic thumbnail generator
./scripts/create-thumbnails.sh
```

**Features:**

- ✅ Processes ALL images in `public/images/`
- ✅ Skips existing thumbnails
- ✅ Supports multiple formats (JPG, PNG, WebP)
- ✅ Works with ImageMagick or macOS sips
- ✅ Shows detailed progress and statistics

### **Manual Method**

If you prefer manual control or don't have image processing tools:

1. **Resize each image** to 300x300px (square crop)
2. **Save with naming convention**: `imagename-thumb.jpg`
3. **Place in**: `public/images/thumbs/`

### **Tools for Manual Creation**

- **Online**: TinyPNG, Squoosh, Canva
- **macOS**: Preview, Photos
- **Windows**: Paint, Photos
- **Professional**: Photoshop, GIMP

## 📝 **Adding New Images**

### **Step 1: Upload Image**

Place your photo in `public/images/`:

```
public/images/new-bedroom.jpg
```

### **Step 2: Create Thumbnail**

Run thumbnail script or create manually:

```
public/images/thumbs/new-bedroom-thumb.jpg
```

### **Step 3: Update Content**

Add entry to `src/data/content.json`:

```json
{
  "src": "/images/new-bedroom.jpg",
  "thumbnail": "/images/thumbs/new-bedroom-thumb.jpg",
  "alt": "Second bedroom with twin beds",
  "category": "Indvendigt"
}
```

## 🎯 **Image Optimization Tips**

### **Before Upload**

- **Resize** to appropriate dimensions
- **Compress** to reduce file size
- **Rename** with descriptive names
- **Check orientation** (landscape preferred)

### **File Naming Convention**

- **Descriptive names**: `kitchen.jpg` not `IMG_1234.jpg`
- **No spaces**: Use hyphens or underscores
- **Numbers for variations**: `living-room1.jpg`, `living-room2.jpg`
- **Consistent format**: All lowercase recommended

### **Quality Guidelines**

- **Hero image**: 80-90% quality, under 500KB
- **Gallery images**: 80-85% quality, under 1MB
- **Thumbnails**: 70-80% quality, under 100KB

## 📱 **Responsive Behavior**

### **Gallery Grid**

- **Mobile**: 2 columns
- **Small tablet**: 3 columns
- **Desktop**: 4 columns
- **Images per page**: 12 (displays as 3 rows × 4 columns)

### **Hero Image**

- **Adaptive height**: Based on image aspect ratio
- **Max height**: 20rem mobile, 28rem desktop
- **Full width**: Always spans container width

## 🔄 **Maintenance Tasks**

### **Regular Updates**

- [ ] **Add seasonal photos** (different weather, times of day)
- [ ] **Update with improvements** (new furniture, renovations)
- [ ] **Replace poor quality images** with better shots
- [ ] **Add missing angles** (currently missing some interior details)

### **Performance Monitoring**

- [ ] **Check file sizes** - Keep gallery images under 1MB
- [ ] **Test loading speed** - Especially on mobile
- [ ] **Verify thumbnail generation** - All gallery images should have thumbs
- [ ] **Update alt text** - Keep descriptions current and descriptive

## 🚨 **Troubleshooting**

### **Image Not Displaying**

1. **Check file path** in content.json
2. **Verify file exists** in public/images/
3. **Check file extension** matches JSON entry
4. **Clear browser cache** and refresh

### **Thumbnail Not Loading**

1. **Run thumbnail script**: `./scripts/create-thumbnails.sh`
2. **Check thumbs directory**: Should have matching thumbnail
3. **Verify naming**: Must end with `-thumb.jpg`
4. **Manual creation**: If script fails

### **Poor Image Quality**

1. **Check original size** - May be too small
2. **Adjust compression** - Increase quality percentage
3. **Use better source** - Retake photo if needed
4. **Consider format** - WebP for better compression

## 📊 **Current Status**

- **Total images**: 21 (1 hero + 19 gallery + 1 bedroom.jpeg)
- **Thumbnails**: Auto-generated for all gallery images
- **Categories**: 4 (Udvendigt, Indvendigt, Anneks, Omgivelser)
- **Performance**: Optimized with pagination and lazy loading

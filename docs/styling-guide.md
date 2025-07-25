# Styling & Design System

## 🎨 **Overview**

Your summer house website uses a modern design system built with Tailwind CSS and custom components. This guide explains the styling approach and how to make design customizations.

## 🏗️ **Architecture**

### **Technology Stack**

- **Framework**: Astro 5.x with React integration
- **Styling**: Tailwind CSS 4.x
- **Components**: Custom Astro components + React components
- **Design System**: Custom component system with CSS variables
- **Icons**: Lucide React icons

### **File Structure**

```
src/
├── styles/
│   └── global.css              # Main stylesheet with design tokens
├── components/
│   ├── ui/                     # Base UI components
│   │   ├── Card.astro
│   │   ├── CardContent.astro
│   │   └── CardHeader.astro
│   └── [business-components]   # Feature-specific components
└── layouts/
    └── main.astro              # Base layout
```

## 🎨 **Design System**

### **Color Palette**

Defined in `src/styles/global.css` using CSS custom properties:

#### **Light Theme**

```css
:root {
  --background: oklch(1 0 0); /* Pure white */
  --foreground: oklch(0.145 0 0); /* Dark text */
  --primary: oklch(0.205 0 0); /* Dark primary */
  --secondary: oklch(0.97 0 0); /* Light secondary */
  --muted: oklch(0.97 0 0); /* Subtle backgrounds */
  --border: oklch(0.922 0 0); /* Light borders */
  --card: oklch(1 0 0); /* Card backgrounds */
}
```

#### **Dark Theme**

```css
.dark {
  --background: oklch(0.145 0 0); /* Dark background */
  --foreground: oklch(0.985 0 0); /* Light text */
  --primary: oklch(0.922 0 0); /* Light primary */
  --card: oklch(0.205 0 0); /* Dark cards */
}
```

### **Typography Scale**

Based on Tailwind's type scale with semantic usage:

```css
/* Headers */
h1: text-4xl font-bold          /* Main page title */
h2: text-2xl font-semibold      /* Section headers */
h3: text-xl font-semibold       /* Subsection headers */
h4: text-lg font-semibold       /* Component headers */

/* Body text */
p: text-base                    /* Regular paragraph text */
small: text-sm                  /* Secondary information */
```

### **Spacing System**

Consistent spacing using Tailwind's scale:

```css
/* Common spacing patterns */
mb-4     /* 1rem - Small element spacing */
mb-6     /* 1.5rem - Section element spacing */
mb-8     /* 2rem - Large section spacing */
mb-12    /* 3rem - Major section spacing */

/* Padding patterns */
p-4      /* 1rem - Small components */
p-6      /* 1.5rem - Cards and containers */
py-8     /* 2rem - Large containers */
```

## 🧩 **Component System**

### **Base UI Components**

#### **Card System**

```astro
<!-- Card.astro - Base card container -->
<div class="bg-card text-card-foreground rounded-lg border border-border shadow-sm">
  <slot />
</div>

<!-- CardContent.astro - Card content with padding -->
<div class="p-6">
  <slot />
</div>
```

**Usage:**

```astro
<Card>
  <CardContent>
    <h3>Card Title</h3>
    <p>Card content here...</p>
  </CardContent>
</Card>
```

### **Business Components**

#### **Responsive Patterns**

All components follow mobile-first responsive design:

```css
/* Gallery grid example */
grid-cols-2           /* Mobile: 2 columns */
sm:grid-cols-3        /* Small tablet: 3 columns */
md:grid-cols-4        /* Desktop: 4 columns */
```

#### **Interactive States**

Consistent hover and focus states:

```css
/* Button/link hover states */
hover:bg-muted/80           /* Subtle background change */
hover:underline             /* Link underlines */
transition-colors           /* Smooth transitions */

/* Focus states */
focus:outline-none
focus:ring-2 focus:ring-primary
```

## 📱 **Responsive Design**

### **Breakpoint Strategy**

```css
/* Tailwind breakpoints used */
sm: 640px     /* Small tablets */
md: 768px     /* Tablets */
lg: 1024px    /* Desktop */
xl: 1280px    /* Large desktop */
```

### **Layout Patterns**

#### **Mobile Layout** (< lg)

- Single column design
- Contact info after pricing section
- Simplified navigation
- Stacked components

#### **Desktop Layout** (lg+)

- Two-column layout with sidebar
- Sticky contact sidebar
- More compact information display
- Enhanced navigation

### **Component Responsive Behavior**

#### **Hero Image**

```css
/* Mobile */
max-h-[20rem]        /* 320px max height */

/* Desktop */
md:max-h-[28rem]     /* 448px max height */
```

#### **Gallery Grid**

```css
/* Responsive columns */
grid-cols-2          /* Mobile: 2 cols */
sm:grid-cols-3       /* Tablet: 3 cols */
md:grid-cols-4       /* Desktop: 4 cols */
```

## 🎨 **Customization Guide**

### **Changing Colors**

#### **Method 1: CSS Variables** (Recommended)

Update `src/styles/global.css`:

```css
:root {
  /* Change primary color to blue */
  --primary: oklch(0.5 0.2 240);

  /* Change background to warm white */
  --background: oklch(0.98 0.02 80);
}
```

#### **Method 2: Tailwind Classes**

For specific components, update class names:

```astro
<!-- Change card background -->
<div class="bg-blue-50 p-6 rounded-lg">
  <!-- Content -->
</div>
```

### **Typography Customization**

#### **Font Changes**

Update `src/styles/global.css`:

```css
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap");

body {
  font-family: "Inter", sans-serif;
}
```

#### **Size Adjustments**

Modify component classes:

```astro
<!-- Larger section headers -->
<h2 class="text-3xl font-bold mb-6">Section Title</h2>

<!-- Smaller body text -->
<p class="text-sm leading-relaxed">Content text</p>
```

### **Spacing Adjustments**

#### **Tighter Layout**

```astro
<!-- Reduce section spacing -->
<Section class="mb-6">  <!-- Instead of mb-8 -->
```

#### **More Spacious Layout**

```astro
<!-- Increase container padding -->
<div class="container mx-auto px-6 py-12 max-w-7xl">  <!-- Instead of px-4 py-8 -->
```

## 🎯 **Design Patterns**

### **Card-Based Layout**

Most content is organized in cards for visual hierarchy:

```astro
<Card>
  <CardContent>
    <SectionHeader>Title</SectionHeader>
    <p>Content goes here...</p>
  </CardContent>
</Card>
```

### **Information Density**

- **High density**: Sidebar on desktop (quick info, contact)
- **Medium density**: Main content area
- **Low density**: Hero section (focus on image)

### **Visual Hierarchy**

1. **Hero image** - Primary attention
2. **Section headers** - Content navigation
3. **Card containers** - Information grouping
4. **Body text** - Detailed information

## 🔧 **Performance Considerations**

### **CSS Optimization**

- **Tailwind purging**: Unused styles automatically removed
- **CSS variables**: Efficient theme switching
- **Component reuse**: Consistent styling with minimal code

### **Loading Strategy**

- **Critical CSS**: Inlined in HTML head
- **Font loading**: Optimized with `font-display: swap`
- **Animation**: Minimal, performance-focused transitions

## 🚨 **Common Customizations**

### **Seasonal Theme Changes**

Update CSS variables for different seasons:

```css
/* Summer theme */
:root {
  --primary: oklch(0.6 0.15 180); /* Ocean blue */
  --accent: oklch(0.8 0.1 60); /* Warm sand */
}

/* Winter theme */
:root {
  --primary: oklch(0.4 0.1 220); /* Cool blue */
  --accent: oklch(0.9 0.05 0); /* Snow white */
}
```

### **Branding Updates**

- **Logo**: Add to header in `main.astro`
- **Colors**: Update CSS variables to match brand
- **Typography**: Import brand fonts

### **Layout Modifications**

- **Sidebar width**: Adjust `lg:grid-cols-3` ratio
- **Container width**: Change `max-w-7xl` in layout
- **Component spacing**: Update margin/padding classes

## 📋 **Maintenance Tasks**

### **Regular Reviews**

- [ ] **Check responsive behavior** on different devices
- [ ] **Verify color contrast** for accessibility
- [ ] **Test dark mode** if implemented
- [ ] **Update seasonal colors** as needed

### **Performance Monitoring**

- [ ] **CSS bundle size** - Keep stylesheets optimized
- [ ] **Font loading** - Ensure fast text rendering
- [ ] **Animation performance** - Smooth on all devices

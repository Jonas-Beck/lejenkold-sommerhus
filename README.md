# Lejenkold Sommerhus Website

## 📍 Project Overview

Modern summer house rental website for **Diernæs Strandby 98** in Haderslev, Denmark. Built with Astro, React, and Tailwind CSS for optimal performance and user experience.

## 🏗️ Tech Stack

- **Framework**: Astro 5.x with React integration
- **Styling**: Tailwind CSS with custom components
- **Image Gallery**: React lightbox with pagination
- **Maps**: Embedded Google Maps
- **TypeScript**: Full type safety

## 📱 Key Features

- **Responsive Design**: Mobile-first with desktop sidebar
- **Image Gallery**: Handles 28+ images with categories and pagination
- **Contact Integration**: Email, phone, address with embedded map
- **Performance Optimized**: Lazy loading, efficient pagination
- **Component-Based**: Reusable Astro and React components

## 🎯 Content Structure

- Hero image and property title
- Property description with features
- Seasonal pricing (High/Medium/Low season)
- Contact information and location map
- Categorized image gallery (Interior/Exterior/Surroundings)

## 🚀 Quick Start

```bash
npm install
npm run dev
```

## 📁 Key Components

- `ContactSidebar.astro` - Desktop sticky sidebar
- `ContactCard.astro` - Mobile contact info
- `ImageGallery.tsx` - React gallery with lightbox
- `GoogleMaps.astro` - Embedded location map
- `PriceCard.astro` - Seasonal pricing cards

## 📸 Images

Replace placeholders in `public/images/` with actual property photos. Update `galleryImages` array in `src/pages/index.astro` with real image paths and categories.

## 🎨 Layout

- **Mobile**: Single column, contact after pricing
- **Desktop**: Two-column with sticky sidebar
- **Content Flow**: Description → Pricing → Contact → Gallery → Location

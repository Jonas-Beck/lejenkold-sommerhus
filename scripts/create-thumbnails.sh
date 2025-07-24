#!/bin/bash

# Dynamic Thumbnail Generation Script
# Automatically creates 300x300px thumbnails for ALL images in public/images/

echo "🖼️  Dynamic Thumbnail Generator"
echo "==============================="

# Create thumbs directory if it doesn't exist
mkdir -p public/images/thumbs

# Counter for statistics
total_images=0
created_thumbnails=0
skipped_thumbnails=0

# Find all image files in public/images/ (excluding subdirectories)
echo "📂 Scanning public/images/ for images..."

# Check if ImageMagick is installed
if command -v convert &>/dev/null; then
	echo "✅ Using ImageMagick for thumbnail generation"
	TOOL="imagemagick"
elif command -v sips &>/dev/null; then
	echo "✅ Using macOS sips for thumbnail generation"
	TOOL="sips"
else
	echo "❌ No image processing tool found"
	echo "📋 Install options:"
	echo "   • ImageMagick: brew install imagemagick"
	echo "   • Or use online tools to create 300x300px thumbnails manually"
	exit 1
fi

echo ""
echo "🔄 Processing images..."

# Process all common image formats
for image_path in public/images/*.{jpg,jpeg,JPG,JPEG,png,PNG,webp,WEBP}; do
	# Check if file exists (handles case where no files match pattern)
	if [ ! -f "$image_path" ]; then
		continue
	fi

	# Extract filename without path and extension
	filename=$(basename "$image_path")
	name_only="${filename%.*}"

	# Skip if it's already a thumbnail
	if [[ "$name_only" == *"-thumb" ]]; then
		continue
	fi

	# Define thumbnail path
	thumb_path="public/images/thumbs/${name_only}-thumb.jpg"

	total_images=$((total_images + 1))

	# Check if thumbnail already exists
	if [ -f "$thumb_path" ]; then
		echo "⏭️  Skipping $filename (thumbnail exists)"
		skipped_thumbnails=$((skipped_thumbnails + 1))
		continue
	fi

	# Create thumbnail based on available tool
	if [ "$TOOL" = "imagemagick" ]; then
		# Create 300x300 square thumbnail with smart cropping
		convert "$image_path" -resize 300x300^ -gravity center -extent 300x300 "$thumb_path" 2>/dev/null
	elif [ "$TOOL" = "sips" ]; then
		# Create 300x300 thumbnail (sips will maintain aspect ratio)
		sips -Z 300 "$image_path" --out "$thumb_path" &>/dev/null
	fi

	if [ $? -eq 0 ]; then
		echo "✅ Created thumbnail for $filename"
		created_thumbnails=$((created_thumbnails + 1))
	else
		echo "❌ Failed to create thumbnail for $filename"
	fi
done

echo ""
echo "📊 Summary:"
echo "   • Total images found: $total_images"
echo "   • New thumbnails created: $created_thumbnails"
echo "   • Skipped (already exist): $skipped_thumbnails"

if [ $created_thumbnails -gt 0 ]; then
	echo ""
	echo "🎉 Thumbnail generation complete!"
	echo "📁 Thumbnails saved to: public/images/thumbs/"
	echo "💡 Remember to update src/data/content.json with thumbnail paths"
else
	echo ""
	echo "ℹ️  No new thumbnails were created"
fi

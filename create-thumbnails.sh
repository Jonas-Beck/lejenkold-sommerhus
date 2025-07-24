#!/bin/bash

# Thumbnail Generation Script for Summer House Images
# This script will help you create 300x300px thumbnails

echo "Creating thumbnails for summer house gallery..."

# List of all gallery images
images=(
	"outside.jpg"
	"outside1.jpg"
	"outside2.jpg"
	"outside3.jpg"
	"terrace1.jpg"
	"terrace2.jpg"
	"terrace3.jpg"
	"livingroom.jpg"
	"livingroom1.jpg"
	"kitchen.jpg"
	"kitchen1.jpg"
	"bedroom1.jpg"
	"bathroom.jpg"
	"bathroom1.jpg"
	"udestue.jpg"
	"udestue1.jpg"
	"annex.jpg"
	"annex1.jpg"
	"beach.jpg"
)

# Check if ImageMagick is installed
if command -v convert &>/dev/null; then
	echo "Using ImageMagick to create thumbnails..."

	for image in "${images[@]}"; do
		if [ -f "public/images/$image" ]; then
			# Create 300x300 thumbnail with proper aspect ratio
			convert "public/images/$image" -resize 300x300^ -gravity center -extent 300x300 "public/images/thumbs/${image%.*}-thumb.jpg"
			echo "Created thumbnail for $image"
		else
			echo "Warning: $image not found"
		fi
	done

elif command -v sips &>/dev/null; then
	echo "Using macOS sips to create thumbnails..."

	for image in "${images[@]}"; do
		if [ -f "public/images/$image" ]; then
			# Create 300x300 thumbnail
			sips -Z 300 "public/images/$image" --out "public/images/thumbs/${image%.*}-thumb.jpg"
			echo "Created thumbnail for $image"
		else
			echo "Warning: $image not found"
		fi
	done

else
	echo "Neither ImageMagick nor sips found."
	echo "Please install ImageMagick (brew install imagemagick) or use online tools to create 300x300px thumbnails."
	echo ""
	echo "Manual steps:"
	echo "1. Resize each image to 300x300px (square crop)"
	echo "2. Save with naming convention: imagename-thumb.jpg"
	echo "3. Place in public/images/thumbs/ folder"
fi

echo "Thumbnail generation complete!"

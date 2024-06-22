from PIL import Image
import numpy as np

# Load and format the image
image = Image.open('Game_over_1.png')
image = image.resize((640, 480))
image = image.convert('RGB')

# Get the pixel data
pixels = np.array(image)

# Convert RGB to 12-bit color
def rgb_to_12bit(r, g, b):
    return ((r >> 4) << 8) | ((g >> 4) << 4) | (b >> 4)

# Create the bitmap array
bitmap_array = np.zeros((480, 640), dtype=np.uint16)
for y in range(480):
    for x in range(640):
        r, g, b = pixels[y, x]
        bitmap_array[y, x] = rgb_to_12bit(r, g, b)

# Save the bitmap array to a hex file
np.savetxt('Game_over_1_data.hex', bitmap_array.flatten(), fmt='%03x')

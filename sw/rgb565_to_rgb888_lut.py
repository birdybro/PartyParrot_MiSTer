def rgb565_to_rgb888(rgb565):
    r5 = (rgb565 & 0xF800) >> 11
    g6 = (rgb565 & 0x07E0) >> 5
    b5 = (rgb565 & 0x001F)

    r8 = (r5 << 3) | (r5 >> 2)
    g8 = (g6 << 2) | (g6 >> 4)
    b8 = (b5 << 3) | (b5 >> 2)

    return r8, g8, b8

with open('rgb565_to_rgb888_LUT.mif', 'w') as mif_file:
    mif_file.write("DEPTH = 65536;\n")
    mif_file.write("WIDTH = 24;\n")
    mif_file.write("ADDRESS_RADIX = BIN;\n")
    mif_file.write("DATA_RADIX = BIN;\n\n")
    mif_file.write("CONTENT BEGIN\n")

    for i in range(65536):
        r8, g8, b8 = rgb565_to_rgb888(i)
        mif_file.write(f"{i:016b} : {r8:08b}{g8:08b}{b8:08b};\n")

    mif_file.write("END;\n")

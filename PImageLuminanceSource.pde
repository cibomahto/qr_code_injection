import com.google.zxing.*;

class PImageLuminanceSource extends LuminanceSource {

  PImage img;
  int n;

  public PImageLuminanceSource(PImage img) {
    super(img.width, img.height);
    this.img = img;
    this.n = img.width * img.height;
  }

  public byte[] getRow(int y, byte[] row) {
    if (row == null) {
      row = new byte[img.width];
    }
    color[] pixels = img.pixels;
    int i = y * img.width;
    int w = img.width;
    for (int x = 0; x < w; x++) {
      row[x] = byte((int) brightness(pixels[i]));
      i++;
    }
    return row;
  }

  public byte[] getMatrix() {
    color[] pixels = img.pixels;
    byte[] mat = new byte[n];
    for (int i = 0; i < n; i++) {
      mat[i] = byte((int) brightness(pixels[i]));
    }
    return mat;
  }
}

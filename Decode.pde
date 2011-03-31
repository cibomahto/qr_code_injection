import com.google.zxing.*;
import com.google.zxing.common.*;
import com.google.zxing.qrcode.decoder.Decoder;
import com.google.zxing.qrcode.decoder.DecoderHack;
import com.google.zxing.qrcode.detector.Detector;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.DecoderResult;

// pure image -> bit matrix -> string
String decodeImage(PImage img, boolean useCorrection) {
  try {
    DecoderHack decoder = new DecoderHack();
    DecoderResult decoderResult = decoder.decode(convertToBitMatrix(img), useCorrection, null);
    return decoderResult.getText();
  } 
  catch(Exception e) {
    //println(e);
    return null;
  }
}

void printMetadata(PImage img) {
  (new DecoderHack()).metadata(convertToBitMatrix(img));
}

// camera pimage -> pure bitmatrix
BitMatrix detectBitMatrix(PImage img) {
  return detectBitMatrix(img, null);
}

// camera pimage -> pure bitmatrix
BitMatrix detectBitMatrix(PImage img, Hashtable hints) {
  try {
    PImageLuminanceSource lumSrc = new PImageLuminanceSource(img);
    Binarizer bin =  new HybridBinarizer(lumSrc);
    BinaryBitmap bitmap = new BinaryBitmap(bin);
    DetectorResult detectorResult = new Detector(bitmap.getBlackMatrix()).detect(hints);
    return detectorResult.getBits();
  } catch (Exception e) {
    return null;
  }
}

// pure pimage -> pure bit matrix
BitMatrix convertToBitMatrix(PImage img) {
  int w = img.width;
  int h = img.height;
  BitMatrix bm = new BitMatrix(w, h);
  bm.clear();
  for(int y = 0; y < w; y++) {
    for(int x = 0; x < h; x++) {
      if(brightness(img.get(x, y)) < 128) {
        bm.set(x, y);
      }
    }
  }
  return bm;
}

// pure bit matrix -> pure pimage
PImage convertToPImage(BitMatrix bm) {
  int w = bm.getWidth();
  int h = bm.getHeight();
  PImage img = createImage(w, h, RGB);
  img.loadPixels();
  for(int y = 0; y < w; y++) {
    for(int x = 0; x < h; x++) {
      img.set(x, y, bm.get(x, y) ? color(0) : color(255));
    }
  }
  img.updatePixels();
  return img;
}

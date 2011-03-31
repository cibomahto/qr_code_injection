import java.util.Collections;
import java.util.regex.*;

color[] mskPixels = {color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(0,0,0),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),color(255,255,255),};

String domains = "(com|mobi|by|net|org|biz|cc)";
Pattern safeDomainPattern = Pattern.compile("http://[a-z]+\\." + domains + "/[0-9a-z]+", Pattern.CASE_INSENSITIVE);
String expectedResult;
int domainStart, domainEnd;
  
class StochasticSearch {
  PImage msk, small, buffer;
  Vector<Integer> maskPixels;
  int bitsToColor;

  StochasticSearch() {
    msk = createImage(25,25,RGB);
    arrayCopy(mskPixels,msk.pixels);
    
//    msk = loadImage("version2-mask-liberal.png");
//    println("msk pix: " + msk.pixels.length);
  }
  
  public String update(PImage hasQrCode, int bitsToColor) {
    this.bitsToColor = bitsToColor;
    BitMatrix bm = detectBitMatrix(hasQrCode);
    small = convertToPImage(bm);
    expectedResult = decodeImage(small, false);
    
    println((bm == null) + " " + (small == null) + " " + (expectedResult == null));
    
    setupMaskPixels();
    setupBuffer();
    
    domainStart = nindexOf(expectedResult, '/', 2) + 1;
    domainEnd = nindexOf(expectedResult, '/', 3);
    
    println("expectedResult: " + expectedResult);
    println("domain name ends at character: " + domainEnd);
    
    String result = null;
    while(true) {
      insertNoise(bitsToColor);
      result = decodeImage(buffer, false);
      if(matchesConditions(result)) {
        break;
      }
    }
    return result;
  }
  
  void draw(float zoom) {
    pushMatrix();
    scale(zoom, zoom);
    image(small, 0, 0);
    fill(255, 0, 0);
    noStroke();
    if(millis() % 1000 < 500) {
      for(int i = 0; i < bitsToColor; i++) {
        int cur = maskPixels.get(i);
        int x = cur % small.width;
        int y = cur / small.width;
        rect(x, y, 1, 1);
      }
    }
    popMatrix();
  }
  
  void setupBuffer() {
    buffer = createImage(small.width, small.height, RGB);
  }
  
  void setupMaskPixels() {
    maskPixels = new Vector<Integer>();
    color[] mpixels = msk.pixels;
    color[] spixels = small.pixels;
    int mw = msk.width;
    int mh = msk.height;
    int i = 0;
    for(int y = 0; y < mh; y++) {
      for(int x = 0; x < mw; x++) {
        if(brightness(mpixels[i]) > 128 && brightness(spixels[i]) > 128) {
          maskPixels.add(i);
        }
        i++;
      }
    }
    println(maskPixels.size() + " bits available");
  }
  
  void insertNoise(int amt) {
    color black = color(0);
    arrayCopy(small.pixels, buffer.pixels);
    Collections.shuffle(maskPixels);
    for(int i = 0; i < amt; i++) {
      buffer.pixels[maskPixels.get(i)] = black;
    }
    
    buffer.updatePixels();
  }
}

boolean matchesConditions(String result) {
  return
    result != null && // not an error
  !result.regionMatches(true, 0, expectedResult, 0, domainEnd) && // and domain name is corrupted
  safeDomainPattern.matcher(result).matches(); // but still valid
}

int nindexOf(String str, int ch, int itr) {
  if(str == null) {
    return -1;
  }
  int pos = 0;
  for(int i = 0; i < itr; i++) {
    pos = str.indexOf(ch, pos) + 1;
  }
  return pos;
}

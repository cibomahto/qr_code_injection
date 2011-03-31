
import android.content.Context;
import android.hardware.Camera;
import android.hardware.Camera.PreviewCallback;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.Surface;

import com.google.zxing.LuminanceSource;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ChecksumException;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.qrcode.QRCodeReader;
import com.google.zxing.qrcode.decoder.Decoder;
import com.google.zxing.qrcode.detector.Detector;


// Setup camera globals:
CameraSurfaceView gCamSurfView;

// For StochasticSearch
int zoom = 8;
StochasticSearch stochastic;

// False if we should be looking for a code, true if we found one.
boolean hasCode;

// This is the physical image drawn on the screen representing the camera:
PImage gBuffer;



PFont HUDFont;


void setup() {
  size(screenWidth, screenHeight, A2D);
  
  hasCode = false;
//  size(25 * zoom, 25 * zoom);  
  stochastic = new StochasticSearch();
//  String alt = stochastic.update(loadImage("famguy-raw.jpg"), 4);
//  println(alt);
}

void draw() {
  
  if (hasCode) {
//    image(gBuffer,20,20);
    stochastic.draw(zoom);
  }
  // nuttin'... onPreviewFrame below handles all the drawing.
}

//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------
// Override the parent (super) Activity class:
// States onCreate(), onStart(), and onStop() aren't called by the sketch.  Processing is entered
// at the 'onResume()' state, and exits at the 'onPause()' state, so just override them:

void onResume() {
  super.onResume();
  println("onResume()!");
  // Set orientation here, before Processing really starts, or it can get angry:
  orientation(LANDSCAPE);

  // Load the font
  HUDFont = loadFont("Ubuntu-Regular-48.vlw");

  // Create our 'CameraSurfaceView' objects, that works the magic:
  gCamSurfView = new CameraSurfaceView(this.getApplicationContext());
  
  // And reset the code search.
  hasCode = false;
}
 

String getCode(byte[] data) {

  LuminanceSource source =
    new  PlanarYUVLuminanceSource(data,
            gCamSurfView.prevSize.width, gCamSurfView.prevSize.height, 0, 0,
            gCamSurfView.prevSize.width, gCamSurfView.prevSize.height);

  BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));

  DetectorResult detectorResult;
  DecoderResult decoderResult;
  Result result;
  ResultPoint[] points;

  try {
    result = new QRCodeReader().decode(bitmap);

    Hashtable hints = null;
    detectorResult = new Detector(bitmap.getBlackMatrix()).detect(hints);
    decoderResult = new Decoder().decode(detectorResult.getBits(), hints);
    points = detectorResult.getPoints();
    
    result = new Result(decoderResult.getText(), decoderResult.getRawBytes(), points, BarcodeFormat.QR_CODE);
  }
  catch (ChecksumException e) {
    return e.toString();
  }
  catch (NotFoundException e) {
    return e.toString();
  }
  catch (FormatException e) {
    return e.toString();
//  } catch (ReaderException re) {
//    return re.toString();
  }
    
  points=result.getResultPoints();

  stroke(0,255,255);
  strokeWeight(4);
  noFill();
  beginShape();
  float xc=0;
  float yc=0;
  for(int i=0; i<points.length; i++) {
    float x=points[i].getX();
    float y=points[i].getY();
    vertex(x,y);
    xc+=x;
    yc+=y;
  }
  endShape(CLOSE);
  
  textFont(HUDFont, 24); 
//  text(detectorResult.getText(), 10, 420);
  text(result.getText(), 10, 450);	

  String alt = stochastic.update(gBuffer, 4);
  println("Done!");
  hasCode = true;
 
  return result.getText();
  
//  return null;
}

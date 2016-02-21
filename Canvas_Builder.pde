//TreeMap is a dictionary/map structure that contains (tweet, KanyeFace) key,value pairs.
//TreeMap sorts (tweet, KanyeFace) alphanumerically, which allows for quick lookup.

import java.util.TreeMap;

public class Canvas_Builder {
  private TreeMap<String, PImage> faces;
  private final static String face_file = "Kanye_Talking.png";
  
  public Canvas_Builder (){
    faces = new TreeMap<String, PImage>();
  }
  
  public void addFace(String tweet){
    faces.put(tweet, loadImage(face_file));
  }
  
  public PImage lookupFace (String tweet){
    return faces.get(tweet);
  }
}
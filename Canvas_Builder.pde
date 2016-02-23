//TreeMap is a dictionary/map structure that contains (tweet, KanyeFace) key,value pairs.
//TreeMap sorts (tweet, KanyeFace) alphanumerically, which allows for quick lookup.

public class Canvas_Builder {
  private ArrayList<Entry_Pair<PImage, Float>> faces;
  
  public Canvas_Builder (){
    faces = new ArrayList<Entry_Pair<PImage, Float>>();
  }
  
  public void addFace(Entry_Pair<PImage, Float> entry){
    faces.add(entry);
  }
  
  public ArrayList<Entry_Pair<PImage, Float>> getFaces(){
    return faces;
  }
}
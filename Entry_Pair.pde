//Sets up key, value pairs for coordinates of Kanye faces.

public class Entry_Pair<K,V> implements Entry<K,V> {
  private K key;
  private V value;
  
  public Entry_Pair (K key, V value) {
    this.key = key;
    this.value = value;
  }
  
  public K getKey(){
    return key;
  }
  
  public V getValue(){
    return value;
  }
  
  
}
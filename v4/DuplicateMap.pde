/**
This class was created due to the fact that there are no such maps
that allow for duplicate keys, or rather that keys cannot have more than one value.
Thusly, this class allows for values to be stored in lists for each corresponding key.

*/

class DuplicateMap{
  Map<Integer, List<Integer>> map;
  
  public DuplicateMap(){
    map = new LinkedHashMap<Integer, List<Integer>>();
  }
  
  void addValue(Integer key, Integer value){
      List<Integer> currValues = map.get(key);
      if (currValues == null) {
          currValues = new ArrayList<Integer>();
      }
      currValues.add(value);
      map.put(key, currValues);
  }
  
  boolean contains(Integer key, Integer value){
      List<Integer> currValues = map.get(key); 
      if (currValues == null) {
         return false; 
      }
      return currValues.contains(value);
  }
  
  void printMap(){
     for(Integer key : map.keySet()){
         println(key);
         for (int value : map.get(key)) {
             println("      " + value);
         }
     }
  }
  
  Set<Integer> keySet(){
     return map.keySet(); 
  }
  
  List<Integer> get(Integer key){
    return map.get(key);
  }
  
  void reset() {
     map.clear(); 
  }
  
}

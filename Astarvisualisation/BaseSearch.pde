
abstract class BaseSearch implements Search{
  
  Grid grid;
  boolean started;
  
  ArrayList<Square> squares = new ArrayList();
  Map<Square, ArrayList<Square>> adjSquares = new HashMap();
  ArrayList<Square> visited = new ArrayList();
  ArrayList<Square> queue = new ArrayList();
  Square start;
  Square goal;
  
  BaseSearch(Grid igrid){
    grid = igrid;
  }
  
  boolean isStarted(){
    return started;
  }
  
  void readGrid(){
    squares.clear();
    
    start = new Square(grid.getStart());
    goal = new Square(grid.getGoal());
    squares.add(start);
    squares.add(goal);
    
    int[][] walls = grid.getSquares();
    for (int i=0; i<walls.length; i++){
      for (int j=0; j<walls[i].length; j++){
        if (walls[i][j] == 0) {
          squares.add(new Square(i, j));
        }
      }
    }
    
    for (Square squ : squares){
      for (Square possible : squares){
        if (squ.isBeside(possible, 1)){
          if (!adjSquares.containsKey(squ)) {
            adjSquares.put(squ, new ArrayList());
          }
          adjSquares.get(squ).add(possible);
        }
      }
    }
    
  }
  
  void startFind(){
    squares = new ArrayList();
    adjSquares = new HashMap();
    visited = new ArrayList();
    queue = new ArrayList();
    start = null;
    goal = null;
    
    readGrid();
    started = true;
    queue.add(start);
    start.distance = 0;
  }
  
}

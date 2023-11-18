class Move { 
 Piece piece; 
 Square from; 
 Square to;
 Boolean capture; 
 
 public Move(Piece p, Square _from, Square _to, Boolean _capture){
  this.piece = p; 
  this.from = _from; 
  this.to = _to;
  this.capture = _capture; 
 }
  
}

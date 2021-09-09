package stx.ds.xset;

enum XSetPlaceSum{
  Field(idx:Int,key:String);
  Index(idx:Int);
}

@:forward abstract XSetPlace(XSetPlaceSum) from XSetPlaceSum to XSetPlaceSum{
  public function new(self:XSetPlaceSum){
    this = self;
  }
  public function index(){
    return switch(this){
      case Field(idx, _)   : idx;
      case Index(idx)      : idx;
    }
  }
  public function field(){
    return switch(this){
      case Field(_,key):key;
      default : null;
    }
  }
}
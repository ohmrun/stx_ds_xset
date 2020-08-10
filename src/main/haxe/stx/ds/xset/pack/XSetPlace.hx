package stx.ds.xset.pack;

enum XSetPlaceDef{
  Field(idx:Int,key:String);
  Index(idx:Int);
}

@:forward abstract XSetPlace(XSetPlaceDef) from XSetPlaceDef to XSetPlaceDef{
  public function new(self){
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
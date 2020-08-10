package stx.ds.xset.pack;

typedef XSetTreeDef = AXSet<AXSetPlace,Primitive>;

@:forward abstract XSetTree(XSetTreeDef) from XSetTreeDef{
  public function new(self:XSetTreeDef){
    this = self;
  }
  static public function unit():XSetTree{
    return XSet.makeKV(
      new stx.ds.xset.pack.suit.XSetPlace.cases.XSetPlaceComparable(),
      new stx.ds.xset.pack.suit.primitive.cases.PrimitiveComparable()
    );
  }
  public function isObject(){
    return this.data.fold(
      (sv,memo) -> switch([sv.fst(),memo]){
        case [_,false]            : false;
        case [Field(idx, key),_]  : true;
        case [Index(idx),_]       : false; 
      },
      true
    );
  }
  public function isArray(){
    return this.data.fold(
      (sv,memo) -> switch([sv.fst(),memo]){
        case [_,false]            : false;
        case [Field(idx, key),_] : false;
        case [Index(idx),_]      : true; 
      },
      true
    );
  }
  public function getType(){
    return switch([isArray(),isObject()]){
      case [false,true] : DTObject;
      case [true,false] : DTArray;
      default           : DTMixed;
    }
  }
  public function union(that:XSetTree):XSetTree{
    return this.union(that.prj());
  }
  public function put(v):XSetTree{
    return this.put(v);
  }
  public function prj():XSetTreeDef{
    return this;
  }
  public function keyspace():XSetTree{
    return this.keyspace();
  }
  @:noUsing static public function fromSpine(sp:SpineT):XSetTree{
    var rec = null;
        rec = 
    function(sp):XSetTreeDef{
      return switch sp {
        case SRecord(arr) : 
          var out = arr.prj().mapi(
            (i:Int,kv:Field<Thunk<SpineT>>) -> {
              return switch(kv.val()){
                case SScalar(p) : SetVal(Field(i,kv.key),p);
                case x          : SetObj(Field(i,kv.key),rec(x));
              }
            }
          ).fold(
            (n:XSetVal<XSetPlace,Primitive>,m:XSetTreeDef) -> m.put(n),
            XSetTree.unit().prj()
          );
          out;
        case SArray(arr)  :   
          var out = arr.mapi(
            (i,v) -> switch(v()){
              case SScalar(p) : SetVal(Index(i),p);
              case x          : SetObj(Index(i),rec(x));
            }
          ).fold(
            (n:XSetVal<XSetPlace,Primitive>,m:XSetTreeDef) -> m.put(n),
            XSetTree.unit().prj()
          );
          out;
        case SEmpty: 
          XSetTree.unit().prj();
        case x:
          throw(x);
          XSetTree.unit().prj();
      }
    }
    return new XSetTree(rec(sp));
  }
}
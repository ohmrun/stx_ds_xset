package stx.ds.xset;

typedef XSetTreeDef = XSet<XSetPlace,Primitive>;

@:forward abstract XSetTree(XSetTreeDef) from XSetTreeDef{
  public function new(self:XSetTreeDef){
    this = self;
  }
  static public function unit():XSetTree{
    return XSet.makeKV(
      new stx.assert.comparable.term.XSetPlace(),
      new stx.assert.comparable.term.Primitive()
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
  public function isCluster(){
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
    return switch([isCluster(),isObject()]){
      case [false,true] : DTObject;
      case [true,false] : DTCluster;
      default           : DTMixed;
    }
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
  @:noUsing static public function fromSpine(sp:Spine<Noise>):XSetTree{
    var rec = null;
        rec = 
    function(sp):XSetTreeDef{
      return switch sp {
        case Collate(arr) : 
          var out = arr.prj().mapi(
            (i:Int,kv:Field<Thunk<Spine<Noise>>>) -> {
              return switch(kv.val()){
                case Primate(p) : SetVal(Field(i,kv.key),p);
                case x          : SetObj(Field(i,kv.key),rec(x));
              }
            }
          ).lfold(
            (n:XSetVal<XSetPlace,Primitive>,m:XSetTreeDef) -> m.put(n),
            XSetTree.unit().prj()
          );
          out;
        case Collect(arr)  :   
          var out = arr.mapi(
            (i,v) -> switch(v()){
              case Primate(p) : SetVal(Index(i),p);
              case x          : SetObj(Index(i),rec(x));
            }
          ).lfold(
            (n:XSetVal<XSetPlace,Primitive>,m:XSetTreeDef) -> m.put(n),
            XSetTree.unit().prj()
          );
          out;
        case Unknown | Predate(_): 
          XSetTree.unit().prj();
        case x:
          throw(x);
          XSetTree.unit().prj();
      }
    }
    return new XSetTree(rec(sp));
  }
}
package stx.ds.xset.pack.suit.xsetwith.cases;

class XSetOrd<K,V> implements stx.assert.head.data.Ord<XSetVal<K,V>>{
  var with : With<K,V>;
  public function new(with){
    this.with = with;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>):Ordered{
    return switch([a,b]){
      case [SetVal(k,v),SetVal(k0,v0)]  : 
        with.K.lt().duoply(k,k0) || with.V.lt().duoply(v,v0);
      case [SetObj(k,v),SetObj(k0,v0)]  : 
        with.K.lt().duoply(k,k0) || v.ltx(v0,new XSetComparable(with));
      case [SetVal(_),SetObj(_)]        : 
        LessThan;
      case [SetObj(_),SetVal(_)]        : 
        NotLessThan;
    }
  }
}
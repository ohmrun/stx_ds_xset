package stx.ds.xset.pack.suit.xsetwith.cases;

class XSetVal<K,V> implements OrdApi<XSetVal<K,V>>{
  var val_comparable:Comparable<V>;
  public function new(val_comparable:Comparable<V>){
    this.val_comparable = val_comparable;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>):Ordered{
    return switch([a,b]){
      case [SetVal(k,v),SetVal(k0,v0)]  : 
        val_comparable.lt().duoply(v,v0);
      case [SetObj(k,v),SetObj(k0,v0)]  : 
        v.ltx(v0,new XSetValComparable(val_comparable));
      case [SetVal(_),SetObj(_)]        : 
        LessThan;
      case [SetObj(_),SetVal(_)]        : 
        NotLessThan;
    }
  }
}
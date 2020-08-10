package stx.ds.xset.pack.suit.xsetwith.cases;

class XSetVal<K,V> implements EqApi<XSetVal<K,V>>{
  var val_comparable:Comparable<V>;
  public function new(val_comparable:Comparable<V>){
    this.val_comparable = val_comparable;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>):Equaled{
    return switch([a,b]){
      case [SetObj(k,v),SetObj(k0,v0)] :
        var out = v.eqx(v0,new XSetValComparable(this.val_comparable));
        out;
      case [SetVal(k,v),SetVal(k0,v0)] :
        val_comparable.eq().duoply(v,v0);
      default : 
        NotEqual;
    }
  }
}
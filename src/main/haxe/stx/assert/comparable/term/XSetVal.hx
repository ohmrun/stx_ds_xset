package stx.ds.xset.pack.suit.xsetwith.cases;

class XSetVal<K,V> implements ComparableApi<XSetVal<K,V>>{
  var val_comparable:Comparable<V>;
  public function new(val_comparable){
    this.val_comparable = val_comparable;
  }
  public function lt():Ord<XSetVal<K,V>>{
    return new XSetValOrd(this.val_comparable);
  }
  public function eq():Eq<XSetVal<K,V>>{
    return new XSetValEq(this.val_comparable);
  }
}
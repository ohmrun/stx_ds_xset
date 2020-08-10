package stx.ds.xset.pack.suit.xsetwith.cases;

class XSet<K,V> implements EqApi<XSetVal<K,V>>{
  var with : With<K,V>;
  public function new(with){
    this.with = with;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>):Equaled{
    return switch([a,b]){
      case [SetObj(k,v),SetObj(k0,v0)] :
        with.K.eq().duoply(k,k0) && v.eqx(v0,new XSetComparable(with));
      case [SetVal(k,v),SetVal(k0,v0)] :
        with.K.eq().duoply(k,k0) && with.V.eq().duoply(v,v0);
      default : NotEqual;
    }
  }
}
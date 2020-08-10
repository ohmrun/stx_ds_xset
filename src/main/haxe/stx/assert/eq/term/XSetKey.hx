package stx.assert.eq.term;

class XSetKeyEq<K,V> implements EqApi<XSetVal<K,V>>{
  var key_comparable:Comparable<K>;
  public function new(key_comparable){
    this.key_comparable = key_comparable;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>){
    return switch([a,b]){
      case [SetObj(k,_),SetObj(k0,_)] :
        key_comparable.eq().duoply(k,k0);
      case [SetVal(k,_),SetVal(k0,_)] :
        key_comparable.eq().duoply(k,k0);
      case [SetVal(k,_),SetObj(k0,_)] : 
        key_comparable.eq().duoply(k,k0);
      case [SetObj(k,_),SetVal(k0,_)] :
        key_comparable.eq().duoply(k,k0);
      default : 
        NotEqual;
    }
  }
}
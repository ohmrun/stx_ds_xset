package stx.assert.ord.term;

class XSetKey<K,V> implements OrdApi<XSetVal<K,V>>{
  var key_comparable:Comparable<K>;
  public function new(key_comparable){
    this.key_comparable = key_comparable;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>) {
    return switch([a,b]){
      case [SetVal(k,v),SetVal(k0,v0)]        : 
        key_comparable.lt().duoply(k,k0);
      case [SetObj(k,v),SetObj(k0,v0)]        : 
        key_comparable.lt().duoply(k,k0);
      case [SetVal(k,_),SetObj(k0,_)]         : 
        key_comparable.lt().duoply(k,k0);
      case [SetObj(k,_),SetVal(k0,_)]         : 
        key_comparable.lt().duoply(k,k0);
    }
  }
}
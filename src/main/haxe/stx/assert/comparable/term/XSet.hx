package stx.assert.comparable.term;

class XSet<K,V> implements ComparableApi<XSetValT<K,V>>{
  var with : With<K,V>;
  public function new(with){
    this.with = with;
  }
  public function eq(){
    return new stx.assert.eq.term.XSet(this.with);
  }
  public function lt(){
    return new stx.assert.ord.term.XSet(this.with);
  }
}
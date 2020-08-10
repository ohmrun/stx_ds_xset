package stx.assert.comparable;

class XSet<K,V> implements ComparableApi<XSetVal<K,V>>{
  var with : With<K,V>;
  public function new(with){
    this.with = with;
  }
  public function eq(){
    return new XSetEq(this.with);
  }
  public function lt(){
    return new XSetOrd(this.with);
  }
}
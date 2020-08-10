package stx.assert.comparable.term;

class XSetWith<K,V> implements ComparableApi<XSetVal<K,V>>{
  var self : XSetWith<K,V>;
  public function new(self){
    this.self = self;
  }
  public function eq(){
    return new XSetWithEq(this.self);
  }
  public function lt(){
    return new XSetWithOrd(this.self);
  }
}
package stx.assert.comparable.term;

class XSetWith<K,V> implements ComparableApi<XSetValT<K,V>>{
  var self : XSetWithT<K,V>;
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
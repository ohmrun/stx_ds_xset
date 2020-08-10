package stx.ds.xset.pack.suit.xsetwith.cases;

class XSetWithOrd<K,V> implements stx.assert.head.data.Ord<XSetVal<K,V>>{
  var self : XSetWith<K,V>;
  public function new(self){
    this.self = self;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>):Ordered{
    return switch(self.state){
      case CKey     : XSetWith.key(self.with.K).lt().duoply(a,b);
      case CVal     : XSetWith.val(self.with.V).lt().duoply(a,b);
      case CKeyVal  : XSetWith.kv(self.with).lt().duoply(a,b);
    }
  }
}
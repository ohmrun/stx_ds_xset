package stx.ds.xset.pack.suit.xsetwith.cases;

class XSetWithEq<K,V> implements stx.assert.head.data.Eq<XSetVal<K,V>>{
  var self : XSetWith<K,V>;
  public function new(self){
    this.self = self;
  }
  public function duoply(a:XSetVal<K,V>,b:XSetVal<K,V>):Equaled{
    return switch(self.state){
      case CKey     : XSetWith.key(self.with.K).eq().duoply(a,b);
      case CVal     : XSetWith.val(self.with.V).eq().duoply(a,b);
      case CKeyVal  : XSetWith.kv(self.with).eq().duoply(a,b);
    }
  }
}
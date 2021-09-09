package stx.ds.xset;

enum XSetValSum<K,V>{
  SetObj(key:K,val:XSet<K,V>);
  SetVal(key:K,val:V);
  //SetNil;
}
abstract XSetVal<K,V>(XSetValSum<K,V>) from XSetValSum<K,V> to XSetValSum<K,V> {
  public function new(self) this = self;
  public function fst():K{
    return switch(this){
      case SetVal(k,_) : k;
      case SetObj(k,_) : k;
    }
  }
  public function snd():Either<XSet<K,V>,V>{
    return switch(this){
      case SetObj(_,v) : Left(v);
      case SetVal(_,v) : Right(v);
    }
  }
}
package stx.assert.ord.term;

class XSetPlace implements OrdApi<XSetPlaceT> extends Clazz{
  public function comply(a:XSetPlaceT,b:XSetPlaceT):Ordered{
    return switch([a,b]){
      case [Field(idx,key),Field(idx0, key0)]: 
        idx < idx0 || key < key0;
      case [Index(idx),Index(idx0)]: 
        idx < idx0;
      case [Index(_),Field(_, _)]:
        true;
      case [Field(_, _),Index(_)]:
        false;
    }
  }
}
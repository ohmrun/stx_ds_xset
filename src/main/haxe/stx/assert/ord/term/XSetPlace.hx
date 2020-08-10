package stx.assert.ord.term;

class XSetPlaceOrd implements OrdApi<XSetPlace> extends Clazz{
  public function duoply(a:XSetPlace,b:XSetPlace):Ordered{
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
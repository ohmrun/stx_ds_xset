package stx.assert.eq.term;

class XSetPlace implements EqApi<XSetPlace> extends Clazz{
  public function duoply(a:XSetPlace,b:XSetPlace):Equaled{
    return switch ([a,b]){
      case ([Field(idx,key),Field(idx0, key0)]) : 
        idx == idx0 && key == key0 ? AreEqual : NotEqual;
      case ([Index(idx),Index(idx0)]): 
        idx == idx0 ? AreEqual : NotEqual;
      default : 
        NotEqual; 
    }
  }
}
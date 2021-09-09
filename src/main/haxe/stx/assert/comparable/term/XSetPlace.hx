package stx.assert.comparable.term;

class XSetPlace implements ComparableApi<XSetPlaceT> extends Clazz{

  public function eq(){
    return new XSetPlaceEq();
  }
  public function lt(){
    return new XSetPlaceOrd();
  }
}
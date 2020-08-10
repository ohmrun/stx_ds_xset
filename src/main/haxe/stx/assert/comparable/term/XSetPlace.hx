package stx.assert.comparable.term;

class XSetPlaceComparable implements ComparableApi<XSetPlace> extends Clazz{

  public function eq(){
    return new XSetPlaceEq();
  }
  public function lt(){
    return new XSetPlaceOrd();
  }
}
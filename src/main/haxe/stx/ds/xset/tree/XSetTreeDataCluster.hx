package stx.ds.xset.tree;

typedef XSetTreeDataClusterDef = Cluster<XSetTreeData>;

abstract XSetTreeDataCluster(XSetTreeDataClusterDef) from XSetTreeDataClusterDef to XSetTreeDataClusterDef{
  public function new(self) this = self;
  static public function lift(self:XSetTreeDataClusterDef):XSetTreeDataCluster return new XSetTreeDataCluster(self);

  public function prj():XSetTreeDataClusterDef return this;
  private var self(get,never):XSetTreeDataCluster;
  private function get_self():XSetTreeDataCluster return lift(this);

  static public function unit(){
    return lift(Cluster.unit());
  }
  static public function pure(self:XSetTreeDataClusterDef){
    return lift(self);
  }
  public function label(key:String){
    final counter = stx.ds.xset.tree.Counter.instance;
    return this.lfold(
      (next:XSetTreeData,memo:Cluster<XSetTreeValDef>) -> memo.snoc(next.label(Field(counter.next(),key))),
      Cluster.unit()
    );
  }
  public function snoc(data:XSetTreeData){
    return lift(Cluster._.snoc(this,data));
  }
}
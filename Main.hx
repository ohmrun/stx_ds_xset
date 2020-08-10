import stx.ds.xset.Package;

class Main {
	static function main(){
		#if test
			utest.UTest.run(cast stx.ds.xset.Package.tests());
		#end
	}
}
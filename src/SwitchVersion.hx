package;

import sys.io.File;
import sys.FileSystem;
import Sys.*;

class SwitchVersion {
	static function main() {
		final args = args();

		// project directory
		final dir = args.pop();
		setCwd(dir);

		if (args.length == 0) {
			println('Name required, version optional');
			exit(1);
		}
		final name = args[0];
		final path = './haxe_libraries/$name.hxml';
		if (!FileSystem.exists(path)) {
			println('Library $name not found at $path');
			exit(2);
		}
		final hxml = File.getContent(path);
		final reLib = new EReg('download "([^#]+)#[^"]+"', 'i');
		if (!reLib.match(hxml)) {
			println('$path doesn\'t include a recognizable lix download URL pattern');
			exit(1);
		}
		final lib = reLib.matched(1);
		final version = args.length > 1 ? args[1] : null;
		if (args.length > 1)
			exit(command('lix', ['install', '$lib#$version', 'as', name]));
		else // latest
			exit(command('lix', ['install', lib, 'as', name]));
	}
}

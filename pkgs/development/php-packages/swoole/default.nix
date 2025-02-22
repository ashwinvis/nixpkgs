{ lib, stdenv, buildPecl, php, valgrind, pcre2 }:

buildPecl {
  pname = "swoole";

  version = "4.8.6";
  sha256 = "sha256-4ot8LXpWcjMmD3e/EzrYNMxqUPPupQQkv2ibLkZoWxs=";

  buildInputs = [ pcre2 ] ++ lib.optionals (!stdenv.isDarwin) [ valgrind ];
  internalDeps = lib.optionals (lib.versionOlder php.version "7.4") [ php.extensions.hash ];

  doCheck = true;
  checkTarget = "tests";

  meta = with lib; {
    description = "Coroutine-based concurrency library for PHP";
    license = licenses.asl20;
    homepage = "https://www.swoole.co.uk/";
    maintainers = teams.php.members;
  };
}

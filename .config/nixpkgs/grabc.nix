{ stdenv, fetchFromGitHub, xorg, coreutils }:
stdenv.mkDerivation rec {
  buildInputs = [xorg.libX11];
  name = "grabc-${version}";
  version = "1.0.2";
  src = fetchFromGitHub {
    owner = "muquit";
    repo = "grabc";
    rev = "v${version}";
    sha256 = "0062sr6wcwh450p9wkdj5a2p482minllk595jbimsbdxc7xamjhv";
  };
  installPhase = ''
    make \
      DESTDIR=$out \
      cp=${coreutils}/bin/cp \
      bindir=/bin \
      mandir=/share/man/man1 \
      install
  '';
}

{ lib
, buildGoModule
, fetchFromGitHub
, pkg-config
, go
, gtk3
, xcur2png
, glib
, cairo
}:

buildGoModule rec {
  pname = "nwg-look";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "nwg-piotr";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  nativeBuildInputs = [ pkg-config go ];
  buildInputs = [ gtk3 xcur2png glib cairo ];

  meta = with lib; {
    description = "GTK3 settings editor adapted to work in the sway / wlroots environment";
    homepage = "https://github.com/nwg-piotr/nwg-look";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ bnhrkn ];
  };
}

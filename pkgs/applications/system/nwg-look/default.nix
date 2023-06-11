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
    sha256 = "sha256-vrlTBjDPGsRyPqw3tghDplVDVhHqeya/nefg5zTmT0s=";
  };

  nativeBuildInputs = [ pkg-config go ];
  buildInputs = [ gtk3 xcur2png glib cairo ];
  vendorSha256 = "sha256-5nsXSPjCinzJHtm/YsgJZ6xRlp7P4ArXC0jl1KomHPc=";
  meta = with lib; {
    description = "GTK3 settings editor adapted to work in the sway / wlroots environment";
    homepage = "https://github.com/nwg-piotr/nwg-look";
    license = licenses.mit;
    maintainers = with lib.maintainers; [ bnhrkn ];
  };
}

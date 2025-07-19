{ lib
, stdenv
, fetchFromGitHub
, nodejs
, python3
, bash
, git
, cacert
, yarn
}:

stdenv.mkDerivation rec {
  pname = "home-assistant-frontend-custom";
  version = "20250719";

  src = fetchFromGitHub {
    owner = "Noodlesalat";
    repo = "frontend";
    rev = "ha-state-control-light-brightness-live";
    # Optional, aber empfohlen: festen Commit einsetzen
    # rev = "abcdef1234567890...";
    # ref = "ha-state-control-light-brightness-live";
    hash = "sha256-PJ8tQu0oaUY5J10bT2qdrWxe0ShjnE1ycrpng4vlY0A=";
  };

  nativeBuildInputs = [
    nodejs
    yarn
    python3
    bash
    git
    cacert
  ];

  buildPhase = ''
    echo "Running script/setup"
    bash script/setup

    echo "Running script/build_frontend"
    bash script/build_frontend
  '';

  installPhase = ''
    mkdir -p $out
    cp -r ./hass_frontend $out/
    echo "Build installed to $out"
  '';

  meta = with lib; {
    description = "Home Assistant Frontend (custom development build)";
    homepage = "https://github.com/Noodlesalat/frontend";
    license = licenses.asl20;
    maintainers = [ ];
    platforms = platforms.all;
  };
}

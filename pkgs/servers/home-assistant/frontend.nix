{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
}:

buildPythonPackage rec {
  # the frontend version corresponding to a specific home-assistant version can be found here
  # https://github.com/home-assistant/home-assistant/blob/master/homeassistant/components/frontend/manifest.json
  pname = "home-assistant-frontend";
  version = "20250516.0";
  format = "wheel";

  src = fetchFromGitHub {
    owner = "Noodlesalat";
    repo = "frontend";
    rev = "ha-state-control-light-brightness-live";
    # Nutze besser einen festen Commit für reproduzierbare Builds
    # z.B.: rev = "0123456789abcdef..."; und branch separat angeben
    # Optional: fetchSubmodules = true; falls das Repo Submodule verwendet
    hash = "sha256-0000000000000000000000000000000000000000000="; # ← durch tatsächlichen Hash ersetzen (s. Hinweis unten)
  };

  # there is nothing to strip in this package
  dontStrip = true;

  # no Python tests implemented
  doCheck = false;

  meta = with lib; {
    changelog = "https://github.com/home-assistant/frontend/releases/tag/${version}";
    description = "Frontend for Home Assistant";
    homepage = "https://github.com/home-assistant/frontend";
    license = licenses.asl20;
    teams = [ teams.home-assistant ];
  };
}

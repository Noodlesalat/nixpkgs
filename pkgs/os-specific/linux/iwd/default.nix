{ lib, stdenv
, fetchgit
, fetchpatch
, autoreconfHook
, pkg-config
, ell
, coreutils
, docutils
, readline
, openssl
, python3Packages
, gitUpdater
}:

stdenv.mkDerivation rec {
  pname = "iwd";
  version = "2.11";

  src = fetchgit {
    url = "https://git.kernel.org/pub/scm/network/wireless/iwd.git";
    rev = version;
    hash = "sha256-kE9GBVTKNpgEuE9jQ7k85OhEAN3VWgjmAgifvZfq46I=";
  };

  patches = [
    # Fix unit/test-dpp on aarch64.
    (fetchpatch {
      name = "size_t-vararg.patch";
      url = "https://git.kernel.org/pub/scm/network/wireless/iwd.git/patch/?id=688d27700833258a139a6fbd5661334bd2c9fa98";
      hash = "sha256-g3gG1c25o6ODFfHL4a0HcnNJBBOKRbdo+ZuVbzoxCLs=";
    })
  ];

  outputs = [ "out" "man" "doc" ]
    ++ lib.optional (stdenv.hostPlatform == stdenv.buildPlatform) "test";

  nativeBuildInputs = [
    autoreconfHook
    docutils
    pkg-config
    python3Packages.wrapPython
  ];

  buildInputs = [
    ell
    python3Packages.python
    readline
  ];

  nativeCheckInputs = [ openssl ];

  # wrapPython wraps the scripts in $test. They pull in gobject-introspection,
  # which doesn't cross-compile.
  pythonPath = lib.optionals (stdenv.hostPlatform == stdenv.buildPlatform) [
    python3Packages.dbus-python
    python3Packages.pygobject3
  ];

  configureFlags = [
    "--enable-external-ell"
    "--enable-wired"
    "--localstatedir=/var/"
    "--with-dbus-busdir=${placeholder "out"}/share/dbus-1/system-services/"
    "--with-dbus-datadir=${placeholder "out"}/share/"
    "--with-systemd-modloaddir=${placeholder "out"}/etc/modules-load.d/" # maybe
    "--with-systemd-unitdir=${placeholder "out"}/lib/systemd/system/"
    "--with-systemd-networkdir=${placeholder "out"}/lib/systemd/network/"
  ];

  postUnpack = ''
    mkdir -p iwd/ell
    ln -s ${ell.src}/ell/useful.h iwd/ell/useful.h
    ln -s ${ell.src}/ell/asn1-private.h iwd/ell/asn1-private.h
    patchShebangs .
  '';

  doCheck = true;

  postInstall = ''
    mkdir -p $doc/share/doc
    cp -a doc $doc/share/doc/iwd
    cp -a README AUTHORS TODO $doc/share/doc/iwd
  '' + lib.optionalString (stdenv.hostPlatform == stdenv.buildPlatform) ''
    mkdir -p $test/bin
    cp -a test/* $test/bin/
  '';

  preFixup = ''
    wrapPythonPrograms
  '';

  postFixup = ''
    substituteInPlace $out/share/dbus-1/system-services/net.connman.ead.service \
      --replace /bin/false ${coreutils}/bin/false
    substituteInPlace $out/share/dbus-1/system-services/net.connman.iwd.service \
      --replace /bin/false ${coreutils}/bin/false
  '';

  enableParallelBuilding = true;

  passthru.updateScript = gitUpdater {
    # No nicer place to find latest release.
    url = "https://git.kernel.org/pub/scm/network/wireless/iwd.git";
  };

  meta = with lib; {
    homepage = "https://git.kernel.org/pub/scm/network/wireless/iwd.git";
    description = "Wireless daemon for Linux";
    license = licenses.lgpl21Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ dtzWill fpletz amaxine ];
  };
}

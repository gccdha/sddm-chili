{
  lib,
  stdenvNoCC,
  libsForQt5,
  version
}:
stdenvNoCC.mkDerivation {
  pname = "sddm-chili";
  version = version;

  src = lib.cleanSource ./.;

  dontConfigure = true;
  dontBuild = true;
  dontWrapQtApps = true;

  propagatedBuildInputs = with libsForQt5.qt5; [
    qtgraphicaleffects
  ];

  postInstall = ''
    mkdir -p $out/share/sddm/themes/chili

    mv * $out/share/sddm/themes/chili/
  '';

  postFixup = ''
    mkdir -p $out/nix-support

    echo ${libsForQt5.qt5.qtgraphicaleffects} >> $out/nix-support/propagated-user-env-packages
  '';
}

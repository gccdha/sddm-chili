{
  lib,
  stdenvNoCC,
  qtgraphicaleffects
}:
stdenvNoCC.mkDerivation {
  pname = "sddm-chili";
  version = "1.0";

  src = lib.cleanSource ./.;

  dontConfigure = true;
  dontBuild = true;
  dontWrapQtApps = true;

  propagatedBuildInputs = [
    qtgraphicaleffects
  ];

  postInstall = ''
    mkdir -p $out/share/sddm/themes/chili

    mv * $out/share/sddm/themes/chili/
  '';

  postFixup = ''
    mkdir -p $out/nix-support

    echo ${qtgraphicaleffects} >> $out/nix-support/propagated-user-env-packages
  '';
}

{pkgs, ...}:
{ modules = [({pkgs, ...}: {
    packages.webkit2gtk3-javascriptcore.components.library.doHaddock = false;
  })];
  shell.buildInputs = [ pkgs.nodejs ];
  shell.tools.cabal = {};
  shell.crossPlatforms = p: [ p.ghcjs ];

  # Use this for checking if `aeson` 2 works (tests will not build because `webdriver` still needs aeson <2)
  cabalProjectLocal = ''
    constraints: aeson >=2
  '';
  configureArgs = "--disable-tests";
}
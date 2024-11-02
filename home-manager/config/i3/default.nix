{
  config,
  lib,
  inputs,
  ...
}: {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };
}

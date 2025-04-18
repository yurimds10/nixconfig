# https://github.com/vimjoyer/nixconf/blob/main/homeManagerModules/features/rofi/default.nix

{ pkgs, config, ...}:
{
  home.packages = with pkgs; [rofi-wayland];

  xdg.configFile."rofi/config.rasi".text = with config.colorScheme.palette; ''
    /* =========================================== */
    /* Configuration                               */
    /* =========================================== */
    configuration {
      modi:                        "drun";
      show-icons:                  true;
      drun-display-format:         "{name}";
      window-format:               "{w} · {c} · {t}";
    }

    /* =========================================== */
    /* Global theme                                */
    /* =========================================== */
    * {
      font: "SF Pro Display Regular 12";
      border-color:                #${base0D};
      handle-color:                #${base0D};
      background-color:            #${base00};
      foreground-color:            #${base06};
      alternate-background:        #${base02};
      normal-background:           #${base00};
      normal-foreground:           #${base06};
      urgent-background:           #${base09};
      urgent-foreground:           #${base00};
      active-background:           #${base0C};
      active-foreground:           #${base00};
      selected-normal-background:  #${base0D};
      selected-normal-foreground:  #${base00};
      selected-urgent-background:  #${base0C};
      selected-urgent-foreground:  #${base00};
      selected-active-background:  #${base09};
      selected-active-foreground:  #${base00};
      alternate-normal-background: #${base00};
      alternate-normal-foreground: #${base06};
      alternate-urgent-background: #${base09};
      alternate-urgent-foreground: #${base00};
      alternate-active-background: #${base0C};
      alternate-active-foreground: #${base00};
    }
    
    /* =========================================== */
    /* Configuration                               */
    /* =========================================== */
    window {
      /* properties for window widget */
      transparency:                "real";
      location:                    center;
      anchor:                      center;
      fullscreen:                  false;
      width:                       500px;
      x-offset:                    0px;
      y-offset:                    0px;
      enabled:                     true;
      margin:                      0px;
      padding:                     0px;
      border:                      0px solid;
      border-radius:               5px;
      border-color:                @border-color;
      cursor:                      "default";
      background-color:            @background-color;
      //background-image:          url("/path/to/image.png", none);
      /* Simple Linear Gradient */
      //background-image:          linear-gradient(red, orange, pink, purple);
      /* Directional Linear Gradient */
      //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
      /* Angle Linear Gradient */
      //background-image:          linear-gradient(45, cyan, purple, indigo);
    }

    /* =========================================== */
    /* Configuration                               */
    /* =========================================== */
    mainbox {
      enabled:                     true;
      spacing:                     0px;
      margin:                      0px;
      padding:                     20px;
      border:                      0px solid;
      border-radius:               0px 0px 0px 0px;
      border-color:                @border-color;
      background-color:            transparent;
      children:                    [ "inputbar", "message", "mode-switcher", "listview" ];
    }

    inputbar {
      enabled:                     true;
      spacing:                     10px;
      margin:                      0px 0px 10px 0px;
      padding:                     5px 10px;
      border:                      0px solid;
      border-radius:               0px;
      border-color:                @border-color;
      background-color:            @alternate-background;
      text-color:                  @foreground-color;
      children:                    [ "textbox-prompt-colon", "entry" ];
    }

    prompt {
      enabled:                     true;
      background-color:            inherit;
      text-color:                  inherit;
    }

    textbox-prompt-colon {
      enabled:                     true;
      padding:                     5px 0px;
      expand:                      false;
      str:                         "";
      background-color:            inherit;
      text-color:                  inherit;
    }

    entry {
      enabled:                     true;
      padding:                     5px 0px;
      background-color:            inherit; 
      text-color:                  inherit;
      cursor:                      text;
      placeholder:                 "Search...";
      placeholder-color:           inherit;
    }

    num-filtered-rows {
      enabled:                     true;
      expand:                      false;
      background-color:            inherit;
      text-color:                  inherit;
    }

    textbox-num-sep {
      enabled:                     true;
      expand:                      false;
      str:                         "/";
      background-color:            inherit;
      text-color:                  inherit;
    }
    num-rows {
      enabled:                     true;
      expand:                      false;
      background-color:            inherit;
      text-color:                  inherit;
    }
    case-indicator {
      enabled:                     true;
      background-color:            inherit;
      text-color:                  inherit;
    }

    listview {
      enabled:                     true;
      columns:                     1;
      lines:                       8;
      cycle:                       true;
      dynamic:                     true;
      scrollbar:                   false;
      layout:                      vertical;
      reverse:                     false;
      fixed-height:                true;
      fixed-columns:               true;        
      spacing:                     5px;
      margin:                      0px;
      padding:                     10px;
      border:                      2px 2px 2px 2px ;
      border-radius:               0px 0px 0px 0px;
      border-color:                @border-color;
      background-color:            transparent;
      text-color:                  @foreground-color;
      cursor:                      "default";
    }
    scrollbar {
      handle-width:                5px ;
      handle-color:                @handle-color;
      border-radius:               0px;
      background-color:            @alternate-background;
    }

    element {
      enabled:                     true;
      spacing:                     10px;
      margin:                      0px;
      padding:                     6px;
      border:                      0px solid;
      border-radius:               10px;
      border-color:                @border-color;
      background-color:            transparent;
      text-color:                  @foreground-color;
      cursor:                      pointer;
    }
    element normal.normal {
      background-color:            var(normal-background);
      text-color:                  var(normal-foreground);
    }
    element normal.urgent {
      background-color:            var(urgent-background);
      text-color:                  var(urgent-foreground);
    }
    element normal.active {
      background-color:            var(active-background);
      text-color:                  var(active-foreground);
    }
    element selected.normal {
      background-color:            var(selected-normal-background);
      text-color:                  var(selected-normal-foreground);
    }
    element selected.urgent {
      background-color:            var(selected-urgent-background);
      text-color:                  var(selected-urgent-foreground);
    }
    element selected.active {
      background-color:            var(selected-active-background);
      text-color:                  var(selected-active-foreground);
    }

    element alternate.normal {
      background-color:            var(alternate-normal-background);
      text-color:                  var(alternate-normal-foreground);
    }

    element alternate.urgent {
      background-color:            var(alternate-urgent-background);
      text-color:                  var(alternate-urgent-foreground);
    }

    element alternate.active {
      background-color:            var(alternate-active-background);
      text-color:                  var(alternate-active-foreground);
    }

    element-icon {
      background-color:            transparent;
      text-color:                  inherit;
      size:                        28px;
      cursor:                      inherit;
    }

    element-text {
      background-color:            transparent;
      text-color:                  inherit;
      highlight:                   inherit;
      cursor:                      inherit;
      vertical-align:              0.5;
      horizontal-align:            0.0;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
      enabled:                     false;
      expand:                      false;
      spacing:                     0px;
      margin:                      0px;
      padding:                     0px;
      border:                      0px solid;
      border-radius:               10px 0px 0px 0px;
      border-color:                @border-color;
      background-color:            transparent;
      text-color:                  @foreground-color;
    }

    button {
      padding:                     10px;
      border:                      0px 0px 0px 0px ;
      border-radius:               0px;
      border-color:                @border-color;
      background-color:            @background-color;
      text-color:                  inherit;
      cursor:                      pointer;
    }

    button selected {
      border:                      2px 2px 0px 2px ;
      border-radius:               0px;
      border-color:                @border-color;
      background-color:            @border-color;
      text-color:                  @background-color;
    }

    /*****----- Message -----*****/
    message {
      enabled:                     true;
      margin:                      0px 0px 10px 0px;
      padding:                     0px;
      border:                      0px solid;
      border-radius:               0px 0px 0px 0px;
      border-color:                @border-color;
      background-color:            transparent;
      text-color:                  @foreground-color;
    }

    textbox {
      padding:                     10px;
      border:                      0px solid;
      border-radius:               0px;
      border-color:                @border-color;
      background-color:            @alternate-background;
      text-color:                  @foreground-color;
      vertical-align:              0.5;
      horizontal-align:            0.0;
      highlight:                   none;
      placeholder-color:           @foreground-color;
      blink:                       true;
      markup:                      true;
    }

    error-message {
      padding:                     10px;
      border:                      2px solid;
      border-radius:               0px;
      border-color:                @border-color;
      background-color:            @background-color;
      text-color:                  @foreground-color;
    }
  '';
}

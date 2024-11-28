{ config, ... }:
{
  programs.wlogout = {
    enable = true;
    style = with config.colorScheme.palette; ''
      * {
	      background-image: none;
    	  box-shadow: none;
      }

      window {
      	background-color: rgba(12, 12, 12, 0.9);
      }

      button {
        border-radius: 0;
        border-color: black;
        text-decoration-color: #${base06};
        color: ${base06};
      	background-color: #${base00};
      	border-style: solid;
      	border-width: 1px;
      	background-repeat: no-repeat;
      	background-position: center;
      	background-size: 25%;
      }

      button:focus, button:active, button:hover {
      	background-color: #${base0D};
      	outline-style: none;
      }
    '';
  };
}

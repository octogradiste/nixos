{
  inputs,
  system,
  username,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles.${username} = {
      id = 0;
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${system}; [
          bitwarden
          ublock-origin
          multi-account-containers
        ];
      };
      settings = {
        "accessibility.typeaheadfind" = true;
        "signon.rememberSignons" = false;
      };
      containers = {
        personal = {
          name = "Personal";
          color = "blue";
          icon = "chill";
          id = 1;
        };
        epfl = {
          name = "EPFL";
          color = "red";
          icon = "briefcase";
          id = 2;
        };
        smartdog = {
          name = "SmartDog";
          color = "green";
          icon = "pet";
          id = 3;
        };
      };
      containersForce = true;
      bookmarks = {
        force = true;
        settings = [
          {
            name = "EPFL";
            bookmarks = [
              {
                name = "Moodle";
                keyword = "moodle";
                url = "https://moodle.epfl.ch/";
              }
              {
                name = "IS-Academia";
                keyword = "isa";
                url = "https://isa.epfl.ch";
              }
              {
                name = "Slack JE EPFL Projet Amarante";
                keyword = "slack";
                url = "https://jeepflprojetamarante.slack.com/";
              }
            ];
          }
          {
            name = "WhatsApp";
            keyword = "whatsapp";
            url = "https://web.whatsapp.com/";
          }
        ];
      };
    };
  };
}

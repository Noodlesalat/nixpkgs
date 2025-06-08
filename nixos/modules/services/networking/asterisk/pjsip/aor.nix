{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."aor" = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        type = mkOption {
          type = types.str;
          default = "aor";
          description = "Must be of type aor.";
        };

        contact = mkOption {
          type = types.str;
          default = "";
          description = "Permanent contacts assigned to AoR.";
        };

        default_expiration = mkOption {
          type = types.int;
          default = 3600;
          description = "Default expiration time in seconds for contacts dynamically bound to an AoR.";
        };

        mailboxes = mkOption {
          type = types.str;
          default = "";
          description = "Mailboxes to be associated with.";
        };

        maximum_expiration = mkOption {
          type = types.int;
          default = 7200;
          description = "Maximum time to keep an AoR.";
        };

        max_contacts = mkOption {
          type = types.int;
          default = 0;
          description = "Maximum number of contacts that can bind to an AoR.";
        };

        minimum_expiration = mkOption {
          type = types.int;
          default = 60;
          description = "Minimum keep alive time for an AoR.";
        };

        remove_existing = mkOption {
          type = types.bool;
          default = false;
          description = "Determines whether new contacts replace existing ones.";
        };

        qualify_frequency = mkOption {
          type = types.int;
          default = 0;
          description = "Interval at which to qualify an AoR.";
        };

        authenticate_qualify = mkOption {
          type = types.bool;
          default = false;
          description = "Authenticates a qualify request if needed.";
        };
      };
    });
    description = "PJSIP AoR configuration for Asterisk.";
  };
}

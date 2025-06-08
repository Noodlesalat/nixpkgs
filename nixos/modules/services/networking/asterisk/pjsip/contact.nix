{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."contact" = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        type = mkOption {
          type = types.str;
          default = "contact";
          description = "Must be of type contact.";
        };

        uri = mkOption {
          type = types.str;
          default = "";
          description = "SIP URI to contact peer.";
        };

        expiration_time = mkOption {
          type = types.str;
          default = "";
          description = "Time to keep alive a contact.";
        };

        qualify_frequency = mkOption {
          type = types.int;
          default = 0;
          description = "Interval at which to qualify a contact (seconds).";
        };
      };
    });
    description = "PJSIP contact configuration for Asterisk.";
  };
}

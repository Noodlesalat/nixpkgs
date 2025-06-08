{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."auth" = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        type = mkOption {
          type = types.str;
          default = "auth";
          description = "Must be of type auth.";
        };

        auth_type = mkOption {
          type = types.enum [ "userpass" ];
          default = "userpass";
          description = "Authentication type. Currently, only 'userpass' is supported.";
        };

        nonce_lifetime = mkOption {
          type = types.str;
          default = "32";
          description = "Lifetime in seconds of a nonce associated with this auth config.";
        };

        md5_cred = mkOption {
          type = types.str;
          default = "";
          description = "MD5 hash of the username and password, used instead of plain-text password.";
        };

        password = mkOption {
          type = types.str;
          default = "";
          description = "Plain-text password for authentication.";
        };

        realm = mkOption {
          type = types.str;
          default = "asterisk";
          description = "SIP realm for the endpoint.";
        };

        username = mkOption {
          type = types.str;
          default = "";
          description = "Username used for authentication.";
        };
      };
    });
    description = "PJSIP authentication configuration for Asterisk.";
  };
}

{ lib, ... }:
with lib;
{
  options.services.asterisk.settings."acl" = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        type = lib.mkOption {
          type = lib.types.str;
          default = "security";
          description = "Must be of type security.";
        };

        acl = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Name of IP ACL.";
        };

        contact_acl = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Name of Contact ACL.";
        };

        contact_deny = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "List of Contact Header addresses to Deny.";
        };

        contact_permit = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "List of Contact Header addresses to Permit.";
        };

        deny = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "List of IP domains to deny access from.";
        };

        permit = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "List of IP domains to allow access from.";
        };
      };
    });
    description = "Access Control List options for PJSIP in Asterisk.";
  };
}

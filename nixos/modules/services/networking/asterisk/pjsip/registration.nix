{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."registration" = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        type = lib.mkOption {
          type = lib.types.str;
          default = "registration";
          description = "Must be of type registration.";
        };

        auth_rejection_permanent = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Determines whether failed authentication challenges are treated as permanent failures.";
        };

        client_uri = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Client SIP URI used when attempting outbound registration.";
        };

        contact_user = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Contact User to use in request.";
        };

        expiration = lib.mkOption {
          type = lib.types.int;
          default = 3600;
          description = "Expiration time for registrations in seconds.";
        };

        max_retries = lib.mkOption {
          type = lib.types.int;
          default = 10;
          description = "Maximum number of registration attempts.";
        };

        outbound_auth = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Authentication object to be used for outbound registrations.";
        };

        outbound_proxy = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Outbound Proxy used to send registrations.";
        };

        retry_interval = lib.mkOption {
          type = lib.types.int;
          default = 60;
          description = "Interval in seconds between retries if outbound registration is unsuccessful.";
        };

        server_uri = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "SIP URI of the server to register against.";
        };

        transport = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Transport used for outbound authentication.";
        };
      };
    });
    description = "Outbound registration options for PJSIP in Asterisk.";
  };
}

{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."system" = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        type = mkOption {
          type = types.str;
          default = "system";
          description = "Must be of type system.";
        };

        timer_t1 = mkOption {
          type = types.int;
          default = 500;
          description = "Set transaction timer T1 value in milliseconds.";
        };

        timer_b = mkOption {
          type = types.int;
          default = 32000;
          description = "Set transaction timer B value in milliseconds.";
        };

        compact_headers = mkOption {
          type = types.bool;
          default = false;
          description = "Use the short forms of common SIP header names.";
        };

        threadpool_initial_size = mkOption {
          type = types.int;
          default = 0;
          description = "Initial number of threads in the res_pjsip threadpool.";
        };

        threadpool_auto_increment = mkOption {
          type = types.int;
          default = 5;
          description = "Amount by which the number of threads is incremented when necessary.";
        };

        threadpool_idle_timeout = mkOption {
          type = types.int;
          default = 60;
          description = "Number of seconds before an idle thread should be disposed of.";
        };

        threadpool_max_size = mkOption {
          type = types.int;
          default = 0;
          description = "Maximum number of threads in the res_pjsip threadpool. 0 = no maximum.";
        };
      };
    });
    description = "PJSIP system-wide configuration for Asterisk.";
  };
}

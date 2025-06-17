{ ... }:
{
  accounts.email = {
    maildirBasePath = "mails";
    accounts = {
      "infomaniak" = {
        primary = true;
        address = "colin.berger@ik.me";
        userName = "colin.berger@ik.me";
        realName = "Colin Berger";
        imap = {
          host = "mail.infomaniak.com";
          port = 993;
          tls.enable = true;
        };
        smtp = {
          host = "mail.infomaniak.com";
          port = 465;
          tls.enable = true;
        };
        thunderbird.enable = true;
      };
    };
  };
}

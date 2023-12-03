{...}:
{
  nix.settings.trusted-users = ["rubsad"];

  users.groups.rubsad = {};

  users.users.rubsad = {
    hashedPassword = "$6$ERbtYxGG9UYH8.0j$0Ww2//INdN.DsX1wJu1K.EUikuW/TdFTUyAHHpgtbZrZXqLvi33iG1Id3Na4wR6y6.jaKXQwzGMm8IHVkghM01";
    home = "/home/rubsad";
    isNormalUser = true;
    extraGroups = [
      "rubsad"
      "users"
      "networkmanager"
      "wheel"
    ];
  };
}
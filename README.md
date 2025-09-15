# tcp BRUTAL flake

## Installing
Add this flake into your inputs:
```nix
{
  inputs.tcp-brutal = {
    url = "github:chlorodose/tcp-brutal-flake/main";
  };
}
```
Then import module into your nixos config:
```nix
modules = [ inputs.tcp-brutal.nixosModules.default ];
```

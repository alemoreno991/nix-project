# Home-Manager

The intention is to group all the user-related configurations under this directory.

- `home.nix`: is the entrypoint of the user-related configuration. Ideally it should
            be very short and mostly be used to import configurations of individual
            modules.

- `home-packages.nix`: is used to group all the packages that the user wants to have
            access to.

- `modules/`: is a directory used to group the packages that require custom settings.
            Ideally, these modules could potentially be shared by different users.

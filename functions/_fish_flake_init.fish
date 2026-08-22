function _fish_flake_init
    if not set -q $argv[1]
        set -l template "github:nixos/templates#utils-generic"
    else
        set -l template $argv[1]
    end

    if test -f flake.nix
        echo (set_color red) "flake.nix already exists"
        return 1
    end

    nix flake init -t $template

    if type -q direnv
        if not test -f .envrc
            echo "use flake" >.envrc
        else if not grep -q "use flake" .envrc
            echo "use flake" >>.envrc
        end

        direnv allow
    end
end

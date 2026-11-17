function _fish_flake_init
    if set -q flake_default
        set -f template $flake_default
    else
        set -f template "github:nixos/templates#utils-generic"
    end

    if set -q flake_default_repository
        set -f template_repository $flake_default_repository
    else
        set -f template_repository "github:nixos/templates"
    end

    if set -q argv[1]
        if not string match -qr '[#:/]' -- $argv[1]
            set template "$template_repository#$argv[1]"
        else
            set template $argv[1]
        end
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

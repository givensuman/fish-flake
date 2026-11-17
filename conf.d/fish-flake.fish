if not type -q nix
    echo "you're sourcing the plugin for nix flakes"
    echo "but don't have nix installed"
else
    if not type -q nix flake
        echo "you're sourcing the plugin for nix flakes"
        echo "but don't have flakes enabled"
        echo "https://nixos.wiki/wiki/flakes"
    end
end

function _fish_flake
    set -l cmd $argv[1]
    set -e argv[1]

    switch "$cmd"
        case init
            _fish_flake_init $argv
        case update
            _fish_flake_update
        case status
            _fish_flake_status
        case clean
            _fish_flake_clean
        case list
            _fish_flake_list
        case "*"
            echo (set_color red) "unknown command. try one of:"
            echo (set_color red) "init | update | status | clean | list"
    end
end

alias flake _fish_flake

function _fish_flake_install --on-event fish-flake_install
end

function _fish_flake_uninstall --on-event fish-flake_uninstall
    functions --erase _fish_flake
    functions --erase flake
    functions --erase _fish_flake_init
    functions --erase _fish_flake update
    functions --erase _fish_flake_status
    functions --erase _fish_flake_clean
    functions --erase _fish_flake_list
    set --erase flake_default
    set --erase flake_default_repository
end

function _fish_flake_update --on-event fish-flake_update
    _fish_flake_uninstall
    _fish_flake_install
end


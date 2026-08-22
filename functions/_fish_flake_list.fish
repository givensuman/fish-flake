function _fish_flake_list
    if not test -f flake.nix
        echo (set_color yellow) "no flake.nix in current directory"
        return 2
    end

    nix eval .#devShells.\
      (nix eval --raw \
      --impure \
      --expr "builtins.currentSystem").\
      default.buildInputs --json 2>/dev/null \
      | string match -r '"[^"]+"' \
      | string trim -c '"'
end

{
    pkgs ? import <nixpkgs> {},
    pythonDeps ? ps: with ps; [ libvirt ]
} :
let
    python3 = (pkgs.python311.withPackages pythonDeps);
    #python3 = pkgs.python311;
    #ansible = pkgs.ansible.override {inherit python3;};
    ansible = pkgs.ansible.overrideAttrs (oldAttrs: {
        python = python3;
    });
in
pkgs.mkShell {
    #LC_ALL="en_US.UTF-8"; # Doesn't work. Idk why.
    LC_ALL="C.UTF-8";
    ANSIBLE_PYTHON_INTERPRETER="${pkgs.python311.withPackages pythonDeps}/bin/python3";
    packages = with pkgs; [ 
        ansible 
        ];
}

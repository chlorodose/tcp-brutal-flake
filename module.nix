{
  lib,
  stdenv,
  kernel,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "tcp-brutal";
  version = "v1.0.3-${kernel.version}";

  src = fetchFromGitHub {
    owner = "apernet";
    repo = "tcp-brutal";
    tag = "v1.0.3";
    hash = "sha256-rx8JgQtelssslJhFAEKq73LsiHGPoML9Gxvw0lsLacI=";
  };

  nativeBuildInputs = kernel.moduleBuildDependencies;

  installPhase = ''
    runHook preInstall
    export INSTALL_MOD_PATH=''$out
    make -C ''$KERNEL_DIR M=''$(pwd) modules_install
    runHook postInstall
  '';

  env = {
    KERNEL_RELEASE = kernel.modDirVersion;
    KERNEL_DIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  };

  meta = with lib; {
    description = "TCP congestion control algorithm called brutal.";
    license = licenses.gpl3Only;
    platforms = [
      "i686-linux"
      "x86_64-linux"
    ];
    broken = kernel.kernelOlder "5.8";
  };
}

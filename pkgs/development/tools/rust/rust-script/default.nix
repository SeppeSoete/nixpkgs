{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rust-script";
  version = "0.24.0";

  src = fetchFromGitHub {
    owner = "fornwall";
    repo = pname;
    rev = version;
    sha256 = "sha256-l6YGVfI9QSa+6x8M7cJ2rnFyzUbpuvMVJRXRhestLHs=";
  };

  cargoSha256 = "sha256-HgdAvBDsMzC19nckLI5f8XumJMH72H9YRIY3sjtmRco=";

  # tests require network access
  doCheck = false;

  meta = with lib; {
    description = "Run Rust files and expressions as scripts without any setup or compilation step";
    homepage = "https://rust-script.org";
    changelog = "https://github.com/fornwall/rust-script/releases/tag/${version}";
    license = with licenses; [ mit /* or */ asl20 ];
    maintainers = with maintainers; [ figsoda ];
  };
}

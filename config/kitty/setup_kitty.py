from pathlib import Path
from shutil import copy
from subprocess import run


def main() -> None:
    run(
        "sudo pacman -S kitty  ttf-meslo-nerd --noconfirm",
        shell=True,
        check=True,
    )
    path: Path = Path.home() / ".config" / "kitty"
    path.mkdir(parents=True, exist_ok=True)
    idk: Path = Path(__file__).parent
    files: list[str] = ["kitty.conf", "nord.conf"]
    for i in files:
        copy(src=f"{idk}/{i}", dst=path)


if __name__ == "__main__":
    main()

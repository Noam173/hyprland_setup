from pathlib import Path
from shutil import copy
from subprocess import run


def main() -> None:
    run(
        "sudo pacman -S hyprland slurp grim wl-clipboard --noconfirm && clear",
        shell=True,
        check=True,
    )
    path: Path = Path(__file__).parent
    idk: Path = Path.home() / ".config" / "hypr"
    idk.mkdir(parents=True, exist_ok=True)
    copy(src=f"{path}/hyprland.conf", dst=idk)


if __name__ == "__main__":
    main()

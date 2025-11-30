from pathlib import Path
from shutil import copy
from subprocess import run


def main() -> None:
    run("sudo pacman -S fastfetch bat --noconfirm", shell=True, check=True)
    path: Path = Path(__file__).parent
    copy(src=f"{path}/.bashrc", dst=Path.home())


if __name__ == "__main__":
    main()

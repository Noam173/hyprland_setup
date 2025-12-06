from pathlib import Path
from shutil import copy


def main() -> None:
    path: Path = Path.home() / ".config" / "waybar"
    path.mkdir(parents=True, exist_ok=True)
    idk: Path = Path(__file__).parent
    files: list[str] = ["config.jsonc", "style.css"]
    for i in files:
        copy(src=f"{idk}/{i}", dst=path)


if __name__ == "__main__":
    main()

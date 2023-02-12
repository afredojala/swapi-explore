"""For creating raw templates"""
import shutil
import requests
from pathlib import Path

def copy_template(endpoint):
    """Copies template with endpoint inserted"""
    src = Path("starter/raw_template.py")
    with src.open('r') as f:
        tmp = f.read().replace("{{endpoint}}", endpoint)
    dst = Path(f"models/raw/raw_{endpoint}.py")
    with dst.open('w') as f:
        f.write(tmp)


def main():
    Path("models/raw/").mkdir(parents=True, exist_ok=True)
    response = requests.get("https://swapi.dev/api/")
    endpoints = [copy_template(k) for k in response.json().keys()]


if __name__ == "__main__":
    main()






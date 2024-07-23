#!/usr/bin/env python3

import os
import sys
import zipfile
import argparse
import requests


try:
    from tqdm import tqdm

    tqdm_installed = True
except ImportError:
    tqdm_installed = False
    print("tqdm not installed, will not show progress bar.")

fonts_map = {
    # 思源宋体
    "han_serif": "https://github.com/adobe-fonts/source-han-serif/releases/download/2.002R/09_SourceHanSerifSC.zip",
    # lora
    "lora": "https://github.com/cyrealtype/Lora-Cyrillic/releases/download/v3.005/Lora-v3.005.zip",
    # firacode nerd fonts mono
    "firacode": "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip",
}


def download_and_extract(url, filename):
    response = requests.get(url, stream=True)
    total_size = int(response.headers.get("content-length", 0))
    block_size = 1024
    downloaded_size = 0
    current_dir = os.path.abspath(os.path.dirname(__file__))
    filename_abs_path = os.path.join(current_dir, f"{filename}.zip")

    if tqdm_installed:
        progress_bar = tqdm(total=total_size, unit="iB", unit_scale=True)

    with open(filename_abs_path, "wb") as file:
        for data in response.iter_content(block_size):
            downloaded_size += len(data)
            file.write(data)
            if tqdm_installed:
                progress_bar.update(len(data))
            else:
                progress = downloaded_size / total_size * 100
                print(f"Download {filename}: {progress:.2f}%")

    with zipfile.ZipFile(filename_abs_path, "r") as zip_ref:
        zip_ref.extractall(filename_abs_path)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--proxy", action="store_true", help="Use proxy to download.")
    args = parser.parse_args()
    download_proxy = ""

    if args.proxy:
        download_proxy = "https://mirror.ghproxy.com/"

    for font_name, url in fonts_map.items():
        print(f"Downloading {font_name}...")
        download_and_extract(f"{download_proxy}{url}", font_name)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nCancelled by user.")
        sys.exit(0)

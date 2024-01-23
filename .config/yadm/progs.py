import json
from tabulate import tabulate
import pandas as pd


def main():
    with open("./progs.json", "r") as f:
        outer = json.load(f)

        for title, table in outer.items():
            print("\t" + "#" * (len(title) + 8))
            print(f"\t### {title} ###")
            print("\t" + "#" * (len(title) + 8))
            df = pd.DataFrame(
                list(table.items()), columns=["Program", "Link/Installation"]
            )

            table = tabulate(
                df,
                # headers="keys",
                tablefmt="pretty",
                showindex=False,
                colalign=("right", "left"),
            )

            print(table)
            print()


if __name__ == "__main__":
    main()

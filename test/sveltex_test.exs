defmodule SveltexTest do
  use ExUnit.Case
  doctest Sveltex

  test "basic test" do
    assert Sveltex.render("test", %{}) ==
             {:safe,
              [
                60,
                "div",
                [
                  [32, "data-props", 61, 34, "{}", 34],
                  [32, "id", 61, 34, "sveltex-test", 34]
                ],
                62,
                [],
                60,
                47,
                "div",
                62
              ]}
  end

  test "with props" do
    assert Sveltex.render("header", %{name: "virkill"}) ==
             {:safe,
              [
                60,
                "div",
                [
                  [
                    32,
                    "data-props",
                    61,
                    34,
                    [
                      [
                        [[[[], "{" | "&quot;"], "name" | "&quot;"], ":" | "&quot;"],
                        "virkill"
                        | "&quot;"
                      ]
                      | "}"
                    ],
                    34
                  ],
                  [32, "id", 61, 34, "sveltex-header", 34]
                ],
                62,
                [],
                60,
                47,
                "div",
                62
              ]}
  end
end

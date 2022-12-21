defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert 1+1 == 2
  end

  test "create deck of 20 cards" do
    deck_len=length(Cards.create_deck)
    assert deck_len == 32
  end

  test "shuffling a deck randomizes it" do
    deck =Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end
end

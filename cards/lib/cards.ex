defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """
  def create_deck do
    values =["Ace","Two","Three","Four","Five","King","Queen","Jack"]
    suits = ["spades","Clubs","Hearts","Diamonds"]
    #list comprehension

    #opt1
#    cards = for suit <- suits do
#       for value <- values do
#        "#{value} of #{suit}"
#       end
#     end
#
#     List.flatten(cards)

     #opt2
    for suit<- suits, value <- values do
        "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc"""
    Determines if a deck contains a certain card

    ## Example
    iex> Cards.contains?(Cards.create_deck,"Ace of spades")
    true
"""
  def contains?(deck,card) do
    Enum.member?(deck,card)
  end

  @doc"""
## Example
#    iex> deck=Cards.create_deck
#    iex> {hand,deck}=Crads.deal(deck,1)
#    iex> hand
#    ["Five of Clubs"]

"""
  def deal(hand_size) do
    {deal_card,_rest} = Enum.split(Enum.shuffle(Cards.create_deck),hand_size)
    deal_card
  end

  def deal(deck, hand_size) do
    Enum.split(Enum.shuffle(deck),hand_size)
  end

  def save(deck,file_name) do
    binary = :erlang.term_to_binary(deck) #turns into a object that can be saved
    File.write(file_name,binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok,binary}->:erlang.binary_to_term(binary)
      {:error,_reason}->"The file does not exist" # use _ followed by var name if there will be an unused variable
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end

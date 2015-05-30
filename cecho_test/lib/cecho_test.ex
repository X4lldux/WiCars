defmodule CechoTest do
  use Application

  def start(_, _) do
    IO.puts "Hello"
    :encurses.initscr()
    :encurses.keypad(0, true)
    :encurses.curs_set(0)
    :encurses.erase()
    :encurses.refresh()
    IO.inspect :encurses.getch
  end

  def start2(_, _) do
    :cecho.cbreak()
    # :cecho.noecho()
    :cecho.curs_set(0)
    :cecho.mvaddstr(0, 0, "Hello World!")
    :cecho.refresh()

    # c = :cecho.getch()
    # IO.inspect c
    # case c do
    #   ?q ->
    #     :application.stop(:cecho)
    #     :erlang.halt()
    # end
  end
end

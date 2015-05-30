defmodule NcursesTest do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(NcursesTest.Worker, [arg1, arg2, arg3])

      worker(Task, [
          fn ->
            # :encurses.initscr()
            # :encurses.keypad(0, true)
            # :encurses.curs_set(0)
            # :encurses.noecho
            # :encurses.erase
            # :encurses.refresh

            :cecho.cbreak
            :cecho.noecho
            :cecho.keypad(0, true)
            NcursesTest.keyloop(self, 0)
          end
          ])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NcursesTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def keyloop2(p) do
    :encurses.noecho
    c = :encurses.getch
    :encurses.erase()
    if c != -1 do
      IO.inspect c
      :encurses.mvaddstr(10, 10, inspect(c) |> String.to_char_list)
      :encurses.refresh()
    end
    if c == 27 do
      :encurses.endwin
      Process.exit p, :kill
      Process.exit self, :kill
    end

    NcursesTest.keyloop(p, 0)
  end

  def keyloop(p, l) do
    :cecho.noecho
    c = case :cecho.getch do
          258 -> :down
          259 -> :up
          260 -> :left
          261 -> :right

          113 -> :upleft
          119 -> :up
          101 -> :upright
           97 -> :left
          115 -> :down
          100 -> :right
          122 -> :downleft
           99 -> :downright

          c  -> c
        end
    :cecho.erase()
    :cecho.mvaddstr(l, 0, inspect(c) |> String.to_char_list)
    :cecho.refresh()

    NcursesTest.keyloop(p, l+1)
  end
end

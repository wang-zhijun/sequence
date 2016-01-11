defmodule Sequence do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  # `start`関数がこのapplicationの為，supervisorを作る
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Sequence.Server, [123]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sequence.Supervisor]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end
end

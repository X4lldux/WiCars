defmodule MqttTest do
  def start(_type, _args) do
    IO.inspect "Bazinga"

    # {:ok, pid} = MqttTest.Client.start_link(%{})
    options = [
      client_id: Application.get_env(:mqtt_test, :client_id) ,
      host: Application.get_env(:mqtt_test, :mqtt_server) |> String.to_char_list,
      port: 1883
    ]

    # MqttTest.Client.connect(pid, options)
    # MqttTest.Client.ping(pid)
    # MqttTest.Client.subscribe(pid, [id: 1234, topics: ["/wicar0"], qoses: [0]])

    {:ok, c} = :emqttc.start_link(options)
    :emqttc.subscribe(c, "wicar0", :qos0)
    :emqttc.publish(c, "wicar0", "w")
    :emqttc.publish(c, "wicar0", "w")
    :emqttc.publish(c, "wicar0", "w")
    :emqttc.publish(c, "wicar0", "w")
    :emqttc.publish(c, "wicar0", "q")
    :emqttc.publish(c, "wicar0", "a")
    :emqttc.publish(c, "wicar0", "q")
    :emqttc.publish(c, "wicar0", "q")
    :emqttc.publish(c, "wicar0", "w")
    :emqttc.publish(c, "wicar0", "w")
    :emqttc.publish(c, "wicar0", "e")
    :emqttc.publish(c, "wicar0", "d")
    :emqttc.publish(c, "wicar0", "d")
    :emqttc.publish(c, "wicar0", "d")

    receive do
      {:publish, topic, payload} ->
        :io.format("Message Received from ~s: ~p~n", [topic, payload])
    end

    # :emqttc.disconnect(c)
    # :dbg.p(pid, [:c, :m])

    loop
  end

  def loop do
    receive do
      x ->
        IO.inspect x
        loop
    end
  end
end

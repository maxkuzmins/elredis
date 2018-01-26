defmodule Elredis.Pool do
  @moduledoc false
  # TODO - Interface to pooler
  # TODO - config validation, pool start & stop functions.

  def validate_env() do
    :ok
  end

  def init_pools() do

  end

#  defp init_pool()

#  defp compose_redis_cluster_node_pool_member_config(memberName, groupName, maxCount, initCount, cullInterval, maxAge,
#         queueMax) do
#    [
#      {:name, memberName},
#      {:group, groupName},
#      {:max_count, maxCount},
#      {:init_count, initCount},
#      {:cull_interval, cullInterval},
#      {:max_age, maxAge},
#      {:queue_max, queueMax},
#      {:start_mfa, {rub_ab_pool, start_ab_redis_pool_connection, [memberName]}},
#      {:stop_mfa, {rub_ab_pool, stop_ab_redis_pool_connection, ['$pooler_pid']}}
#    ]
#
#  end

# TODO - remove
#        MaxCount,
#        InitCount,
#        CullInterval,
#        MaxAge,
#        QueueMax) ->
#    [
#        {name, PoolMemberName},
#        {group, ab_redis},
#        {max_count, MaxCount},
#        {init_count, InitCount},
#        {cull_interval, CullInterval},
#        {max_age, MaxAge},
#        {queue_max, QueueMax},
#        {start_mfa, {rub_ab_pool, start_ab_redis_pool_connection, [PoolMemberName]}},
#        {stop_mfa, {rub_ab_pool, stop_ab_redis_pool_connection, ['$pooler_pid']}}
#    ].

end

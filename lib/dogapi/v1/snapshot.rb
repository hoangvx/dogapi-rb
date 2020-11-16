# Unless explicitly stated otherwise all files in this repository are licensed under the BSD-3-Clause License.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2011-Present Datadog, Inc.

require 'dogapi'
require 'json'

module Dogapi
  class V1 # for namespacing

    class SnapshotService < Dogapi::APIService

      API_VERSION = 'v1'

      def snapshot(start_ts, end_ts, metric_query: nil, event_query: nil, graph_def: nil)
        extra_params = {
          :start => start_ts,
          :end => end_ts,
        }

        extra_params[:event_query] = event_query if event_query
        extra_params[:metric_query] = metric_query if metric_query
        extra_params[:graph_def] = JSON.generate(graph_def) if graph_def

        request(Net::HTTP::Get, "/api/#{API_VERSION}/graph/snapshot", extra_params, nil, false)
      end

    end

  end
end

open Async
open Binance

type topic =
  | Trade
  | Depth

type stream = private {
  topic : topic ;
  symbol : string ;
}
val create_stream : topic:topic -> symbol:string -> stream
val stream_of_string : string -> stream

type event =
  | Trade of Trade.t
  | Depth of Depth.t

val connect :
  ?buf:Bi_outbuf.t ->
  ?connected:unit Condition.t ->
  stream list ->
  event Pipe.Reader.t

val with_connection :
  ?buf:Bi_outbuf.t ->
  ?connected:unit Condition.t ->
  stream list ->
  f:(event Pipe.Reader.t -> 'a Deferred.t) -> 'a Deferred.t

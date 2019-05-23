open Async

open Binance_ws

val connect :
  ?buf:Bi_outbuf.t ->
  ?connected:unit Condition.t ->
  Stream.t list ->
  event Pipe.Reader.t

val with_connection :
  ?buf:Bi_outbuf.t ->
  ?connected:unit Condition.t ->
  Stream.t list ->
  f:(event Pipe.Reader.t -> 'a Deferred.t) -> 'a Deferred.t
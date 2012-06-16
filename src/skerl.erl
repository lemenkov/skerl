%% -------------------------------------------------------------------
%%
%% Copyright (c) 2012 Peter Lemenkov.
%%
%% The MIT License
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in
%% all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%% THE SOFTWARE.
%%
%% -------------------------------------------------------------------

-module(skerl).

% Erlang NIF API
-export([init/0]).

% Skein hash API
-export([final/1, hash/2, hexhash/2, init/1, update/2]).

-on_load(init/0).

init() ->
    case code:priv_dir(skerl) of
        {error, bad_name} ->
            SoName = filename:join("../priv", "skerl_nifs");
        Dir ->
            SoName = filename:join(Dir, "skerl_nifs")
    end,
    erlang:load_nif(SoName, 0).

init(_Bits) ->
    exit("NIF library not loaded").

update(_State, _Data) ->
    exit("NIF library not loaded").

final(_State) ->
    exit("NIF library not loaded").

hexhash(Bits, Data) ->
  {ok, Hash} = hash(Bits, Data),
  list_to_binary(hex:bin_to_hexstr(Hash)).

hash(_Bits, _Data) ->
    exit("NIF library not loaded").

(**************************************************************************)
(*     Sail                                                               *)
(*                                                                        *)
(*  Copyright (c) 2013-2017                                               *)
(*    Kathyrn Gray                                                        *)
(*    Shaked Flur                                                         *)
(*    Stephen Kell                                                        *)
(*    Gabriel Kerneis                                                     *)
(*    Robert Norton-Wright                                                *)
(*    Christopher Pulte                                                   *)
(*    Peter Sewell                                                        *)
(*    Alasdair Armstrong                                                  *)
(*    Brian Campbell                                                      *)
(*    Thomas Bauereiss                                                    *)
(*    Anthony Fox                                                         *)
(*    Jon French                                                          *)
(*    Dominic Mulligan                                                    *)
(*    Stephen Kell                                                        *)
(*    Mark Wassell                                                        *)
(*                                                                        *)
(*  All rights reserved.                                                  *)
(*                                                                        *)
(*  This software was developed by the University of Cambridge Computer   *)
(*  Laboratory as part of the Rigorous Engineering of Mainstream Systems  *)
(*  (REMS) project, funded by EPSRC grant EP/K008528/1.                   *)
(*                                                                        *)
(*  Redistribution and use in source and binary forms, with or without    *)
(*  modification, are permitted provided that the following conditions    *)
(*  are met:                                                              *)
(*  1. Redistributions of source code must retain the above copyright     *)
(*     notice, this list of conditions and the following disclaimer.      *)
(*  2. Redistributions in binary form must reproduce the above copyright  *)
(*     notice, this list of conditions and the following disclaimer in    *)
(*     the documentation and/or other materials provided with the         *)
(*     distribution.                                                      *)
(*                                                                        *)
(*  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''    *)
(*  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED     *)
(*  TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A       *)
(*  PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR   *)
(*  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,          *)
(*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT      *)
(*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF      *)
(*  USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND   *)
(*  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,    *)
(*  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT    *)
(*  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF    *)
(*  SUCH DAMAGE.                                                          *)
(**************************************************************************)

open Array

(** A mutable array based graph type, with nodes indexed by integers. *)
type 'a array_graph

(** Create an empty array_graph, specifying the initial size of the
   underlying array. *)
val make : initial_size:int -> unit -> 'a array_graph

(** Add a vertex to a graph, returning the index of the inserted
   vertex. If the number of vertices exceeds the size of the
   underlying array, then it is dynamically resized. *)
val add_vertex : 'a -> 'a array_graph -> int

(** Add an edge between two existing vertices. Raises Invalid_argument
   if either of the vertices do not exist. *)
val add_edge : int -> int -> 'a array_graph -> unit

type cf_node =
  | CF_label of string
  | CF_block of Jib.instr list
  | CF_guard of Jib.cval
  | CF_start

val control_flow_graph : Jib.instr list -> int * int list * ('a list * cf_node) array_graph

(** [immediate_dominators graph root] will calculate the immediate
   dominators for a control flow graph with a specified root node. *)
val immediate_dominators : 'a array_graph -> int -> int array

type ssa_elem =
  | Phi of Ast.id * Ast.id list
  | Pi of Jib.cval list

(** Convert a list of instructions into SSA form *)
val ssa : Jib.instr list -> (ssa_elem list * cf_node) array_graph

(** Output the control-flow graph in graphviz format for
   debugging. Can use 'dot -Tpng X.gv -o X.png' to generate a png
   image of the graph. *)
val make_dot : out_channel -> (ssa_elem list * cf_node) array_graph -> unit

val make_dominators_dot : out_channel -> int array -> (ssa_elem list * cf_node) array_graph -> unit

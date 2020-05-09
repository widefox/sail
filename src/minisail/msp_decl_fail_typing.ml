
open Msp_ast
open PPrintEngine
open PPrintCombinators

module SatisInductive : sig
  val upto : Arith.nat -> Arith.nat list
  val wf_g_aux :
    (SyntaxVCT.xp * Contexts.g_entry) list ->
      (SyntaxVCT.xp * Contexts.g_entry) list -> bool
  val wf_g : ('a, 'b) Contexts.gamma_ext -> bool
  val z3eq : Z3.z3_expr -> Z3.z3_expr -> Z3.z3_bool_expr
  val z3and : Z3.z3_bool_expr list -> Z3.z3_bool_expr
  val convert_b_i_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.vp ->
        SyntaxVCT.bp -> (Z3.z3_type * Z3.z3_bool_expr) Predicate.pred
  val convert_blist_i_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.vp ->
        SyntaxVCT.bp list ->
          (Z3.z3_type list * Z3.z3_bool_expr list) Predicate.pred
  val convert_l : SyntaxVCT.lit -> Z3.z3_expr
  val convert_v : SyntaxVCT.vp -> Z3.z3_expr
  val convert_ce : SyntaxVCT.cep -> Z3.z3_expr
  val convert_c : SyntaxVCT.cp -> Z3.z3_bool_expr
  val convert_t_i_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.vp ->
        SyntaxVCT.tau -> (Z3.z3_type * Z3.z3_bool_expr) Predicate.pred
  val convert_ft_list_i_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.vp ->
        (string * SyntaxVCT.tau) list ->
          ((string * Z3.z3_type) list * Z3.z3_bool_expr list) Predicate.pred
  val freshen_type : Z3.z3_type -> Z3.z3_type
  val freshen_type_var : Z3.z3_type_var -> Z3.z3_type_var
  val freshen_constr : Z3.z3_constr -> Z3.z3_constr
  val freshen_decl : Z3.z3_decl -> Z3.z3_decl
  val b_t_vars : SyntaxVCT.bp -> string list
  val t_t_vars : SyntaxVCT.tau -> string list
  val convert_typedef_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.xp * SyntaxPED.typdef -> Z3.z3_decl Predicate.pred
  val pp_z3_type : Z3.z3_type -> string
  val pp_z3_type_var : Z3.z3_type_var -> string
  val pp_z3_fields : (string * Z3.z3_type_var) list -> string
  val pp_z3_ty_constr : Z3.z3_constr -> string
  val pp_z3_decl : Z3.z3_decl -> string
  val pp_typedef_i_Pii_o :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.xp * SyntaxPED.typdef -> string Predicate.pred
  val pp_typedef_list_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxVCT.xp * SyntaxPED.typdef) list -> (string list) Predicate.pred
  val minimise_td_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxVCT.xp * Contexts.g_entry) list ->
        ((SyntaxVCT.xp * SyntaxPED.typdef) list) Predicate.pred
  val pp_z3_expr : Z3.z3_expr -> string
  val pp_z3_bool_expr : Z3.z3_bool_expr -> string
  val rewrite_passes :
    'a -> 'b -> Z3.z3_decl list ->
                  Z3.z3_bool_expr -> Z3.z3_decl list * Z3.z3_bool_expr
  val z3_vector_sort : string
  val pp_bv_concats : Arith.int -> string list
  val td_t_vars : SyntaxPED.typdef -> string list
  val pp_sort_decl :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext -> string list
  val bv_consts_v : SyntaxVCT.vp -> SyntaxVCT.lit list
  val bv_consts_ce : SyntaxVCT.cep -> SyntaxVCT.lit list
  val bv_consts_c : SyntaxVCT.cp -> SyntaxVCT.lit list
  val c_of_e : Contexts.g_entry -> SyntaxVCT.cp
  val bv_consts_aux :
    (SyntaxVCT.xp * Contexts.g_entry) list -> SyntaxVCT.lit list
  val z3_vector_lookup : string
  val convert_bitvec : string -> string
  val pp_bitvec : SyntaxVCT.lit -> string list
  val pp_bv_consts :
    ('a, unit) Contexts.gamma_ext ->
      (SyntaxVCT.xp * Contexts.g_entry) list -> SyntaxVCT.cp -> string list
  val pp_z3_vector_funs : string
  val pp_z3_exp_pred : Arith.nat -> string
  val z3_declare_tuple : Arith.int -> Z3.z3_decl
  val pp_tuples : Arith.int -> string list
  val pp_builtins : Arith.int -> string list
  val max_tuples : Arith.int
  val convert_smt_problem_final_i_i_i_i_i_i_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext ->
        (SyntaxVCT.xp * Contexts.g_entry) list ->
          SyntaxVCT.cp ->
            (SyntaxVCT.xp * Contexts.g_entry) list ->
              Z3.z3_decl list ->
                'b list -> Z3.z3_bool_expr -> (string list) Predicate.pred
  val convert_x : SyntaxVCT.xp -> string
  val convert_xbc_i_i_i_i_Poo :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.xp ->
        SyntaxVCT.bp ->
          SyntaxVCT.cp -> (Z3.z3_decl list * Z3.z3_bool_expr) Predicate.pred
  val subst_c_z : SyntaxVCT.xp -> SyntaxVCT.cp -> SyntaxVCT.cp
  val convert_g_aux_i_i_Poo :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxVCT.xp * Contexts.g_entry) list ->
        (Z3.z3_decl list * Z3.z3_bool_expr list) Predicate.pred
  val convert_smt_problem_valid_i_i_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext ->
        (SyntaxVCT.xp * Contexts.g_entry) list ->
          SyntaxVCT.cp ->
            ((SyntaxVCT.xp * Contexts.g_entry) list *
              (Z3.z3_decl list * (Z3.z3_decl list * Z3.z3_bool_expr)))
              Predicate.pred
  val pp_smt_problem_valid_i_i_i_i_o :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext ->
        (SyntaxVCT.xp * Contexts.g_entry) list ->
          SyntaxVCT.cp -> (string list) Predicate.pred
  val valid_i_i_i_i_i_i_i :
    string ->
      Location.loc ->
        unit ContextsPiDelta.theta_ext ->
          ('a, unit) Contexts.gamma_ext ->
            (SyntaxVCT.xp * Contexts.g_entry) list ->
              SyntaxVCT.cp -> bool -> unit Predicate.pred
  val valid :
    string ->
      Location.loc ->
        unit ContextsPiDelta.theta_ext ->
          ('a, unit) Contexts.gamma_ext ->
            (SyntaxVCT.xp * Contexts.g_entry) list ->
              SyntaxVCT.cp -> bool -> bool
  val valid_i_i_i_i_i_i_o :
    string ->
      Location.loc ->
        unit ContextsPiDelta.theta_ext ->
          ('a, unit) Contexts.gamma_ext ->
            (SyntaxVCT.xp * Contexts.g_entry) list ->
              SyntaxVCT.cp -> bool Predicate.pred
end = struct

let rec upto
  i = (if Arith.equal_nat i Arith.zero_nat then [Arith.zero_nat]
        else Arith.suc (Arith.minus_nat i Arith.one_nat) ::
               upto (Arith.minus_nat i Arith.one_nat));;

let rec wf_g_aux
  x0 g = match x0, g with [], g -> true
    | (xp, Contexts.GEPair (bp, cp)) :: ga, g ->
        (if Set.less_eq_set SyntaxVCT.equal_xp (Set.Set (Subst.fvs_cp cp))
              (Set.image Product_Type.fst (Set.Set g))
          then wf_g_aux ga g
          else (let _ = Debug.trace ("wf_g fails in " ^ Contexts.pp_cp cp) in
                 false));;

let rec wf_g g = wf_g_aux (Contexts.gamma_x g) (Contexts.gamma_x g);;

let rec z3eq
  e1 e2 = match e1, e2 with
    Z3.Z3E_true, Z3.Z3E_eq (e1, e2) -> Z3.Z3BE_eq (e1, e2)
    | Z3.Z3E_true, Z3.Z3E_leq (e1, e2) -> Z3.Z3BE_leq (e1, e2)
    | Z3.Z3E_num v, e2 -> Z3.Z3BE_eq (Z3.Z3E_num v, e2)
    | Z3.Z3E_var v, e2 -> Z3.Z3BE_eq (Z3.Z3E_var v, e2)
    | Z3.Z3E_false, e2 -> Z3.Z3BE_eq (Z3.Z3E_false, e2)
    | Z3.Z3E_unit, e2 -> Z3.Z3BE_eq (Z3.Z3E_unit, e2)
    | Z3.Z3E_bitone, e2 -> Z3.Z3BE_eq (Z3.Z3E_bitone, e2)
    | Z3.Z3E_bitzero, e2 -> Z3.Z3BE_eq (Z3.Z3E_bitzero, e2)
    | Z3.Z3E_len v, e2 -> Z3.Z3BE_eq (Z3.Z3E_len v, e2)
    | Z3.Z3E_leq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_leq (v, va), e2)
    | Z3.Z3E_geq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_geq (v, va), e2)
    | Z3.Z3E_plus (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_plus (v, va), e2)
    | Z3.Z3E_times (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_times (v, va), e2)
    | Z3.Z3E_div (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_div (v, va), e2)
    | Z3.Z3E_mod (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_mod (v, va), e2)
    | Z3.Z3E_minus (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_minus (v, va), e2)
    | Z3.Z3E_eq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_eq (v, va), e2)
    | Z3.Z3E_not v, e2 -> Z3.Z3BE_eq (Z3.Z3E_not v, e2)
    | Z3.Z3E_exp v, e2 -> Z3.Z3BE_eq (Z3.Z3E_exp v, e2)
    | Z3.Z3E_abs v, e2 -> Z3.Z3BE_eq (Z3.Z3E_abs v, e2)
    | Z3.Z3E_and (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_and (v, va), e2)
    | Z3.Z3E_or (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_or (v, va), e2)
    | Z3.Z3E_neq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_neq (v, va), e2)
    | Z3.Z3E_bitvec v, e2 -> Z3.Z3BE_eq (Z3.Z3E_bitvec v, e2)
    | Z3.Z3E_constr (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_constr (v, va), e2)
    | Z3.Z3E_concat v, e2 -> Z3.Z3BE_eq (Z3.Z3E_concat v, e2)
    | Z3.Z3E_proj (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_proj (v, va), e2)
    | Z3.Z3E_string v, e2 -> Z3.Z3BE_eq (Z3.Z3E_string v, e2)
    | e1, Z3.Z3E_num v -> Z3.Z3BE_eq (e1, Z3.Z3E_num v)
    | e1, Z3.Z3E_var v -> Z3.Z3BE_eq (e1, Z3.Z3E_var v)
    | e1, Z3.Z3E_true -> Z3.Z3BE_eq (e1, Z3.Z3E_true)
    | e1, Z3.Z3E_false -> Z3.Z3BE_eq (e1, Z3.Z3E_false)
    | e1, Z3.Z3E_unit -> Z3.Z3BE_eq (e1, Z3.Z3E_unit)
    | e1, Z3.Z3E_bitone -> Z3.Z3BE_eq (e1, Z3.Z3E_bitone)
    | e1, Z3.Z3E_bitzero -> Z3.Z3BE_eq (e1, Z3.Z3E_bitzero)
    | e1, Z3.Z3E_len v -> Z3.Z3BE_eq (e1, Z3.Z3E_len v)
    | e1, Z3.Z3E_geq (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_geq (v, va))
    | e1, Z3.Z3E_plus (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_plus (v, va))
    | e1, Z3.Z3E_times (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_times (v, va))
    | e1, Z3.Z3E_div (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_div (v, va))
    | e1, Z3.Z3E_mod (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_mod (v, va))
    | e1, Z3.Z3E_minus (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_minus (v, va))
    | e1, Z3.Z3E_not v -> Z3.Z3BE_eq (e1, Z3.Z3E_not v)
    | e1, Z3.Z3E_exp v -> Z3.Z3BE_eq (e1, Z3.Z3E_exp v)
    | e1, Z3.Z3E_abs v -> Z3.Z3BE_eq (e1, Z3.Z3E_abs v)
    | e1, Z3.Z3E_and (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_and (v, va))
    | e1, Z3.Z3E_or (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_or (v, va))
    | e1, Z3.Z3E_neq (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_neq (v, va))
    | e1, Z3.Z3E_bitvec v -> Z3.Z3BE_eq (e1, Z3.Z3E_bitvec v)
    | e1, Z3.Z3E_constr (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_constr (v, va))
    | e1, Z3.Z3E_concat v -> Z3.Z3BE_eq (e1, Z3.Z3E_concat v)
    | e1, Z3.Z3E_proj (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_proj (v, va))
    | e1, Z3.Z3E_string v -> Z3.Z3BE_eq (e1, Z3.Z3E_string v);;

let rec z3and
  es = (let esa =
          Lista.filter (fun e -> not (Z3.equal_z3_bool_expra e Z3.Z3BE_true)) es
          in
         (match esa with [] -> Z3.Z3BE_true | [e] -> e
           | _ :: _ :: _ -> Z3.Z3BE_and esa));;

let rec convert_b_i_i_i_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_int)) ->
              Predicate.single (Z3.Z3T_int, Z3.Z3BE_true)
            | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_record _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.B_finite_set _)) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_bool)) ->
                Predicate.single (Z3.Z3T_bool, Z3.Z3BE_true)
              | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_record _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.B_finite_set _)) -> Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xa, xb)))
            (fun a ->
              (match a with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
                | (p, (v, SyntaxVCT.B_tuple blist)) ->
                  Predicate.bind (convert_blist_i_i_i_o p v blist)
                    (fun (blist2, clist) ->
                      Predicate.single
                        (Z3.Z3T_dt
                           ("Tuple" ^
                              Utils.string_lit_of_nat (Lista.size_list blist),
                             blist2),
                          z3and clist))
                | (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_record _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.B_finite_set _)) -> Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (x, (xa, xb)))
              (fun a ->
                (match a with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_record [])) -> Predicate.bot_pred
                  | (p, (_, SyntaxVCT.B_record ((fid, _) :: _))) ->
                    Predicate.bind
                      (ContextsPiDelta.eq_o_i
                        (ContextsPiDelta.lookup_record_name p fid))
                      (fun aa ->
                        (match aa with None -> Predicate.bot_pred
                          | Some s ->
                            Predicate.single (Z3.Z3T_dt (s, []), Z3.Z3BE_true)))
                  | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.B_finite_set _)) -> Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (x, (xa, xb)))
                (fun a ->
                  (match a
                    with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_record [])) -> Predicate.bot_pred
                    | (p, (_, SyntaxVCT.B_record ((fid, _) :: _))) ->
                      Predicate.bind
                        (ContextsPiDelta.eq_i_i
                          (Option.equal_option Stringa.equal_literal) None
                          (ContextsPiDelta.lookup_record_name p fid))
                        (fun () ->
                          Predicate.single
                            (Z3.Z3T_dt ("unknownrecord", []), Z3.Z3BE_true))
                    | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.B_finite_set _)) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind (Predicate.single (x, (xa, xb)))
                  (fun a ->
                    (match a
                      with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_record [])) ->
                        Predicate.single
                          (Z3.Z3T_dt ("unknownrecord", []), Z3.Z3BE_true)
                      | (_, (_, SyntaxVCT.B_record (_ :: _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.B_finite_set _)) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind (Predicate.single (x, (xa, xb)))
                    (fun a ->
                      (match a
                        with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_bit)) ->
                          Predicate.single (Z3.Z3T_bool, Z3.Z3BE_true)
                        | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_union (_, _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_record _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.B_finite_set _)) ->
                          Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind (Predicate.single (x, (xa, xb)))
                      (fun a ->
                        (match a
                          with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                          | (p, (v, SyntaxVCT.B_vec (_, b))) ->
                            Predicate.bind (convert_b_i_i_i_o p v b)
                              (fun (t, _) ->
                                Predicate.single
                                  (Z3.Z3T_array (Z3.Z3T_int, t), Z3.Z3BE_true))
                          | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_union (_, _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_record _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_exception)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.B_finite_set _)) ->
                            Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind (Predicate.single (x, (xa, xb)))
                        (fun a ->
                          (match a
                            with (_, (_, SyntaxVCT.B_var _)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_vec (_, _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_tuple _)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_union (_, _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_record _)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_string)) ->
                              Predicate.single (Z3.Z3T_string, Z3.Z3BE_true)
                            | (_, (_, SyntaxVCT.B_exception)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.B_finite_set _)) ->
                              Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind (Predicate.single (x, (xa, xb)))
                          (fun a ->
                            (match a
                              with (_, (_, SyntaxVCT.B_var _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_tid _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_unit)) ->
                                Predicate.single
                                  (Z3.Z3T_dt ("Unit", []), Z3.Z3BE_true)
                              | (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_vec (_, _))) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_list _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_tuple _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_union (_, _))) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_record _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_undef)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_reg _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_string)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_exception)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.B_finite_set _)) ->
                                Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind (Predicate.single (x, (xa, xb)))
                            (fun a ->
                              (match a
                                with (_, (_, SyntaxVCT.B_var _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_tid _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_int)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_bool)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_bit)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_unit)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_real)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_vec (_, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_list _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_tuple _)) ->
                                  Predicate.bot_pred
                                | (p, (v, SyntaxVCT.B_union (s, bs))) ->
                                  Predicate.bind (convert_blist_i_i_i_o p v bs)
                                    (fun (blist2, _) ->
                                      Predicate.single
(Z3.Z3T_dt (s, blist2), Z3.Z3BE_true))
                                | (_, (_, SyntaxVCT.B_record _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_undef)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_reg _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_string)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_exception)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.B_finite_set _)) ->
                                  Predicate.bot_pred)))
                          (Predicate.sup_pred
                            (Predicate.bind (Predicate.single (x, (xa, xb)))
                              (fun a ->
                                (match a
                                  with (_, (_, SyntaxVCT.B_var _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_tid _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_int)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_bool)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_bit)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_unit)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_real)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_vec (_, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_list _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_tuple _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_union (_, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_record _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_undef)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_reg _)) ->
                                    Predicate.single
                                      (Z3.Z3T_dt ("reg", []), Z3.Z3BE_true)
                                  | (_, (_, SyntaxVCT.B_string)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_exception)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.B_finite_set _)) ->
                                    Predicate.bot_pred)))
                            (Predicate.sup_pred
                              (Predicate.bind (Predicate.single (x, (xa, xb)))
                                (fun a ->
                                  (match a
                                    with (_, (_, SyntaxVCT.B_var vs)) ->
                                      Predicate.single
(Z3.Z3T_sort vs, Z3.Z3BE_true)
                                    | (_, (_, SyntaxVCT.B_tid _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_int)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_bool)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_bit)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_unit)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_real)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_vec (_, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_list _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_tuple _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_union (_, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_record _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_undef)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_reg _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_string)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_exception)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.B_finite_set _)) ->
                                      Predicate.bot_pred)))
                              (Predicate.sup_pred
                                (Predicate.bind (Predicate.single (x, (xa, xb)))
                                  (fun a ->
                                    (match a
                                      with (_, (_, SyntaxVCT.B_var _)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_tid vs)) ->
Predicate.single (Z3.Z3T_dt (vs, []), Z3.Z3BE_true)
                                      | (_, (_, SyntaxVCT.B_int)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_bool)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_bit)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_unit)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_real)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_vec (_, _))) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_list _)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_tuple _)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_union (_, _))) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_record _)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_undef)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_reg _)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_string)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_exception)) ->
Predicate.bot_pred
                                      | (_, (_, SyntaxVCT.B_finite_set _)) ->
Predicate.bot_pred)))
                                (Predicate.sup_pred
                                  (Predicate.bind
                                    (Predicate.single (x, (xa, xb)))
                                    (fun a ->
                                      (match a
with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_real)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
| (p, (v, SyntaxVCT.B_list b)) ->
  Predicate.bind (convert_b_i_i_i_o p v b)
    (fun (t, _) -> Predicate.single (Z3.Z3T_dt ("List", [t]), Z3.Z3BE_true))
| (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_record _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_finite_set _)) -> Predicate.bot_pred)))
                                  (Predicate.bind
                                    (Predicate.single (x, (xa, xb)))
                                    (fun a ->
                                      (match a
with (_, (_, SyntaxVCT.B_var _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_tid _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_int)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_bool)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_bit)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_unit)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_real)) -> Predicate.single (Z3.Z3T_string, Z3.Z3BE_true)
| (_, (_, SyntaxVCT.B_vec (_, _))) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_list _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_tuple _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_union (_, _))) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_record _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_undef)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_reg _)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_string)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_exception)) -> Predicate.bot_pred
| (_, (_, SyntaxVCT.B_finite_set _)) -> Predicate.bot_pred)))))))))))))))))
and convert_blist_i_i_i_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, [])) -> Predicate.single ([], [])
            | (_, (_, _ :: _)) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, [])) -> Predicate.bot_pred
            | (t, (v, b :: blist)) ->
              Predicate.bind (convert_blist_i_i_i_o t v blist)
                (fun (ts, belist) ->
                  Predicate.bind (convert_b_i_i_i_o t v b)
                    (fun (ta, be) ->
                      Predicate.single (ta :: ts, be :: belist))))));;

let rec convert_l
  = function SyntaxVCT.L_num n -> Z3.Z3E_num n
    | SyntaxVCT.L_true -> Z3.Z3E_true
    | SyntaxVCT.L_false -> Z3.Z3E_false
    | SyntaxVCT.L_zero -> Z3.Z3E_bitzero
    | SyntaxVCT.L_one -> Z3.Z3E_bitone
    | SyntaxVCT.L_unit -> Z3.Z3E_unit
    | SyntaxVCT.L_bin va -> Z3.Z3E_bitvec va
    | SyntaxVCT.L_real s -> Z3.Z3E_string s
    | SyntaxVCT.L_string s -> Z3.Z3E_string s
    | SyntaxVCT.L_undef -> Z3.Z3E_constr ("unexpected undef", []);;

let rec convert_v
  = function
    SyntaxVCT.V_var (SyntaxVCT.VNamed x) -> Z3.Z3E_var (Contexts.remove_tick x)
    | SyntaxVCT.V_var SyntaxVCT.VIndex -> Z3.Z3E_var "unexpected z variable"
    | SyntaxVCT.V_lit lit -> convert_l lit
    | SyntaxVCT.V_constr (v, va) -> Z3.Z3E_constr (v, [convert_v va])
    | SyntaxVCT.V_record v -> Z3.Z3E_constr ("record", [])
    | SyntaxVCT.V_tuple vs ->
        Z3.Z3E_constr
          ("mk-tuple" ^
             Utils.string_lit_of_int (Arith.int_of_nat (Lista.size_list vs)),
            Lista.map convert_v vs)
    | SyntaxVCT.V_proj (s, v) -> Z3.Z3E_proj (s, convert_v v)
    | SyntaxVCT.V_list vs ->
        Lista.fold (fun v tl -> Z3.Z3E_constr ("insert", [convert_v v; tl])) vs
          (Z3.Z3E_constr ("nil", []))
    | SyntaxVCT.V_cons (v, vs) ->
        Z3.Z3E_constr ("insert", [convert_v v; convert_v vs]);;

let rec convert_ce
  = function SyntaxVCT.CE_val v -> convert_v v
    | SyntaxVCT.CE_bop (SyntaxVCT.Plus, e1, e2) ->
        Z3.Z3E_plus (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.LEq, e1, e2) ->
        Z3.Z3E_leq (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Times, e1, e2) ->
        Z3.Z3E_times (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Minus, e1, e2) ->
        Z3.Z3E_minus (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Div, e1, e2) ->
        Z3.Z3E_div (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Mod, e1, e2) ->
        Z3.Z3E_mod (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Eq, e1, e2) ->
        Z3.Z3E_eq (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.NEq, e1, e2) ->
        Z3.Z3E_not (Z3.Z3E_eq (convert_ce e1, convert_ce e2))
    | SyntaxVCT.CE_bop (SyntaxVCT.LT, e1, e2) ->
        Z3.Z3E_leq
          (Z3.Z3E_plus (convert_ce e1, Z3.Z3E_num (Z.of_int 1)), convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.And, e1, e2) ->
        Z3.Z3E_and (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Or, e1, e2) ->
        Z3.Z3E_or (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.GEq, e1, e2) ->
        Z3.Z3E_not
          (Z3.Z3E_leq
            (Z3.Z3E_plus (convert_ce e1, Z3.Z3E_num (Z.of_int 1)),
              convert_ce e2))
    | SyntaxVCT.CE_bop (SyntaxVCT.GT, e1, e2) ->
        Z3.Z3E_not (Z3.Z3E_leq (convert_ce e1, convert_ce e2))
    | SyntaxVCT.CE_uop (SyntaxVCT.Len, e) -> Z3.Z3E_len (convert_ce e)
    | SyntaxVCT.CE_uop (SyntaxVCT.Nott, e) -> Z3.Z3E_not (convert_ce e)
    | SyntaxVCT.CE_uop (SyntaxVCT.Abs, e) -> Z3.Z3E_abs (convert_ce e)
    | SyntaxVCT.CE_many_plus v -> failwith "undefined"
    | SyntaxVCT.CE_uop (SyntaxVCT.Exp, va) -> Z3.Z3E_exp (convert_ce va)
    | SyntaxVCT.CE_uop (SyntaxVCT.Neg, va) ->
        Z3.Z3E_minus (Z3.Z3E_num Z.zero, convert_ce va)
    | SyntaxVCT.CE_proj (v, va) -> Z3.Z3E_proj (v, convert_ce va)
    | SyntaxVCT.CE_field_access (vp, field) ->
        Z3.Z3E_proj (field, convert_v vp);;

let rec convert_c
  = function SyntaxVCT.C_true -> Z3.Z3BE_true
    | SyntaxVCT.C_false -> Z3.Z3BE_false
    | SyntaxVCT.C_conj (c1, c2) -> z3and [convert_c c1; convert_c c2]
    | SyntaxVCT.C_disj (c1, c2) -> Z3.Z3BE_or [convert_c c1; convert_c c2]
    | SyntaxVCT.C_not c -> Z3.Z3BE_not (convert_c c)
    | SyntaxVCT.C_imp (c1, c2) -> Z3.Z3BE_implies (convert_c c1, convert_c c2)
    | SyntaxVCT.C_eq (e1, e2) -> z3eq (convert_ce e1) (convert_ce e2)
    | SyntaxVCT.C_leq (e1, e2) -> Z3.Z3BE_leq (convert_ce e1, convert_ce e2)
    | SyntaxVCT.C_conj_many cs -> z3and (Lista.map convert_c cs);;

let rec convert_t_i_i_i_o
          x xa xb =
    PPrintEngine.ToChannel.compact stderr ((string "convert_t tp=") ^^ (Minisailplus_pp.pp_tp xb) ^^ (string "\n"));
    Predicate.bind (Predicate.single (x, (xa, xb)))
      (fun (p, (v, SyntaxVCT.T_refined_type (_, b, c))) ->
        Predicate.bind (convert_b_i_i_i_o p v b)
          (fun (t, e) ->
            Predicate.single
              (t, z3and [e; convert_c
                              (Subst.subst_cp v SyntaxVCT.VIndex c)])));;

let rec convert_ft_list_i_i_i_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, [])) -> Predicate.single ([], [])
            | (_, (_, _ :: _)) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, [])) -> Predicate.bot_pred
            | (t, (v, (f, ta) :: tlist)) ->
              Predicate.bind (convert_ft_list_i_i_i_o t v tlist)
                (fun (zts, belist) ->
                  Predicate.bind (convert_t_i_i_i_o t v ta)
                    (fun (zt, be) ->
                      Predicate.single ((f, zt) :: zts, be :: belist))))));;

let rec freshen_type
  = function Z3.Z3T_int -> Z3.Z3T_int
    | Z3.Z3T_bool -> Z3.Z3T_bool
    | Z3.Z3T_unit -> Z3.Z3T_unit
    | Z3.Z3T_array (t1, t2) -> Z3.Z3T_array (freshen_type t1, freshen_type t2)
    | Z3.Z3T_dt (s, zts) -> Z3.Z3T_dt (s, Lista.map freshen_type zts)
    | Z3.Z3T_sort s -> Z3.Z3T_sort (s ^ "T")
    | Z3.Z3T_string -> Z3.Z3T_string;;

let rec freshen_type_var
  = function Z3.Z3TV_tv_type t -> Z3.Z3TV_tv_type (freshen_type t)
    | Z3.Z3TV_tv_var i -> Z3.Z3TV_tv_var i;;

let rec freshen_constr
  (Z3.Z3C_ty_constr (s, stvs)) =
    Z3.Z3C_ty_constr
      (s, Lista.map (fun (sa, t) -> (sa, freshen_type_var t)) stvs);;

let rec freshen_decl
  = function Z3.Z3D_decl_fun -> Z3.Z3D_decl_fun
    | Z3.Z3D_decl_const (s, t) -> Z3.Z3D_decl_const (s, freshen_type t)
    | Z3.Z3D_decl_datatype (s, vs, cs) ->
        Z3.Z3D_decl_datatype
          (s, Lista.map freshen_type_var vs, Lista.map freshen_constr cs);;

let rec b_t_vars
  = function SyntaxVCT.B_var s -> [s]
    | SyntaxVCT.B_tuple bs ->
        Lista.remdups Stringa.equal_literal (Lista.maps b_t_vars bs)
    | SyntaxVCT.B_union (uu, ts) ->
        Lista.remdups Stringa.equal_literal (Lista.maps b_t_vars ts)
    | SyntaxVCT.B_record ts ->
        Lista.remdups Stringa.equal_literal
          (Lista.maps (fun (_, a) -> b_t_vars a) ts)
    | SyntaxVCT.B_vec (uv, b) -> b_t_vars b
    | SyntaxVCT.B_list b -> b_t_vars b
    | SyntaxVCT.B_tid v -> []
    | SyntaxVCT.B_int -> []
    | SyntaxVCT.B_bool -> []
    | SyntaxVCT.B_bit -> []
    | SyntaxVCT.B_unit -> []
    | SyntaxVCT.B_real -> []
    | SyntaxVCT.B_undef -> []
    | SyntaxVCT.B_reg v -> []
    | SyntaxVCT.B_string -> []
    | SyntaxVCT.B_exception -> []
    | SyntaxVCT.B_finite_set v -> [];;

let rec t_t_vars (SyntaxVCT.T_refined_type (vIndex0, b, c)) = b_t_vars b;;

let rec convert_typedef_i_i_o
  xa (xb, xc) =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, xc)))
        (fun a ->
          (match a
            with (_, (SyntaxVCT.VNamed _, SyntaxPED.Record (_, _, _))) ->
              Predicate.bot_pred
            | (p, (SyntaxVCT.VNamed x, SyntaxPED.Variant (_, _, clist))) ->
              Predicate.bind
                (convert_ft_list_i_i_i_o p (SyntaxVCT.V_var SyntaxVCT.VIndex)
                  clist)
                (fun (ztlist, _) ->
                  Predicate.bind
                    (ContextsPiDelta.eq_o_i
                      (Lista.map (fun v -> Z3.Z3TV_tv_type (Z3.Z3T_sort v))
                        (Lista.maps (fun (_, aa) -> t_t_vars aa) clist)))
                    (fun xaa ->
                      Predicate.bind
                        (ContextsPiDelta.eq_o_i
                          (Lista.map
                            (fun (s, zt) ->
                              Z3.Z3C_ty_constr
                                (s, [((("proj" ^ x) ^ "x") ^ s,
                                       Z3.Z3TV_tv_type zt)]))
                            ztlist))
                        (fun xaaa ->
                          Predicate.single
                            (freshen_decl
                              (Z3.Z3D_decl_datatype (x, xaa, xaaa))))))
            | (_, (SyntaxVCT.VIndex, _)) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (xa, (xb, xc)))
        (fun a ->
          (match a
            with (_, (SyntaxVCT.VNamed _,
                       SyntaxPED.Record
                         (_, _,
                           SyntaxVCT.T_refined_type
                             (SyntaxVCT.VNamed _, _, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_var _, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_tid _, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_int, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_bool, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_bit, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_unit, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_real, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_vec (_, _), _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_list _, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_tuple _, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_union (_, _), _))))
              -> Predicate.bot_pred
            | (p, (SyntaxVCT.VNamed x,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_record clista, _))))
              -> Predicate.bind
                   (convert_blist_i_i_i_o p (SyntaxVCT.V_var SyntaxVCT.VIndex)
                     (Lista.map Product_Type.snd clista))
                   (fun (ztlista, _) ->
                     Predicate.bind
                       (ContextsPiDelta.eq_o_i
                         (Lista.map (fun v -> Z3.Z3TV_tv_type (Z3.Z3T_sort v))
                           (Lista.maps (fun (_, aa) -> b_t_vars aa) clista)))
                       (fun xaa ->
                         Predicate.bind
                           (ContextsPiDelta.eq_o_i
                             [Z3.Z3C_ty_constr
                                ("mk-" ^ x,
                                  Lista.map
                                    (fun (s, zt) ->
                                      ("proj" ^ Product_Type.fst s,
Z3.Z3TV_tv_type zt))
                                    (Lista.zip clista ztlista))])
                           (fun xaaa ->
                             Predicate.single
                               (freshen_decl
                                 (Z3.Z3D_decl_datatype (x, xaa, xaaa))))))
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_undef, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_reg _, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_string, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_exception, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _,
                    SyntaxPED.Record
                      (_, _,
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, SyntaxVCT.B_finite_set _, _))))
              -> Predicate.bot_pred
            | (_, (SyntaxVCT.VNamed _, SyntaxPED.Variant (_, _, _))) ->
              Predicate.bot_pred
            | (_, (SyntaxVCT.VIndex, _)) -> Predicate.bot_pred)));;

let rec pp_z3_type
  = function Z3.Z3T_int -> "Int"
    | Z3.Z3T_bool -> "Bool"
    | Z3.Z3T_unit -> "Unit"
    | Z3.Z3T_array (t1, t2) ->
        ((("(Array " ^ pp_z3_type t1) ^ " ") ^ pp_z3_type t2) ^ " )"
    | Z3.Z3T_dt (s, tlist) ->
        ((("( " ^ s) ^ " ") ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_type t ^ " ") ^ a)) tlist
            " ") ^
          ") "
    | Z3.Z3T_sort s -> Contexts.remove_tick s
    | Z3.Z3T_string -> "String";;

let rec pp_z3_type_var
  = function Z3.Z3TV_tv_type t -> pp_z3_type t
    | Z3.Z3TV_tv_var n -> "T" ^ Utils.string_lit_of_integer n;;

let rec pp_z3_fields
  fs = Lista.foldr
         (fun (c, t) ->
           (fun a -> ((((" ( " ^ c) ^ " ") ^ pp_z3_type_var t) ^ " ) ") ^ a))
         fs "";;

let rec pp_z3_ty_constr
  (Z3.Z3C_ty_constr (c, x)) = (((" ( " ^ c) ^ " ") ^ pp_z3_fields x) ^ ")";;

let rec pp_z3_decl
  = function
    Z3.Z3D_decl_const (s, t) ->
      ((("(declare-const " ^ s) ^ " ") ^ pp_z3_type t) ^ ")"
    | Z3.Z3D_decl_fun -> "Unknown"
    | Z3.Z3D_decl_datatype (s, tvs, dt_list) ->
        (((((((("(declare-datatypes " ^ " (( ") ^ s) ^ " ") ^
              Utils.string_lit_of_nat (Lista.size_list tvs)) ^
             ")) (( par ( ") ^
            Utils.string_lit_map " " pp_z3_type_var tvs) ^
           " ) ( ") ^
          Lista.foldr (fun tc -> (fun a -> pp_z3_ty_constr tc ^ a)) dt_list
            "") ^
          "))))";;

let rec pp_typedef_i_Pii_o
  xa (xb, xc) =
    Predicate.bind (Predicate.single (xa, (xb, xc)))
      (fun (p, (x, y)) ->
        Predicate.bind (convert_typedef_i_i_o p (x, y))
          (fun xd -> Predicate.single (pp_z3_decl xd)));;

let rec pp_typedef_list_i_i_o
  xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, xb))
        (fun a ->
          (match a with (_, []) -> Predicate.single []
            | (_, _ :: _) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (xa, xb))
        (fun a ->
          (match a with (_, []) -> Predicate.bot_pred
            | (t, (x, y) :: tds) ->
              Predicate.bind (pp_typedef_list_i_i_o t tds)
                (fun xaa ->
                  Predicate.bind (pp_typedef_i_Pii_o t (x, y))
                    (fun xc -> Predicate.single (xc :: xaa))))));;

let rec minimise_td_i_i_o
  x xa =
    Predicate.bind (Predicate.single (x, xa))
      (fun (t, g) ->
        Predicate.bind (ContextsPiDelta.fm_from_t_i_o t)
          (fun xb ->
            Predicate.bind
              (ContextsPiDelta.eq_o_i
                (Lista.map (fun (_, a) -> ContextsPiDelta.b_of_ge a) g))
              (fun xaa ->
                Predicate.bind (ContextsPiDelta.tids_in_blist_i_i_o t xaa)
                  (fun xab ->
                    Predicate.bind
                      (ContextsPiDelta.eq_o_i
                        (let fm =
                           Contexts.iterate
                             (Lista.size_list (ContextsPiDelta.theta_T t)) xb xb
                           in
                         let ss_bp = Lista.remdups Stringa.equal_literal xab in
                         let ss =
                           Lista.remdups Stringa.equal_literal
                             (Lista.maps
                               (fun s ->
                                 (match
                                   Finite_Map.fmlookup Stringa.equal_literal fm
                                     s
                                   with None -> [] | Some ss -> ss))
                               ss_bp)
                           in
                          ContextsPiDelta.restrict_t (ContextsPiDelta.theta_T t)
                            (Lista.remdups Stringa.equal_literal (ss @ ss_bp))))
                      Predicate.single))));;

let rec pp_z3_expr
  = function Z3.Z3E_var s -> s
    | Z3.Z3E_true -> "true"
    | Z3.Z3E_false -> "false"
    | Z3.Z3E_num n -> Utils.string_lit_of_integer n
    | Z3.Z3E_plus (e1, e2) ->
        ((("(+ " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_leq (e1, e2) ->
        ((("(<= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_geq (e1, e2) ->
        ((("(>= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_times (e1, e2) ->
        ((("(* " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_div (e1, e2) ->
        ((("(div " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_mod (e1, e2) ->
        ((("(mod " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_minus (e1, e2) ->
        ((("(- " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_eq (e1, e2) ->
        ((("(= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_neq (e1, e2) ->
        (((("not (" ^ "(= ") ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ "))"
    | Z3.Z3E_and (e1, e2) ->
        ((("(and " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_or (e1, e2) ->
        ((("(or " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_constr (s, vs) ->
        (if ((s : string) = "nil") then "nil"
          else ((("( " ^ s) ^ " ") ^
                 Lista.foldr (fun t -> (fun a -> (pp_z3_expr t ^ " ") ^ a)) vs
                   " ") ^
                 " ) ")
    | Z3.Z3E_concat es ->
        ((("( concat" ^
            Utils.string_lit_of_int (Arith.int_of_nat (Lista.size_list es))) ^
           " ") ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_expr t ^ " ") ^ a)) es " ") ^
          " ) "
    | Z3.Z3E_bitone -> "true"
    | Z3.Z3E_bitzero -> "false"
    | Z3.Z3E_unit -> "unit"
    | Z3.Z3E_bitvec s -> "bitvec" ^ s
    | Z3.Z3E_proj (s, v) -> ((("(proj" ^ s) ^ " ") ^ pp_z3_expr v) ^ ")"
    | Z3.Z3E_len e -> ("(llen " ^ pp_z3_expr e) ^ " )"
    | Z3.Z3E_not e -> ("(not " ^ pp_z3_expr e) ^ " )"
    | Z3.Z3E_exp e -> ("(^ 2 " ^ pp_z3_expr e) ^ " )"
    | Z3.Z3E_string s -> ("\034" ^ s) ^ "\034";;

let rec pp_z3_bool_expr
  = function Z3.Z3BE_true -> "true"
    | Z3.Z3BE_false -> "false"
    | Z3.Z3BE_not e -> ("( not " ^ pp_z3_bool_expr e) ^ ")"
    | Z3.Z3BE_and elist ->
        ("(and " ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_bool_expr t ^ " ") ^ a)) elist
            " ") ^
          ")"
    | Z3.Z3BE_or elist ->
        ("(or " ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_bool_expr t ^ " ") ^ a)) elist
            " ") ^
          ")"
    | Z3.Z3BE_eq (e1, e2) ->
        ((("(= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3BE_leq (e1, e2) ->
        ((("(<= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3BE_implies (c1, c2) ->
        ((("( => " ^ pp_z3_bool_expr c1) ^ " ") ^ pp_z3_bool_expr c2) ^ ")"
    | Z3.Z3BE_pred (s, elist) ->
        ((("( " ^ s) ^ " ") ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_expr t ^ " ") ^ a)) elist
            " ") ^
          ")";;

let rec rewrite_passes
  p g d1 e1 =
    (let x = (Arith.zero_nat, (e1, [])) in
     let (i, (e1a, bs)) = (let (xa, a) = x in (Arith.int_of_nat xa, a)) in
     let var_decls =
       Lista.map
         (fun ia ->
           Z3.Z3D_decl_const
             ("exp_" ^ Stringa.implode (Utils.string_of_int ia), Z3.Z3T_int))
         (Lista.upto Arith.zero_int i)
       in
     let exp_eqs =
       Lista.map (fun (e1b, e2) -> Z3.Z3BE_pred ("exp_constraint", [e1b; e2]))
         bs
       in
      (d1 @ var_decls, Z3.Z3BE_and (e1a :: exp_eqs)));;

let z3_vector_sort : string = "(Array Int Bool)";;

let rec pp_bv_concats
  n = Lista.maps
        (fun i ->
          [((((("(declare-fun concat" ^ Utils.string_lit_of_int i) ^ " (") ^
               Utils.string_lit_map " " (fun _ -> z3_vector_sort)
                 (Lista.upto Arith.one_inta i)) ^
              ") ") ^
             z3_vector_sort) ^
             ")"])
        (Lista.upto Arith.one_inta n);;

let rec td_t_vars
  = function SyntaxPED.Record (ux, uy, ts) -> t_t_vars ts
    | SyntaxPED.Variant (uz, va, ts) ->
        Lista.remdups Stringa.equal_literal
          (Lista.maps (Fun.comp t_t_vars Product_Type.snd) ts);;

let rec pp_sort_decl
  p g = Lista.remdups Stringa.equal_literal
          (Lista.maps
            (fun (_, t) ->
              Lista.map
                (fun s -> ("(declare-sort " ^ Contexts.remove_tick s) ^ ")")
                (Lista.remdups Stringa.equal_literal (td_t_vars t)))
            (ContextsPiDelta.theta_T p));;

let rec bv_consts_v
  = function SyntaxVCT.V_lit (SyntaxVCT.L_bin l) -> [SyntaxVCT.L_bin l]
    | SyntaxVCT.V_tuple vs -> Lista.maps bv_consts_v vs
    | SyntaxVCT.V_lit SyntaxVCT.L_unit -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_zero -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_one -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_true -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_false -> []
    | SyntaxVCT.V_lit (SyntaxVCT.L_num va) -> []
    | SyntaxVCT.V_lit (SyntaxVCT.L_hex va) -> []
    | SyntaxVCT.V_lit (SyntaxVCT.L_string va) -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_undef -> []
    | SyntaxVCT.V_lit (SyntaxVCT.L_real va) -> []
    | SyntaxVCT.V_var v -> []
    | SyntaxVCT.V_vec v -> []
    | SyntaxVCT.V_list v -> []
    | SyntaxVCT.V_cons (v, va) -> []
    | SyntaxVCT.V_constr (v, va) -> []
    | SyntaxVCT.V_record v -> []
    | SyntaxVCT.V_proj (v, va) -> [];;

let rec bv_consts_ce
  = function SyntaxVCT.CE_val v -> bv_consts_v v
    | SyntaxVCT.CE_bop (opp, v1, v2) -> bv_consts_ce v1 @ bv_consts_ce v2
    | SyntaxVCT.CE_uop (opp, v) -> bv_consts_ce v
    | SyntaxVCT.CE_many_plus v -> Lista.maps bv_consts_ce v
    | SyntaxVCT.CE_proj (v, va) -> bv_consts_ce va
    | SyntaxVCT.CE_field_access (v, va) -> [];;

let rec bv_consts_c
  = function SyntaxVCT.C_eq (e1, e2) -> bv_consts_ce e1 @ bv_consts_ce e2
    | SyntaxVCT.C_conj (e1, e2) -> bv_consts_c e1 @ bv_consts_c e2
    | SyntaxVCT.C_disj (e1, e2) -> bv_consts_c e1 @ bv_consts_c e2
    | SyntaxVCT.C_imp (e1, e2) -> bv_consts_c e1 @ bv_consts_c e2
    | SyntaxVCT.C_not e1 -> bv_consts_c e1
    | SyntaxVCT.C_true -> []
    | SyntaxVCT.C_false -> []
    | SyntaxVCT.C_conj_many v -> []
    | SyntaxVCT.C_leq (v, va) -> [];;

let rec c_of_e = function Contexts.GEPair (uu, c) -> c
                 | Contexts.GETyp t -> SyntaxUtils.c_of t;;

let rec bv_consts_aux
  xbc = Lista.maps (fun (_, e) -> bv_consts_c (c_of_e e)) xbc;;

let z3_vector_lookup : string = " select ";;

let rec convert_bitvec s = s;;

let rec pp_bitvec
  = function
    SyntaxVCT.L_bin s ->
      [((("(declare-const bitvec" ^ convert_bitvec s) ^ " ") ^ z3_vector_sort) ^
         " )";
        (((((("(assert (and " ^ "( = (llen bitvec") ^ convert_bitvec s) ^
             ") ") ^
            Utils.string_lit_of_nat (Stringa.size_literal s)) ^
           " ) ") ^
          Utils.string_lit_concat
            (Lista.map
              (fun (i, x) ->
                ((((((("( = ( " ^ z3_vector_lookup) ^ "  bitvec") ^
                      convert_bitvec s) ^
                     " ") ^
                    Utils.string_lit_of_nat i) ^
                   ") ") ^
                  (match x
                    with Stringa.Chara
                           (true, false, false, false, true, true, false, false)
                      -> " true "
                    | Stringa.Chara
                        (false, false, false, false, true, true, false, false)
                      -> " false ")) ^
                  " ) ")
              (Lista.enumerate Arith.zero_nat (Stringa.explode s)))) ^
          " )) "]
    | SyntaxVCT.L_unit -> []
    | SyntaxVCT.L_zero -> []
    | SyntaxVCT.L_one -> []
    | SyntaxVCT.L_true -> []
    | SyntaxVCT.L_false -> []
    | SyntaxVCT.L_num v -> []
    | SyntaxVCT.L_hex v -> []
    | SyntaxVCT.L_string v -> []
    | SyntaxVCT.L_undef -> []
    | SyntaxVCT.L_real v -> [];;

let rec pp_bv_consts
  g ev c =
    (let bvs =
       bv_consts_aux (Contexts.gamma_x g) @ bv_consts_aux ev @ bv_consts_c c in
      Lista.maps pp_bitvec (Lista.remdups SyntaxVCT.equal_lit bvs));;

let pp_z3_vector_funs : string = "";;

let rec pp_z3_exp_pred
  maxx =
    ("(define-fun exp_constraint ((x Int ) (y Int )) Bool (or " ^
      Utils.string_lit_map " "
        (fun i ->
          ((((("( and " ^ " ( = x ") ^
               Stringa.implode
                 (Utils.string_of_int
                   (Arith.power Arith.power_int
                     (Arith.Int_of_integer (Z.of_int 2)) i))) ^
              " ) ") ^
             "( = y ") ^
            Stringa.implode (Utils.string_of_int (Arith.int_of_nat i))) ^
            " ))")
        (upto maxx)) ^
      ")) ";;

let rec z3_declare_tuple
  n = Z3.Z3D_decl_datatype
        ("Tuple" ^ Utils.string_lit_of_int n,
          Lista.map (fun i -> Z3.Z3TV_tv_var (Arith.integer_of_int i))
            (Lista.upto Arith.one_inta n),
          [Z3.Z3C_ty_constr
             ("mk-tuple" ^ Utils.string_lit_of_int n,
               Lista.map
                 (fun i ->
                   ((("proj" ^ Utils.string_lit_of_int n) ^ "X") ^
                      Utils.string_lit_of_int i,
                     Z3.Z3TV_tv_var (Arith.integer_of_int i)))
                 (Lista.upto Arith.one_inta n))]);;

let rec pp_tuples
  n = Lista.map (fun i -> pp_z3_decl (z3_declare_tuple i))
        (Lista.upto Arith.one_inta n);;

let rec pp_builtins
  n = pp_z3_exp_pred (Arith.nat_of_integer (Z.of_int 16)) ::
        pp_z3_vector_funs ::
          (("(declare-fun llen (" ^ z3_vector_sort) ^ ") Int)") ::
            pp_z3_decl
              (Z3.Z3D_decl_datatype
                ("Unit", [], [Z3.Z3C_ty_constr ("unit", [])])) ::
              pp_tuples n;;

let max_tuples : Arith.int = Arith.Int_of_integer (Z.of_int 10);;

let rec convert_smt_problem_final_i_i_i_i_i_i_i_i_o
  x xa xb xc xd xe xf xg =
    Predicate.bind
      (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, (xf, xg))))))))
      (fun (p, (g, (ev, (c, (ga, (d1, (d2, e1))))))) ->
        Predicate.bind (ContextsPiDelta.eq_o_i (rewrite_passes p g d1 e1))
          (fun (d1a, e1a) ->
            Predicate.bind (minimise_td_i_i_o p ga)
              (fun xh ->
                Predicate.bind (pp_typedef_list_i_i_o p xh)
                  (fun xi ->
                    Predicate.bind
                      (ContextsPiDelta.eq_o_i
                        (pp_bv_concats (Arith.Int_of_integer (Z.of_int 3)) @
                          pp_builtins max_tuples @
                            pp_bv_consts g ev c @
                              pp_sort_decl p g @
                                xi @ Lista.map pp_z3_decl d1a @
                                       [("(define-fun constraint () Bool " ^
  pp_z3_bool_expr e1a) ^
  (if Arith.equal_nat (Lista.size_list d2) Arith.zero_nat then ")" else "))")] @
 ["(assert constraint)"; "(check-sat)"]))
                      Predicate.single))));;

let rec convert_x = function SyntaxVCT.VNamed x -> Contexts.remove_tick x
                    | SyntaxVCT.VIndex -> "#0";;

let rec convert_xbc_i_i_i_i_Poo
  xa xb xc xd =
    Predicate.bind (Predicate.single (xa, (xb, (xc, xd))))
      (fun (p, (x, (b, c))) ->
        Predicate.bind (convert_b_i_i_i_o p (SyntaxVCT.V_var x) b)
          (fun (t1, c1) ->
            Predicate.single
              ([Z3.Z3D_decl_const (convert_x x, t1)],
                z3and [c1; convert_c c])));;

let rec subst_c_z x c = Subst.subst_cp (SyntaxVCT.V_var x) SyntaxVCT.VIndex c;;

let rec convert_g_aux_i_i_Poo
  xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, xb))
        (fun a ->
          (match a with (_, []) -> Predicate.single ([], [])
            | (_, _ :: _) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (xa, xb))
          (fun a ->
            (match a with (_, []) -> Predicate.bot_pred
              | (p, (x, Contexts.GEPair (b, c)) :: gamma) ->
                Predicate.bind (convert_g_aux_i_i_Poo p gamma)
                  (fun (ds, es) ->
                    Predicate.bind (convert_xbc_i_i_i_i_Poo p x b c)
                      (fun (d, e) -> Predicate.single (d @ ds, e :: es)))
              | (_, (_, Contexts.GETyp _) :: _) -> Predicate.bot_pred)))
        (Predicate.bind (Predicate.single (xa, xb))
          (fun a ->
            (match a with (_, []) -> Predicate.bot_pred
              | (_, (_, Contexts.GEPair (_, _)) :: _) -> Predicate.bot_pred
              | (p, (x, Contexts.GETyp t) :: gamma) ->
                Predicate.bind (convert_g_aux_i_i_Poo p gamma)
                  (fun (ds, es) ->
                    Predicate.bind
                      (convert_xbc_i_i_i_i_Poo p x (SyntaxUtils.b_of t)
                        (subst_c_z x (SyntaxUtils.c_of t)))
                      (fun (d, e) -> Predicate.single (d @ ds, e :: es)))))));;

let rec convert_smt_problem_valid_i_i_i_i_o
  x xa xb xc =
    Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
      (fun (p, (g, (ev, c))) ->
        Predicate.bind
          (ContextsPiDelta.eq_o_i (Contexts.gamma_x g @ Contexts.gamma_u g))
          (fun xd ->
            Predicate.bind (convert_g_aux_i_i_Poo p xd)
              (fun (d1, e1) ->
                Predicate.bind (convert_g_aux_i_i_Poo p ev)
                  (fun (d2, e2) ->
                    Predicate.bind (ContextsPiDelta.eq_o_i (convert_c c))
                      (fun xaa ->
                        Predicate.single
                          (xd, (d1, (d2, z3and
   (e1 @ [Z3.Z3BE_not (z3and (xaa :: e2))])))))))));;

let rec pp_smt_problem_valid_i_i_i_i_o
  x xa xb xc =
    Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
      (fun (p, (g, (ev, c))) ->
        Predicate.bind (convert_smt_problem_valid_i_i_i_i_o p g ev c)
          (fun (ga, (d1, (d2, e1))) ->
            Predicate.bind
              (convert_smt_problem_final_i_i_i_i_i_i_i_i_o p g ev c ga d1 d2 e1)
              Predicate.single));;

let rec valid_i_i_i_i_i_i_i
  x xa xb xc xd xe xf =
    Predicate.bind (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, xf)))))))
      (fun (s, (loc, (p, (g, (xbc, (c, smt_result)))))) ->
        Predicate.bind
          (Predicate.if_pred (Smt2.traceG "satisfiable call" g xbc c))
          (fun () ->
            Predicate.bind (pp_smt_problem_valid_i_i_i_i_o p g xbc c)
              (fun xg ->
                Predicate.bind
                  (ContextsPiDelta.eq_i_i Product_Type.equal_bool smt_result
                    (not (Smt2.satisfiable s loc xg false)))
                  (fun () -> Predicate.single ()))));;

let rec valid
  x1 x2 x3 x4 x5 x6 x7 =
    Predicate.holds (valid_i_i_i_i_i_i_i x1 x2 x3 x4 x5 x6 x7);;

let rec valid_i_i_i_i_i_i_o
  x xa xb xc xd xe =
    Predicate.bind (Predicate.single (x, (xa, (xb, (xc, (xd, xe))))))
      (fun (s, (loc, (p, (g, (xbc, c))))) ->
        Predicate.bind
          (Predicate.if_pred (Smt2.traceG "satisfiable call" g xbc c))
          (fun () ->
            Predicate.bind (pp_smt_problem_valid_i_i_i_i_o p g xbc c)
              (fun xf ->
                Predicate.bind
                  (ContextsPiDelta.eq_o_i
                    (not (Smt2.satisfiable s loc xf false)))
                  Predicate.single)));;

end;; (*struct SatisInductive*)
module TypingDeclFailRulesVP : sig
  type err = CheckFail of string * Location.loc |
    UnifyFail of string * Location.loc * SyntaxVCT.bp * SyntaxVCT.bp |
    SubtypeFail of string * Location.loc * SyntaxVCT.tau * SyntaxVCT.tau
  val equal_erra : err -> err -> bool
  val equal_err : err HOL.equal
  type 'a ok_error = OK | Error of 'a
  type infer_v_w = InferVVar of SyntaxVCT.xp | InferVLit |
    InferVBitvec of infer_v_w list | InferVTuple of infer_v_w list |
    InferVCons of infer_v_w * infer_v_w
  type subtype_w = Subtype of SyntaxVCT.tau * SyntaxVCT.tau | SubtypeFailW
  type check_pat_w = CheckPLit | CheckPId | CheckPWild |
    CheckPApp of check_pat_w | CheckPTuple of check_pat_w list |
    CheckPVec of check_pat_w list | CheckPNull
  val plus : 'a ok_error -> 'a ok_error -> 'a ok_error
  val s_of : SyntaxVCT.xp -> string
  val bot_t : SyntaxVCT.tau
  val get_loc : Location.loc * SyntaxVCT.tau option -> Location.loc
  val update_klist :
    (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list ->
      SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp) ->
        (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list
  val merge_klist :
    (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list ->
      (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list ->
        (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list
  val mk_fresh_lbl : Arith.nat -> string -> Arith.nat * SyntaxVCT.xp
  val b_of_lit_full :
    'a ContextsPiDelta.theta_ext -> SyntaxVCT.lit -> SyntaxVCT.bp
  val tsubst_bp_many :
    SyntaxVCT.bp -> (string * SyntaxVCT.bp) list -> SyntaxVCT.bp
  val subtype_i_i_i_i_i_o_o :
    Location.loc ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          SyntaxVCT.tau ->
            SyntaxVCT.tau -> (subtype_w * err ok_error) Predicate.pred
  val equal_ok_error : 'a HOL.equal -> 'a ok_error -> 'a ok_error -> bool
  val infer_v_i_i_i_o_o_i :
    unit ContextsPiDelta.theta_ext ->
      ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp ->
          err ok_error -> (SyntaxVCT.tau * infer_v_w) Predicate.pred
  val infer_v_T_G_vp_list_tp_list_i_i_i_o_o_i :
    unit ContextsPiDelta.theta_ext ->
      ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp list ->
          err ok_error -> (SyntaxVCT.tau list * infer_v_w list) Predicate.pred
  val infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o_o :
    unit ContextsPiDelta.theta_ext ->
      ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp list ->
          (SyntaxVCT.xp list *
            (SyntaxVCT.bp list *
              (SyntaxVCT.cp list * (infer_v_w list * err ok_error))))
            Predicate.pred
  val infer_v_i_i_i_o_o_o :
    unit ContextsPiDelta.theta_ext ->
      ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp ->
          (SyntaxVCT.tau * (infer_v_w * err ok_error)) Predicate.pred
  val infer_v_T_G_vp_list_tp_list_i_i_i_o_o_o :
    unit ContextsPiDelta.theta_ext ->
      ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp list ->
          (SyntaxVCT.tau list * (infer_v_w list * err ok_error)) Predicate.pred
  val check_pat_i_i_i_i_i_i_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          (SyntaxVCT.tau option) SyntaxPED.patp ->
            SyntaxVCT.tau ->
              SyntaxVCT.vp ->
                ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                  (SyntaxVCT.xp list *
                    ((SyntaxVCT.tau option) SyntaxPED.patp *
                      (Arith.nat * (check_pat_w * err ok_error)))))
                  Predicate.pred
  val check_pat_list_i_i_i_i_i_o_i_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          (SyntaxVCT.tau option) SyntaxPED.patp list ->
            SyntaxVCT.bp list ->
              SyntaxVCT.vp list ->
                ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                  ((SyntaxVCT.tau option) SyntaxPED.patp list *
                    (Arith.nat * (check_pat_w list * err ok_error))))
                  Predicate.pred
end = struct

type err = CheckFail of string * Location.loc |
  UnifyFail of string * Location.loc * SyntaxVCT.bp * SyntaxVCT.bp |
  SubtypeFail of string * Location.loc * SyntaxVCT.tau * SyntaxVCT.tau;;

let rec equal_erra
  x0 x1 = match x0, x1 with
    UnifyFail (x21, x22, x23, x24), SubtypeFail (x31, x32, x33, x34) -> false
    | SubtypeFail (x31, x32, x33, x34), UnifyFail (x21, x22, x23, x24) -> false
    | CheckFail (x11, x12), SubtypeFail (x31, x32, x33, x34) -> false
    | SubtypeFail (x31, x32, x33, x34), CheckFail (x11, x12) -> false
    | CheckFail (x11, x12), UnifyFail (x21, x22, x23, x24) -> false
    | UnifyFail (x21, x22, x23, x24), CheckFail (x11, x12) -> false
    | SubtypeFail (x31, x32, x33, x34), SubtypeFail (y31, y32, y33, y34) ->
        ((x31 : string) = y31) &&
          (Location.equal_loca x32 y32 &&
            (SyntaxVCT.equal_taua x33 y33 && SyntaxVCT.equal_taua x34 y34))
    | UnifyFail (x21, x22, x23, x24), UnifyFail (y21, y22, y23, y24) ->
        ((x21 : string) = y21) &&
          (Location.equal_loca x22 y22 &&
            (SyntaxVCT.equal_bpa x23 y23 && SyntaxVCT.equal_bpa x24 y24))
    | CheckFail (x11, x12), CheckFail (y11, y12) ->
        ((x11 : string) = y11) && Location.equal_loca x12 y12;;

let equal_err = ({HOL.equal = equal_erra} : err HOL.equal);;

type 'a ok_error = OK | Error of 'a;;

type infer_v_w = InferVVar of SyntaxVCT.xp | InferVLit |
  InferVBitvec of infer_v_w list | InferVTuple of infer_v_w list |
  InferVCons of infer_v_w * infer_v_w;;

type subtype_w = Subtype of SyntaxVCT.tau * SyntaxVCT.tau | SubtypeFailW;;

type check_pat_w = CheckPLit | CheckPId | CheckPWild | CheckPApp of check_pat_w
  | CheckPTuple of check_pat_w list | CheckPVec of check_pat_w list |
  CheckPNull;;

let rec plus x0 uu = match x0, uu with Error e, uu -> Error e
               | OK, Error e -> Error e
               | OK, OK -> OK;;

let rec s_of = function SyntaxVCT.VNamed s -> s
               | SyntaxVCT.VIndex -> "#0";;

let bot_t : SyntaxVCT.tau
  = SyntaxVCT.T_refined_type
      (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false);;

let rec get_loc annot = Product_Type.fst annot;;

let rec update_klist
  x0 x1 = match x0, x1 with [], (xp, (bp, cp)) -> [(xp, (bp, cp))]
    | (xpa, (bpa, cpa)) :: klist, (xp, (bp, cp)) ->
        (if SyntaxVCT.equal_xpa xp xpa
          then (xp, (bp, SyntaxVCT.C_conj (cp, cpa))) :: klist
          else (xpa, (bpa, cpa)) :: update_klist klist (xp, (bp, cp)));;

let rec merge_klist
  klist1 klist2 =
    Lista.foldr (fun xpge klist -> update_klist klist xpge) klist1 klist2;;

let rec mk_fresh_lbl
  i s = (let (ia, SyntaxVCT.VNamed xps) = TypingUtils.mk_fresh_i i in
          (ia, SyntaxVCT.VNamed (xps ^ s)));;

let rec b_of_lit_full
  t x1 = match t, x1 with
    t, SyntaxVCT.L_bin vs ->
      (match ContextsPiDelta.theta_d t
        with None -> SyntaxVCT.B_vec (SyntaxVCT.Ord_dec, SyntaxVCT.B_bit)
        | Some ord -> SyntaxVCT.B_vec (ord, SyntaxVCT.B_bit))
    | t, SyntaxVCT.L_unit -> SyntaxUtils.b_of_lit SyntaxVCT.L_unit
    | t, SyntaxVCT.L_zero -> SyntaxUtils.b_of_lit SyntaxVCT.L_zero
    | t, SyntaxVCT.L_one -> SyntaxUtils.b_of_lit SyntaxVCT.L_one
    | t, SyntaxVCT.L_true -> SyntaxUtils.b_of_lit SyntaxVCT.L_true
    | t, SyntaxVCT.L_false -> SyntaxUtils.b_of_lit SyntaxVCT.L_false
    | t, SyntaxVCT.L_num v -> SyntaxUtils.b_of_lit (SyntaxVCT.L_num v)
    | t, SyntaxVCT.L_hex v -> SyntaxUtils.b_of_lit (SyntaxVCT.L_hex v)
    | t, SyntaxVCT.L_string v -> SyntaxUtils.b_of_lit (SyntaxVCT.L_string v)
    | t, SyntaxVCT.L_undef -> SyntaxUtils.b_of_lit SyntaxVCT.L_undef
    | t, SyntaxVCT.L_real v -> SyntaxUtils.b_of_lit (SyntaxVCT.L_real v);;

let rec tsubst_bp_many
  b x1 = match b, x1 with b, [] -> b
    | ba, (bv, b) :: bsub -> Subst.tsubst_bp b bv (tsubst_bp_many ba bsub);;

let rec subtype_i_i_i_i_i_o_o
  x xa xb xc xd =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
        (fun (loc, (theta,
                     (gamma,
                       (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
                         SyntaxVCT.T_refined_type (zp2, bp2, cp2)))))
          -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
               (fun a ->
                 (match a with None -> Predicate.bot_pred
                   | Some _ ->
                     Predicate.bind
                       (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_g gamma))
                       (fun xe ->
                         Predicate.bind
                           (ContextsPiDelta.eq_i_i Product_Type.equal_bool true
                             (SatisInductive.wf_g
                               (Contexts.add_var gamma
                                 (xe, Contexts.GEPair
(bp1, SyntaxVCT.C_conj
        (SyntaxUtils.subst_x_cp cp1 zp1 (SyntaxVCT.V_var xe),
          SyntaxUtils.subst_x_cp cp2 zp2 (SyntaxVCT.V_var xe)))))))
                           (fun () ->
                             Predicate.bind
                               (SatisInductive.valid_i_i_i_i_i_i_o "check_valid"
                                 loc theta
                                 (Contexts.add_var gamma
                                   (xe, Contexts.GEPair
  (bp1, SyntaxUtils.subst_x_cp cp1 zp1 (SyntaxVCT.V_var xe))))
                                 [] (SyntaxUtils.subst_x_cp cp2 zp2
                                      (SyntaxVCT.V_var xe)))
                               (fun xf ->
                                 Predicate.bind
                                   (ContextsPiDelta.eq_o_i
                                     (if xf then OK
                                       else Error
      (SubtypeFail
        ("subtype: valid fail", loc, SyntaxVCT.T_refined_type (zp1, bp1, cp1),
          SyntaxVCT.T_refined_type (zp2, bp2, cp2)))))
                                   (fun xg ->
                                     Predicate.single
                                       (Subtype
  (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
    SyntaxVCT.T_refined_type (zp2, bp2, cp2)),
 xg)))))))))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
          (fun (loc, (_, (_, (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
                               SyntaxVCT.T_refined_type (zp2, bp2, cp2)))))
            -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                 (fun a ->
                   (match a
                     with None ->
                       Predicate.single
                         (Subtype
                            (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
                              SyntaxVCT.T_refined_type (zp2, bp2, cp2)),
                           Error (UnifyFail
                                   ("subtype: unify fail", loc, bp1, bp2)))
                     | Some _ -> Predicate.bot_pred))))
        (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
          (fun (loc, (theta,
                       (gamma,
                         (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
                           SyntaxVCT.T_refined_type (zp2, bp2, cp2)))))
            -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                 (fun a ->
                   (match a with None -> Predicate.bot_pred
                     | Some _ ->
                       Predicate.bind
                         (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_g gamma))
                         (fun xe ->
                           Predicate.bind
                             (ContextsPiDelta.eq_i_i Product_Type.equal_bool
                               false
                               (SatisInductive.wf_g
                                 (Contexts.add_var gamma
                                   (xe, Contexts.GEPair
  (bp1, SyntaxVCT.C_conj
          (SyntaxUtils.subst_x_cp cp1 zp1 (SyntaxVCT.V_var xe),
            SyntaxUtils.subst_x_cp cp2 zp2 (SyntaxVCT.V_var xe)))))))
                             (fun () ->
                               Predicate.bind
                                 (ContextsPiDelta.eq_o_i
                                   (SatisInductive.valid "check_valid wf_g fail"
                                     loc theta
                                     (Contexts.add_var gamma
                                       (xe,
 Contexts.GEPair (bp1, SyntaxUtils.subst_x_cp cp1 zp1 (SyntaxVCT.V_var xe))))
                                     [] (SyntaxUtils.subst_x_cp cp2 zp2
  (SyntaxVCT.V_var xe))))
                                 (fun _ ->
                                   Predicate.single
                                     (Subtype
(SyntaxVCT.T_refined_type (zp1, bp1, cp1),
  SyntaxVCT.T_refined_type (zp2, bp2, cp2)),
                                       Error
 (CheckFail ("subtype: G not well formed", loc)))))))))));;

let rec equal_ok_error _A x0 x1 = match x0, x1 with OK, Error x2 -> false
                            | Error x2, OK -> false
                            | Error x2, Error y2 -> HOL.eq _A x2 y2
                            | OK, OK -> true;;

let rec infer_v_i_i_i_o_o_i
  x xa xb xc =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
        (fun a ->
          (match a with (_, (_, (SyntaxVCT.V_lit _, _))) -> Predicate.bot_pred
            | (_, (gamma, (SyntaxVCT.V_var xp, OK))) ->
              Predicate.bind
                (ContextsPiDelta.eq_o_i (Contexts.lookup_var gamma xp))
                (fun aa ->
                  (match aa with None -> Predicate.bot_pred
                    | Some (Contexts.GEPair (bp, cp)) ->
                      Predicate.single
                        (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, bp,
                             SyntaxUtils.subst_x_cp cp xp
                               (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                          InferVVar xp)
                    | Some (Contexts.GETyp _) -> Predicate.bot_pred))
            | (_, (_, (SyntaxVCT.V_var _, Error _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_constr (_, _), _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_proj (_, _), _))) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
          (fun a ->
            (match a with (_, (_, (SyntaxVCT.V_lit _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_var _, OK))) -> Predicate.bot_pred
              | (_, (gamma,
                      (SyntaxVCT.V_var xp,
                        Error (CheckFail (xd, Location.Loc_unknown)))))
                -> Predicate.bind
                     (ContextsPiDelta.eq_i_i
                       (Option.equal_option Contexts.equal_g_entry) None
                       (Contexts.lookup_var gamma xp))
                     (fun () ->
                       (if ((xd : string) = ("lookup failed: " ^ s_of xp))
                         then Predicate.single (bot_t, InferVVar xp)
                         else Predicate.bot_pred))
              | (_, (_, (SyntaxVCT.V_var _,
                          Error (CheckFail (_, Location.Loc_range (_, _))))))
                -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_var _, Error (UnifyFail (_, _, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_var _, Error (SubtypeFail (_, _, _, _)))))
                -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_constr (_, _), _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_proj (_, _), _))) -> Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
            (fun a ->
              (match a
                with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, OK))) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                         SyntaxVCT.C_eq
                           (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                             SyntaxVCT.CE_val
                               (SyntaxVCT.V_lit SyntaxVCT.L_true))),
                      InferVLit)
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, Error _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_constr (_, _), _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
              (fun a ->
                (match a
                  with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, OK))) ->
                    Predicate.single
                      (SyntaxVCT.T_refined_type
                         (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                           SyntaxVCT.C_eq
                             (SyntaxVCT.CE_val
                                (SyntaxVCT.V_var SyntaxVCT.VIndex),
                               SyntaxVCT.CE_val
                                 (SyntaxVCT.V_lit SyntaxVCT.L_false))),
                        InferVLit)
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, Error _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                (fun a ->
                  (match a
                    with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num num), OK))) ->
                      Predicate.single
                        (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, SyntaxVCT.B_int,
                             SyntaxVCT.C_eq
                               (SyntaxVCT.CE_val
                                  (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                 SyntaxVCT.CE_val
                                   (SyntaxVCT.V_lit (SyntaxVCT.L_num num)))),
                          InferVLit)
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), Error _)))
                      -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                  (fun a ->
                    (match a
                      with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, OK))) ->
                        Predicate.single
                          (SyntaxVCT.T_refined_type
                             (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                               SyntaxVCT.C_eq
                                 (SyntaxVCT.CE_val
                                    (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                   SyntaxVCT.CE_val
                                     (SyntaxVCT.V_lit SyntaxVCT.L_one))),
                            InferVLit)
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, Error _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_record _, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                    (fun a ->
                      (match a
                        with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, OK))) ->
                          Predicate.single
                            (SyntaxVCT.T_refined_type
                               (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                                 SyntaxVCT.C_eq
                                   (SyntaxVCT.CE_val
                                      (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                     SyntaxVCT.CE_val
                                       (SyntaxVCT.V_lit SyntaxVCT.L_zero))),
                              InferVLit)
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, Error _)))
                          -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _)))
                          -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_list _, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_record _, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                          Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                      (fun a ->
                        (match a
                          with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, OK)))
                            -> Predicate.single
                                 (SyntaxVCT.T_refined_type
                                    (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                                      SyntaxVCT.C_eq
(SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
  SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_unit))),
                                   InferVLit)
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit,
                                      Error _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _), _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _), _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
                                      _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_var _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_list _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_record _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                            Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                        (fun a ->
                          (match a
                            with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _), _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _), _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
OK)))
                              -> Predicate.single
                                   (SyntaxVCT.T_refined_type
                                      (SyntaxVCT.VIndex, SyntaxVCT.B_string,
SyntaxVCT.C_true),
                                     InferVLit)
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
Error _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _),
_)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_var _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_list _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_record _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                              Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                          (fun a ->
                            (match a
                              with (_, (_,
 (SyntaxVCT.V_lit SyntaxVCT.L_unit, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _),
  _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_hex _),
  _)))
                                -> Predicate.bot_pred
                              | (theta,
                                  (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin b_list),
OK)))
                                -> Predicate.bind
                                     (ContextsPiDelta.eq_o_i
                                       (Arith.integer_of_nat
 (Stringa.size_literal b_list)))
                                     (fun xd ->
                                       Predicate.bind
 (ContextsPiDelta.eq_o_i (ContextsPiDelta.theta_d theta))
 (fun aa ->
   (match aa with None -> Predicate.bot_pred
     | Some order ->
       Predicate.single
         (SyntaxVCT.T_refined_type
            (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, SyntaxVCT.B_bit),
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_uop
                   (SyntaxVCT.Len,
                     SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                  SyntaxVCT.CE_val (SyntaxVCT.V_lit (SyntaxVCT.L_num xd)))),
           InferVLit))))
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bin _),
  Error _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
  _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _),
  _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                            (fun a ->
                              (match a
                                with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                  Predicate.bot_pred
                                | (theta,
                                    (gamma, (SyntaxVCT.V_vec vm_list, ok)))
                                  -> Predicate.bind
                                       (ContextsPiDelta.eq_o_i
 (ContextsPiDelta.theta_d theta))
                                       (fun aa ->
 (match aa with None -> Predicate.bot_pred
   | Some order ->
     Predicate.bind
       (infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o_o theta gamma
         vm_list)
       (fun (_, (bp_list, (_, (trs, oka)))) ->
         (if equal_ok_error equal_err ok oka
           then Predicate.bind
                  (ContextsPiDelta.eq_o_i
                    (Arith.integer_of_nat (Lista.size_list bp_list)))
                  (fun xd ->
                    Predicate.bind
                      (ContextsPiDelta.eq_o_i (Contexts.single_base bp_list))
                      (fun ab ->
                        (match ab with None -> Predicate.bot_pred
                          | Some bm ->
                            Predicate.single
                              (SyntaxVCT.T_refined_type
                                 (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bm),
                                   SyntaxVCT.C_eq
                                     (SyntaxVCT.CE_uop
(SyntaxVCT.Len, SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                                       SyntaxVCT.CE_val
 (SyntaxVCT.V_lit (SyntaxVCT.L_num xd)))),
                                InferVBitvec trs))))
           else Predicate.bot_pred))))
                                | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                  Predicate.bot_pred)))
                          (Predicate.sup_pred
                            (Predicate.bind
                              (Predicate.single (x, (xa, (xb, xc))))
                              (fun a ->
                                (match a
                                  with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                    Predicate.bot_pred
                                  | (theta,
                                      (gamma, (SyntaxVCT.V_tuple vp_list, ok)))
                                    -> Predicate.bind
 (infer_v_T_G_vp_list_tp_list_i_i_i_o_o_i theta gamma vp_list ok)
 (fun (tp_list, trs) ->
   Predicate.bind (ContextsPiDelta.eq_o_i (Lista.map UnifyType.b_of tp_list))
     (fun xd ->
       Predicate.single
         (SyntaxVCT.T_refined_type
            (SyntaxVCT.VIndex, SyntaxVCT.B_tuple xd,
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                  SyntaxVCT.CE_val (SyntaxVCT.V_tuple vp_list))),
           InferVTuple trs)))
                                  | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                    Predicate.bot_pred)))
                            (Predicate.sup_pred
                              (Predicate.bind
                                (Predicate.single (x, (xa, (xb, xc))))
                                (fun a ->
                                  (match a
                                    with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, (SyntaxVCT.V_cons (vp1, vp2), xd)))
                                      -> Predicate.bind
   (infer_v_i_i_i_o_o_o theta gamma vp1)
   (fun (SyntaxVCT.T_refined_type (zp, bp, _), (wt1, ok1)) ->
     Predicate.bind (infer_v_i_i_i_o_o_o theta gamma vp2)
       (fun aa ->
         (match aa
           with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_vec (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (zpa, SyntaxVCT.B_list bpa, _),
               (wt2, ok2))
             -> (if SyntaxVCT.equal_bpa bp bpa &&
                      (SyntaxVCT.equal_xpa zp zpa &&
                        equal_ok_error equal_err xd (plus ok1 ok2))
                  then Predicate.single
                         (SyntaxVCT.T_refined_type
                            (SyntaxVCT.VIndex, SyntaxVCT.B_list bp,
                              SyntaxVCT.C_eq
                                (SyntaxVCT.CE_val
                                   (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                  SyntaxVCT.CE_val
                                    (SyntaxVCT.V_cons (vp1, vp2)))),
                           InferVCons (wt1, wt2))
                  else Predicate.bot_pred)
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_union (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_finite_set _, _), _) ->
             Predicate.bot_pred)))
                                    | (_, (_, (SyntaxVCT.V_constr (_, _), _)))
                                      -> Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                      Predicate.bot_pred)))
                              (Predicate.bind
                                (Predicate.single (x, (xa, (xb, xc))))
                                (fun a ->
                                  (match a
                                    with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, (SyntaxVCT.V_constr (ctor, vp), xd)))
                                      -> Predicate.bind
   (ContextsPiDelta.eq_o_i (TypingUtils.lookup_ctor_base theta ctor))
   (fun aa ->
     (match aa with None -> Predicate.bot_pred
       | Some (SyntaxVCT.T_refined_type (zp, bp2, cp2), bp) ->
         Predicate.bind (infer_v_i_i_i_o_o_o theta gamma vp)
           (fun (SyntaxVCT.T_refined_type (zpa, bp1, cp1), (wt1, ok1)) ->
             (if SyntaxVCT.equal_xpa zp zpa
               then Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                      (fun ab ->
                        (match ab with None -> Predicate.bot_pred
                          | Some bsub ->
                            Predicate.bind
                              (subtype_i_i_i_i_i_o_o Location.Loc_unknown theta
                                gamma
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp1 bsub,
                                    cp1))
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp2 bsub,
                                    cp2)))
                              (fun (_, ok2) ->
                                (if equal_ok_error equal_err xd (plus ok1 ok2)
                                  then Predicate.single
 (SyntaxVCT.T_refined_type
    (zp, TypingUtils.tsubst_bp_many bp bsub,
      SyntaxVCT.C_eq
        (SyntaxVCT.CE_val (SyntaxVCT.V_var zp),
          SyntaxVCT.CE_val (SyntaxVCT.V_constr (ctor, vp)))),
   wt1)
                                  else Predicate.bot_pred))))
               else Predicate.bot_pred))))
                                    | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                      Predicate.bot_pred)))))))))))))))
and infer_v_T_G_vp_list_tp_list_i_i_i_o_o_i
  x xa xb xc =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
        (fun a ->
          (match a with (_, (_, ([], OK))) -> Predicate.single ([], [])
            | (_, (_, ([], Error _))) -> Predicate.bot_pred
            | (_, (_, (_ :: _, _))) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
          (fun a ->
            (match a with (_, (_, ([], _))) -> Predicate.bot_pred
              | (theta, (gamma, (vp :: vp_list, ok))) ->
                Predicate.bind
                  (infer_v_T_G_vp_list_tp_list_i_i_i_o_o_i theta gamma vp_list
                    ok)
                  (fun (tp_list, trs) ->
                    Predicate.bind (infer_v_i_i_i_o_o_i theta gamma vp OK)
                      (fun (tau, tr) ->
                        Predicate.single (tau :: tp_list, tr :: trs))))))
        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
          (fun a ->
            (match a with (_, (_, ([], _))) -> Predicate.bot_pred
              | (_, (_, (_ :: _, OK))) -> Predicate.bot_pred
              | (theta, (gamma, (vp :: _, Error sa))) ->
                Predicate.bind (infer_v_i_i_i_o_o_i theta gamma vp (Error sa))
                  (fun (_, tr) -> Predicate.single ([], [tr]))))))
and infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a
            with (_, (_, [])) -> Predicate.single ([], ([], ([], ([], OK))))
            | (_, (_, _ :: _)) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: vp_list)) ->
                Predicate.bind (infer_v_i_i_i_o_o_i theta gamma vp OK)
                  (fun (SyntaxVCT.T_refined_type (zp, bp, cp), tr) ->
                    Predicate.bind
                      (infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o_o
                        theta gamma vp_list)
                      (fun (zp_list, (bp_list, (cp_list, (trs, ok)))) ->
                        Predicate.single
                          (zp :: zp_list,
                            (bp :: bp_list,
                              (cp :: cp_list, (tr :: trs, ok)))))))))
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: _)) ->
                Predicate.bind (infer_v_i_i_i_o_o_o theta gamma vp)
                  (fun aa ->
                    (match aa
                      with (SyntaxVCT.T_refined_type (_, _, _), (_, OK)) ->
                        Predicate.bot_pred
                      | (SyntaxVCT.T_refined_type (_, _, _), (tr, Error sa)) ->
                        Predicate.single
                          ([], ([], ([], ([tr], Error sa))))))))))
and infer_v_i_i_i_o_o_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, SyntaxVCT.V_lit _)) -> Predicate.bot_pred
            | (_, (gamma, SyntaxVCT.V_var xp)) ->
              Predicate.bind
                (ContextsPiDelta.eq_o_i (Contexts.lookup_var gamma xp))
                (fun aa ->
                  (match aa with None -> Predicate.bot_pred
                    | Some (Contexts.GEPair (bp, cp)) ->
                      Predicate.single
                        (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, bp,
                             SyntaxUtils.subst_x_cp cp xp
                               (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                          (InferVVar xp, OK))
                    | Some (Contexts.GETyp _) -> Predicate.bot_pred))
            | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, SyntaxVCT.V_lit _)) -> Predicate.bot_pred
              | (_, (gamma, SyntaxVCT.V_var xp)) ->
                Predicate.bind
                  (ContextsPiDelta.eq_i_i
                    (Option.equal_option Contexts.equal_g_entry) None
                    (Contexts.lookup_var gamma xp))
                  (fun () ->
                    Predicate.single
                      (bot_t,
                        (InferVVar xp,
                          Error (CheckFail
                                  ("lookup failed: " ^ s_of xp,
                                    Location.Loc_unknown)))))
              | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xa, xb)))
            (fun a ->
              (match a
                with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                         SyntaxVCT.C_eq
                           (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                             SyntaxVCT.CE_val
                               (SyntaxVCT.V_lit SyntaxVCT.L_true))),
                      (InferVLit, OK))
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (x, (xa, xb)))
              (fun a ->
                (match a
                  with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                    Predicate.single
                      (SyntaxVCT.T_refined_type
                         (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                           SyntaxVCT.C_eq
                             (SyntaxVCT.CE_val
                                (SyntaxVCT.V_var SyntaxVCT.VIndex),
                               SyntaxVCT.CE_val
                                 (SyntaxVCT.V_lit SyntaxVCT.L_false))),
                        (InferVLit, OK))
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (x, (xa, xb)))
                (fun a ->
                  (match a
                    with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num num))) ->
                      Predicate.single
                        (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, SyntaxVCT.B_int,
                             SyntaxVCT.C_eq
                               (SyntaxVCT.CE_val
                                  (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                 SyntaxVCT.CE_val
                                   (SyntaxVCT.V_lit (SyntaxVCT.L_num num)))),
                          (InferVLit, OK))
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin _))) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind (Predicate.single (x, (xa, xb)))
                  (fun a ->
                    (match a
                      with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                        Predicate.single
                          (SyntaxVCT.T_refined_type
                             (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                               SyntaxVCT.C_eq
                                 (SyntaxVCT.CE_val
                                    (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                   SyntaxVCT.CE_val
                                     (SyntaxVCT.V_lit SyntaxVCT.L_one))),
                            (InferVLit, OK))
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind (Predicate.single (x, (xa, xb)))
                    (fun a ->
                      (match a
                        with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                          Predicate.single
                            (SyntaxVCT.T_refined_type
                               (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                                 SyntaxVCT.C_eq
                                   (SyntaxVCT.CE_val
                                      (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                     SyntaxVCT.CE_val
                                       (SyntaxVCT.V_lit SyntaxVCT.L_zero))),
                              (InferVLit, OK))
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                          Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind (Predicate.single (x, (xa, xb)))
                      (fun a ->
                        (match a
                          with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                            Predicate.single
                              (SyntaxVCT.T_refined_type
                                 (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                                   SyntaxVCT.C_eq
                                     (SyntaxVCT.CE_val
(SyntaxVCT.V_var SyntaxVCT.VIndex),
                                       SyntaxVCT.CE_val
 (SyntaxVCT.V_lit SyntaxVCT.L_unit))),
                                (InferVLit, OK))
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                            Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind (Predicate.single (x, (xa, xb)))
                        (fun a ->
                          (match a
                            with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _)))
                              -> Predicate.single
                                   (SyntaxVCT.T_refined_type
                                      (SyntaxVCT.VIndex, SyntaxVCT.B_string,
SyntaxVCT.C_true),
                                     (InferVLit, OK))
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_record _)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_tuple _)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                              Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind (Predicate.single (x, (xa, xb)))
                          (fun a ->
                            (match a
                              with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_hex _))) ->
                                Predicate.bot_pred
                              | (theta,
                                  (_, SyntaxVCT.V_lit (SyntaxVCT.L_bin b_list)))
                                -> Predicate.bind
                                     (ContextsPiDelta.eq_o_i
                                       (Arith.integer_of_nat
 (Stringa.size_literal b_list)))
                                     (fun xc ->
                                       Predicate.bind
 (ContextsPiDelta.eq_o_i (ContextsPiDelta.theta_d theta))
 (fun aa ->
   (match aa with None -> Predicate.bot_pred
     | Some order ->
       Predicate.single
         (SyntaxVCT.T_refined_type
            (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, SyntaxVCT.B_bit),
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_uop
                   (SyntaxVCT.Len,
                     SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                  SyntaxVCT.CE_val (SyntaxVCT.V_lit (SyntaxVCT.L_num xc)))),
           (InferVLit, OK)))))
                              | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _)))
                                -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _)))
                                -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_var _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_vec _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_list _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_record _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_tuple _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind (Predicate.single (x, (xa, xb)))
                            (fun a ->
                              (match a
                                with (_, (_, SyntaxVCT.V_lit _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_var _)) ->
                                  Predicate.bot_pred
                                | (theta, (gamma, SyntaxVCT.V_vec vm_list)) ->
                                  Predicate.bind
                                    (ContextsPiDelta.eq_o_i
                                      (ContextsPiDelta.theta_d theta))
                                    (fun aa ->
                                      (match aa with None -> Predicate.bot_pred
| Some order ->
  Predicate.bind
    (infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o_o theta gamma
      vm_list)
    (fun (_, (bp_list, (_, (trs, ok)))) ->
      Predicate.bind
        (ContextsPiDelta.eq_o_i
          (Arith.integer_of_nat (Lista.size_list bp_list)))
        (fun xc ->
          Predicate.bind (ContextsPiDelta.eq_o_i (Contexts.single_base bp_list))
            (fun ab ->
              (match ab with None -> Predicate.bot_pred
                | Some bm ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bm),
                         SyntaxVCT.C_eq
                           (SyntaxVCT.CE_uop
                              (SyntaxVCT.Len,
                                SyntaxVCT.CE_val
                                  (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                             SyntaxVCT.CE_val
                               (SyntaxVCT.V_lit (SyntaxVCT.L_num xc)))),
                      (InferVBitvec trs, ok))))))))
                                | (_, (_, SyntaxVCT.V_list _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_record _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_tuple _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                  Predicate.bot_pred)))
                          (Predicate.sup_pred
                            (Predicate.bind (Predicate.single (x, (xa, xb)))
                              (fun a ->
                                (match a
                                  with (_, (_, SyntaxVCT.V_lit _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_var _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_vec _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_list _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_record _)) ->
                                    Predicate.bot_pred
                                  | (theta, (gamma, SyntaxVCT.V_tuple vp_list))
                                    -> Predicate.bind
 (infer_v_T_G_vp_list_tp_list_i_i_i_o_o_o theta gamma vp_list)
 (fun (tp_list, (trs, ok)) ->
   Predicate.bind (ContextsPiDelta.eq_o_i (Lista.map UnifyType.b_of tp_list))
     (fun xc ->
       Predicate.single
         (SyntaxVCT.T_refined_type
            (SyntaxVCT.VIndex, SyntaxVCT.B_tuple xc,
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                  SyntaxVCT.CE_val (SyntaxVCT.V_tuple vp_list))),
           (InferVTuple trs, ok))))
                                  | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                    Predicate.bot_pred)))
                            (Predicate.sup_pred
                              (Predicate.bind (Predicate.single (x, (xa, xb)))
                                (fun a ->
                                  (match a
                                    with (_, (_, SyntaxVCT.V_lit _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_var _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_vec _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_list _)) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, SyntaxVCT.V_cons (vp1, vp2)))
                                      -> Predicate.bind
   (infer_v_i_i_i_o_o_o theta gamma vp1)
   (fun (SyntaxVCT.T_refined_type (zp, bp, _), (wt1, ok1)) ->
     Predicate.bind (infer_v_i_i_i_o_o_o theta gamma vp2)
       (fun aa ->
         (match aa
           with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_vec (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (zpa, SyntaxVCT.B_list bpa, _),
               (wt2, ok2))
             -> (if SyntaxVCT.equal_bpa bp bpa && SyntaxVCT.equal_xpa zp zpa
                  then Predicate.single
                         (SyntaxVCT.T_refined_type
                            (SyntaxVCT.VIndex, SyntaxVCT.B_list bp,
                              SyntaxVCT.C_eq
                                (SyntaxVCT.CE_val
                                   (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                  SyntaxVCT.CE_val
                                    (SyntaxVCT.V_cons (vp1, vp2)))),
                           (InferVCons (wt1, wt2), plus ok1 ok2))
                  else Predicate.bot_pred)
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_union (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_finite_set _, _), _) ->
             Predicate.bot_pred)))
                                    | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_record _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_tuple _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                      Predicate.bot_pred)))
                              (Predicate.bind (Predicate.single (x, (xa, xb)))
                                (fun a ->
                                  (match a
                                    with (_, (_, SyntaxVCT.V_lit _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_var _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_vec _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_list _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, SyntaxVCT.V_constr (ctor, vp)))
                                      -> Predicate.bind
   (ContextsPiDelta.eq_o_i (TypingUtils.lookup_ctor_base theta ctor))
   (fun aa ->
     (match aa with None -> Predicate.bot_pred
       | Some (SyntaxVCT.T_refined_type (zp, bp2, cp2), bp) ->
         Predicate.bind (infer_v_i_i_i_o_o_o theta gamma vp)
           (fun (SyntaxVCT.T_refined_type (zpa, bp1, cp1), (wt1, ok1)) ->
             (if SyntaxVCT.equal_xpa zp zpa
               then Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                      (fun ab ->
                        (match ab with None -> Predicate.bot_pred
                          | Some bsub ->
                            Predicate.bind
                              (subtype_i_i_i_i_i_o_o Location.Loc_unknown theta
                                gamma
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp1 bsub,
                                    cp1))
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp2 bsub,
                                    cp2)))
                              (fun (_, ok2) ->
                                Predicate.single
                                  (SyntaxVCT.T_refined_type
                                     (zp, TypingUtils.tsubst_bp_many bp bsub,
                                       SyntaxVCT.C_eq
 (SyntaxVCT.CE_val (SyntaxVCT.V_var zp),
   SyntaxVCT.CE_val (SyntaxVCT.V_constr (ctor, vp)))),
                                    (wt1, plus ok1 ok2)))))
               else Predicate.bot_pred))))
                                    | (_, (_, SyntaxVCT.V_record _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_tuple _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                      Predicate.bot_pred)))))))))))))))
and infer_v_T_G_vp_list_tp_list_i_i_i_o_o_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, [])) -> Predicate.single ([], ([], OK))
            | (_, (_, _ :: _)) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: vp_list)) ->
                Predicate.bind (infer_v_i_i_i_o_o_i theta gamma vp OK)
                  (fun (tau, tr) ->
                    Predicate.bind
                      (infer_v_T_G_vp_list_tp_list_i_i_i_o_o_o theta gamma
                        vp_list)
                      (fun (tp_list, (trs, ok)) ->
                        Predicate.single (tau :: tp_list, (tr :: trs, ok)))))))
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: _)) ->
                Predicate.bind (infer_v_i_i_i_o_o_o theta gamma vp)
                  (fun aa ->
                    (match aa with (_, (_, OK)) -> Predicate.bot_pred
                      | (_, (tr, Error sa)) ->
                        Predicate.single ([], ([tr], Error sa))))))));;

let rec check_pat_i_i_i_i_i_i_o_o_o_o_o_o
  x xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
              Predicate.bot_pred
            | (i1, (_, (_, (SyntaxPED.Pp_wild loc,
                             (SyntaxVCT.T_refined_type (zp, bp, cp), _)))))
              -> Predicate.bind
                   (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1))
                   (fun (i2, xp2) ->
                     Predicate.single
                       ([(xp2, (bp, SyntaxUtils.subst_x_cp cp zp
                                      (SyntaxVCT.V_var xp2)))],
                         ([xp2],
                           (SyntaxPED.Pp_wild
                              (TypingUtils.upd_t loc
                                (SyntaxVCT.T_refined_type (zp, bp, cp))),
                             (i2, (CheckPWild, OK))))))
            | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) -> Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) -> Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) -> Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
          (fun a ->
            (match a
              with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) -> Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                Predicate.bot_pred
              | (i, (_, (_, (SyntaxPED.Pp_id (loc, idd),
                              (SyntaxVCT.T_refined_type (zp, bp, cp), vp)))))
                -> Predicate.single
                     ([(SyntaxVCT.VNamed idd,
                         (bp, SyntaxVCT.C_eq
                                (SyntaxVCT.CE_val vp,
                                  SyntaxVCT.CE_val
                                    (SyntaxVCT.V_var
                                      (SyntaxVCT.VNamed idd)))))],
                       ([SyntaxVCT.VNamed idd],
                         (SyntaxPED.Pp_id
                            (TypingUtils.upd_t loc
                               (SyntaxVCT.T_refined_type (zp, bp, cp)),
                              idd),
                           (i, (CheckPId, OK)))))
              | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
            (fun a ->
              (match a
                with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_var _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_tid _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_int, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_bool, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_bit, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_unit, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_real, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_vec (_, _), _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_list _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (i1, (theta,
                         (gamma,
                           (SyntaxPED.Pp_tup (loc, patp_list),
                             (SyntaxVCT.T_refined_type
                                (zp, SyntaxVCT.B_tuple bp_list, cp),
                               vp)))))
                  -> Predicate.bind
                       (ContextsPiDelta.eq_o_i (mk_fresh_lbl i1 "ptup"))
                       (fun (i2, xp) ->
                         Predicate.bind
                           (ContextsPiDelta.eq_o_i
                             (TypingUtils.mk_proj_vars xp bp_list))
                           (fun (xp_list, klist1) ->
                             Predicate.bind
                               (ContextsPiDelta.eq_o_i
                                 ((xp, (SyntaxVCT.B_tuple bp_list,
 SyntaxVCT.C_conj
   (SyntaxUtils.subst_x_cp cp zp (SyntaxVCT.V_var xp),
     SyntaxUtils.mk_v_eq_c xp vp))) ::
                                   klist1))
                               (fun xa ->
                                 Predicate.bind
                                   (check_pat_list_i_i_i_i_i_o_i_o_o_o_o i2
                                     theta (TypingUtils.g_cons3 gamma [xa])
                                     patp_list bp_list
                                     (Lista.map (fun aa -> SyntaxVCT.V_var aa)
                                       xp_list))
                                   (fun (klist2, (patp_lista, (i3, (trs, ok))))
                                     -> Predicate.bind
  (ContextsPiDelta.eq_o_i (merge_klist xa klist2))
  (fun xg ->
    Predicate.single
      (Lista.concat [xg],
        (xp_list,
          (SyntaxPED.Pp_tup
             (TypingUtils.upd_t loc
                (SyntaxVCT.T_refined_type (zp, SyntaxVCT.B_tuple bp_list, cp)),
               patp_lista),
            (i3, (CheckPTuple trs, ok))))))))))
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_union (_, _), _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_record _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_undef, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_reg _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_string, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_exception, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_finite_set _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
              (fun a ->
                (match a
                  with (i1, (theta,
                              (_, (SyntaxPED.Pp_lit (loc, lit),
                                    (SyntaxVCT.T_refined_type (zp, bp, cp),
                                      xp1)))))
                    -> Predicate.bind
                         (UnifyType.unify_b_i_i_o (b_of_lit_full theta lit) bp)
                         (fun aa ->
                           (match aa with None -> Predicate.bot_pred
                             | Some _ ->
                               Predicate.bind
                                 (ContextsPiDelta.eq_o_i
                                   (TypingUtils.mk_fresh_i i1))
                                 (fun (i2, xp2) ->
                                   Predicate.single
                                     ([(xp2,
 (b_of_lit_full theta lit,
   SyntaxVCT.C_eq
     (SyntaxVCT.CE_val xp1, SyntaxVCT.CE_val (SyntaxVCT.V_lit lit))))],
                                       ([xp2],
 (SyntaxPED.Pp_lit
    (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)), lit),
   (i2, (CheckPLit, OK))))))))
                  | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                (fun a ->
                  (match a
                    with (i1, (theta,
                                (_, (SyntaxPED.Pp_lit (loc, lit),
                                      (SyntaxVCT.T_refined_type (zp, bp, cp),
_)))))
                      -> Predicate.bind
                           (UnifyType.unify_b_i_i_o (b_of_lit_full theta lit)
                             bp)
                           (fun aa ->
                             (match aa
                               with None ->
                                 Predicate.single
                                   ([], ([],
  (SyntaxPED.Pp_lit
     (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)), lit),
    (i1, (CheckPLit,
           Error (CheckFail
                   ("Pattern literal. Base type mismatch", get_loc loc)))))))
                               | Some _ -> Predicate.bot_pred))
                    | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_var _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_tid _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_int, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_bool, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_bit, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_unit, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_real, _),
_)))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (gamma,
                                 (SyntaxPED.Pp_vector_concat (loc, cs),
                                   (SyntaxVCT.T_refined_type
                                      (zp, SyntaxVCT.B_vec (odr, bp), cp),
                                     xpa)))))
                        -> Predicate.bind
                             (check_pat_list_i_i_i_i_i_o_i_o_o_o_o i1 theta
                               gamma cs
                               (Lista.replicate (Lista.size_list cs)
                                 (SyntaxVCT.B_vec (odr, bp)))
                               (Lista.replicate (Lista.size_list cs) xpa))
                             (fun (klist, (csa, (i2, (trs, ok)))) ->
                               Predicate.single
                                 (klist,
                                   ([], (SyntaxPED.Pp_vector_concat
   (TypingUtils.upd_t loc
      (SyntaxVCT.T_refined_type (zp, SyntaxVCT.B_vec (odr, bp), cp)),
     csa),
  (i2, (CheckPVec trs, ok))))))
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_list _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_tuple _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_union (_, _), _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_record _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_undef, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_reg _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_string, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_exception, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_finite_set _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind
                    (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (i1, (theta,
                                 (gamma,
                                   (SyntaxPED.Pp_typ (loc, tau_1, patp),
                                     (SyntaxVCT.T_refined_type (zp, bp, cp),
                                       xpa)))))
                          -> Predicate.bind
                               (check_pat_i_i_i_i_i_i_o_o_o_o_o_o i1 theta gamma
                                 patp tau_1 xpa)
                               (fun (klist, (xlist, (patpa, (i2, (wt1, ok1)))))
                                 -> Predicate.bind
                                      (subtype_i_i_i_i_i_o_o (get_loc loc) theta
(TypingUtils.g_cons3 gamma [klist]) tau_1
(SyntaxVCT.T_refined_type (zp, bp, cp)))
                                      (fun (_, ok2) ->
Predicate.single
  (klist,
    (xlist,
      (SyntaxPED.Pp_typ
         (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)), tau_1,
           patpa),
        (i2, (wt1, plus ok1 ok2)))))))
                        | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _))))
                          -> Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind
                      (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                      (fun a ->
                        (match a
                          with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (i1, (theta,
                                   (gamma,
                                     (SyntaxPED.Pp_app (loc, id, patp_list),
                                       (tau_2, _)))))
                            -> Predicate.bind
                                 (ContextsPiDelta.eq_o_i
                                   (TypingUtils.lookup_ctor_base theta id))
                                 (fun aa ->
                                   (match aa with None -> Predicate.bot_pred
                                     | Some (tau_in, b_variant) ->
                                       Predicate.bind
 (ContextsPiDelta.eq_o_i
   (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, b_variant, SyntaxVCT.C_true)))
 (fun xa ->
   Predicate.bind (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1))
     (fun (i2, xp3) ->
       Predicate.bind
         (UnifyType.unify_b_i_i_o (UnifyType.b_of xa) (UnifyType.b_of tau_2))
         (fun ab ->
           (match ab with None -> Predicate.bot_pred
             | Some bsub ->
               Predicate.bind
                 (ContextsPiDelta.eq_o_i
                   (TypingUtils.tsubst_t_many tau_in bsub))
                 (fun (SyntaxVCT.T_refined_type (zp, bp, cp)) ->
                   Predicate.bind
                     (subtype_i_i_i_i_i_o_o (get_loc loc) theta gamma tau_2 xa)
                     (fun (_, ok2) ->
                       Predicate.bind
                         (check_pat_i_i_i_i_i_i_o_o_o_o_o_o i2 theta
                           (Contexts.add_var gamma
                             (xp3, Contexts.GEPair
                                     (bp, SyntaxUtils.subst_x_cp cp zp
    (SyntaxVCT.V_var xp3))))
                           (SyntaxPED.Pp_tup (loc, patp_list))
                           (SyntaxVCT.T_refined_type (zp, bp, cp))
                           (SyntaxVCT.V_var xp3))
                         (fun ac ->
                           (match ac
                             with (_, (_, (SyntaxPED.Pp_lit (_, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_wild _, _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_typ (_, _, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_id (_, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_app (_, _, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_vector (_, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))
                               -> Predicate.bot_pred
                             | (klist,
                                 (xlist,
                                   (SyntaxPED.Pp_tup (_, patp_lista),
                                     (i3, (wt1, ok1)))))
                               -> Predicate.bind
                                    (ContextsPiDelta.eq_o_i
                                      (Contexts.mk_ctor_v id xlist))
                                    (fun _ ->
                                      Predicate.single
((xp3, (bp, SyntaxUtils.subst_x_cp cp zp (SyntaxVCT.V_var xp3))) :: klist,
  (xp3 :: xlist,
    (SyntaxPED.Pp_app (TypingUtils.upd_t loc tau_2, id, patp_lista),
      (i3, (CheckPApp wt1, plus ok1 ok2))))))
                             | (_, (_, (SyntaxPED.Pp_list (_, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_cons (_, _, _), _))) ->
                               Predicate.bot_pred
                             | (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))
                               -> Predicate.bot_pred))))))))))
                          | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
  _))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _),
  _))))
                            -> Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind
                        (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                        (fun a ->
                          (match a
                            with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_app (_, _, []), _)))) ->
                              Predicate.bot_pred
                            | (i1a, (theta,
                                      (gamma,
(SyntaxPED.Pp_app (loca, ida, [patpa]), (tau_2a, _)))))
                              -> Predicate.bind
                                   (ContextsPiDelta.eq_o_i
                                     (TypingUtils.lookup_ctor_base theta ida))
                                   (fun aa ->
                                     (match aa with None -> Predicate.bot_pred
                                       | Some (tau_ina, b_varianta) ->
 Predicate.bind
   (ContextsPiDelta.eq_o_i
     (SyntaxVCT.T_refined_type
       (SyntaxVCT.VIndex, b_varianta, SyntaxVCT.C_true)))
   (fun xa ->
     Predicate.bind (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1a))
       (fun (i2a, xp3a) ->
         Predicate.bind (ContextsPiDelta.eq_o_i xp3a)
           (fun _ ->
             Predicate.bind
               (UnifyType.unify_b_i_i_o (UnifyType.b_of xa)
                 (UnifyType.b_of tau_2a))
               (fun ab ->
                 (match ab with None -> Predicate.bot_pred
                   | Some bsuba ->
                     Predicate.bind
                       (ContextsPiDelta.eq_o_i
                         (TypingUtils.tsubst_t_many tau_ina bsuba))
                       (fun (SyntaxVCT.T_refined_type (zpa, bpa, cpa)) ->
                         Predicate.bind
                           (ContextsPiDelta.eq_o_i
                             (Contexts.GEPair
                               (bpa, SyntaxUtils.subst_x_cp cpa zpa
                                       (SyntaxVCT.V_var xp3a))))
                           (fun _ ->
                             Predicate.bind
                               (subtype_i_i_i_i_i_o_o (get_loc loca) theta gamma
                                 tau_2a xa)
                               (fun (_, ok2a) ->
                                 Predicate.bind
                                   (check_pat_i_i_i_i_i_i_o_o_o_o_o_o i2a theta
                                     (Contexts.add_var gamma
                                       (xp3a,
 Contexts.GEPair (bpa, SyntaxUtils.subst_x_cp cpa zpa (SyntaxVCT.V_var xp3a))))
                                     patpa
                                     (SyntaxVCT.T_refined_type (zpa, bpa, cpa))
                                     (SyntaxVCT.V_var xp3a))
                                   (fun (klista,
  (xlista, (patp_a, (i3a, (wt1a, ok1a)))))
                                     -> Predicate.bind
  (ContextsPiDelta.eq_o_i (Contexts.mk_ctor_v ida xlista))
  (fun _ ->
    Predicate.single
      ((xp3a, (bpa, SyntaxUtils.subst_x_cp cpa zpa (SyntaxVCT.V_var xp3a))) ::
         klista,
        (xp3a :: xlista,
          (SyntaxPED.Pp_app (TypingUtils.upd_t loca tau_2a, ida, [patp_a]),
            (i3a, (CheckPApp wt1a, plus ok1a ok2a)))))))))))))))))
                            | (_, (_, (_,
(SyntaxPED.Pp_app (_, _, _ :: _ :: _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_,
(SyntaxPED.Pp_vector_concat (_, _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_,
(SyntaxPED.Pp_string_append (_, _), _))))
                              -> Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind
                          (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                          (fun a ->
                            (match a
                              with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                                Predicate.bot_pred
                              | (_, (_, (_,
  (SyntaxPED.Pp_as_var (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                                Predicate.bot_pred
                              | (_, (_, (_,
  (SyntaxPED.Pp_as_typ (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (SyntaxPED.Pp_vector_concat (_, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                                Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                                Predicate.bot_pred
                              | (i, (_, (_,
  (SyntaxPED.Pp_cons (loc, _, _), (t, _)))))
                                -> Predicate.single
                                     ([], ([],
    (SyntaxPED.Pp_wild (TypingUtils.upd_t loc t),
      (i, (CheckPNull, Error (CheckFail ("Pp_cons not impl", get_loc loc)))))))
                              | (_, (_, (_,
  (SyntaxPED.Pp_string_append (_, _), _))))
                                -> Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind
                            (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                            (fun a ->
                              (match a
                                with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_var (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_vector_concat (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (i, (_,
(_, (SyntaxPED.Pp_list (loc, _), (t, _)))))
                                  -> Predicate.single
                                       ([],
 ([], (SyntaxPED.Pp_wild (TypingUtils.upd_t loc t),
        (i, (CheckPNull,
              Error (CheckFail ("Pp_list not impl", get_loc loc)))))))
                                | (_, (_,
(_, (SyntaxPED.Pp_cons (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_string_append (_, _), _))))
                                  -> Predicate.bot_pred)))
                          (Predicate.bind
                            (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                            (fun a ->
                              (match a
                                with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_var (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_vector_concat (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_cons (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (i, (_,
(_, (SyntaxPED.Pp_string_append (loc, _), (t, _)))))
                                  -> Predicate.single
                                       ([],
 ([], (SyntaxPED.Pp_wild (TypingUtils.upd_t loc t),
        (i, (CheckPNull,
              Error (CheckFail
                      ("Pp_string_append not impl",
                        get_loc loc))))))))))))))))))))
and check_pat_list_i_i_i_i_i_o_i_o_o_o_o
  x xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (i, (_, (_, ([], ([], []))))) ->
              Predicate.single (TypingUtils.k_list [], ([], (i, ([], OK))))
            | (_, (_, (_, ([], ([], _ :: _))))) -> Predicate.bot_pred
            | (_, (_, (_, ([], (_ :: _, _))))) -> Predicate.bot_pred
            | (_, (_, (_, (_ :: _, _)))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a with (_, (_, (_, ([], _)))) -> Predicate.bot_pred
            | (_, (_, (_, (_ :: _, ([], _))))) -> Predicate.bot_pred
            | (_, (_, (_, (_ :: _, (_ :: _, []))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (gamma,
                       (patp :: patp_list, (bp :: bp_list, vp :: vp_list)))))
              -> Predicate.bind
                   (check_pat_i_i_i_i_i_i_o_o_o_o_o_o i1 theta gamma patp
                     (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, bp, SyntaxVCT.C_true))
                     vp)
                   (fun (klist, (_, (patpa, (i2, (wt1, ok1))))) ->
                     Predicate.bind
                       (check_pat_list_i_i_i_i_i_o_i_o_o_o_o i2 theta
                         (TypingUtils.g_cons3 gamma [klist]) patp_list bp_list
                         vp_list)
                       (fun (klist2, (patp_lista, (i3, (trs, ok2)))) ->
                         Predicate.single
                           (TypingUtils.k_append [klist; klist2],
                             (patpa :: patp_lista,
                               (i3, (wt1 :: trs, plus ok1 ok2)))))))));;

end;; (*struct TypingDeclFailRulesVP*)
module TypingDeclFailRules : sig
  type check_e_w = CheckCase of infer_e_w * check_pexp_w list |
    CheckIf of
      infer_e_w * TypingDeclFailRulesVP.subtype_w * check_e_w * check_e_w
    | CheckRecord of check_e_w list |
    CheckSubtype of infer_e_w * TypingDeclFailRulesVP.subtype_w |
    CheckAssign of check_lexp_w | CheckVar of check_lexp_w * check_e_w
  and infer_e_w = NullTr | InferVal of TypingDeclFailRulesVP.infer_v_w |
    InferApp of infer_e_w * TypingDeclFailRulesVP.subtype_w |
    InferTuple of infer_e_w list | LookupMVar | InferVecConcat of infer_e_w list
    | InferLoop of infer_e_w * check_e_w |
    InferRecordUpdate of infer_e_w * check_e_w list
  and check_lexp_w = LExp_bound of check_e_w | LExp_unbound of infer_e_w
  and check_pexp_w = CheckPExp of TypingDeclFailRulesVP.check_pat_w * check_e_w
  type infer_letbind_w =
    LetBindInf of infer_e_w * TypingDeclFailRulesVP.check_pat_w |
    LetBindCheck of check_e_w * TypingDeclFailRulesVP.check_pat_w
  type check_def_w = CheckFunDef of check_pexp_w list |
    CheckLetDef of infer_letbind_w | CheckDef
  val ep_null : (SyntaxVCT.tau option) SyntaxPED.ep
  val upd_t_none : 'a * 'b -> 'a * 'c option
  val is_not_ptyp : 'a SyntaxPED.patp -> bool
  val match_arg_i_i_i_i_i_i_i_o_o_o_o :
    Location.loc ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          SyntaxVCT.xp ->
            SyntaxVCT.bp ->
              SyntaxVCT.cp ->
                (SyntaxVCT.xp * SyntaxVCT.ap) list ->
                  ((SyntaxVCT.xp * SyntaxVCT.ap) *
                    ((string * SyntaxVCT.bp) list *
                      (TypingDeclFailRulesVP.subtype_w *
                        TypingDeclFailRulesVP.err
                          TypingDeclFailRulesVP.ok_error)))
                    Predicate.pred
  val check_pexp_i_i_i_i_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.pexpp ->
                SyntaxVCT.tau ->
                  SyntaxVCT.tau ->
                    SyntaxVCT.vp ->
                      (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                         Contexts.gamma_ext *
                        ((SyntaxVCT.tau option) SyntaxPED.pexpp *
                          (Arith.nat *
                            (check_pexp_w *
                              TypingDeclFailRulesVP.err
                                TypingDeclFailRulesVP.ok_error))))
                        Predicate.pred
  val check_pexp_list_i_i_i_i_i_i_i_i_i_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.pexpp list ->
                SyntaxVCT.tau ->
                  SyntaxVCT.tau ->
                    SyntaxVCT.vp ->
                      ((SyntaxVCT.tau option) SyntaxPED.pexpp list *
                        (Arith.nat *
                          (check_pexp_w list *
                            TypingDeclFailRulesVP.err
                              TypingDeclFailRulesVP.ok_error)))
                        Predicate.pred
  val check_e_i_i_i_i_i_i_i_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.ep ->
                SyntaxVCT.tau ->
                  ((SyntaxVCT.tau option) SyntaxPED.ep *
                    (Arith.nat *
                      (check_e_w *
                        TypingDeclFailRulesVP.err
                          TypingDeclFailRulesVP.ok_error)))
                    Predicate.pred
  val check_e_list_i_i_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.ep list ->
                SyntaxVCT.tau list ->
                  (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                     Contexts.gamma_ext *
                    ((SyntaxVCT.tau option) SyntaxPED.ep list *
                      (Arith.nat *
                        (check_e_w list *
                          TypingDeclFailRulesVP.err
                            TypingDeclFailRulesVP.ok_error))))
                    Predicate.pred
  val infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.ep ->
                (SyntaxVCT.tau *
                  (SyntaxVCT.vp *
                    ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                      ((SyntaxVCT.tau option) SyntaxPED.ep *
                        (Arith.nat *
                          (infer_e_w *
                            TypingDeclFailRulesVP.err
                              TypingDeclFailRulesVP.ok_error))))))
                  Predicate.pred
  val infer_letbind_i_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.letbindp ->
                ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                  ((SyntaxVCT.tau option) SyntaxPED.letbindp *
                    (Arith.nat *
                      (infer_letbind_w *
                        TypingDeclFailRulesVP.err
                          TypingDeclFailRulesVP.ok_error))))
                  Predicate.pred
  val infer_e_list_i_i_i_i_i_i_o_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.ep list ->
                (SyntaxVCT.tau list *
                  (SyntaxVCT.vp list *
                    ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                      ((SyntaxVCT.tau option) SyntaxPED.ep list *
                        (Arith.nat *
                          (infer_e_w list *
                            TypingDeclFailRulesVP.err
                              TypingDeclFailRulesVP.ok_error))))))
                  Predicate.pred
  val infer_app_i_i_i_i_i_i_i_i_o_o_o_o_o_o_o_o_o :
    Arith.nat ->
      Location.loc ->
        unit ContextsPiDelta.theta_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
            ContextsPiDelta.phi_ext ->
            ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
              unit ContextsPiDelta.delta_ext ->
                (SyntaxVCT.xp * SyntaxVCT.ap) list ->
                  (SyntaxVCT.tau option) SyntaxPED.ep ->
                    (SyntaxVCT.tau *
                      (SyntaxVCT.vp *
                        ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                          (SyntaxVCT.xp *
                            ((string * SyntaxVCT.bp) list *
                              ((SyntaxVCT.tau option) SyntaxPED.ep *
                                (Arith.nat *
                                  (infer_e_w *
                                    TypingDeclFailRulesVP.err
                                      TypingDeclFailRulesVP.ok_error))))))))
                      Predicate.pred
  val infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o_o_o
    : Arith.nat ->
        unit ContextsPiDelta.theta_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
            ContextsPiDelta.phi_ext ->
            ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
              unit ContextsPiDelta.delta_ext ->
                (SyntaxVCT.tau option) SyntaxPED.ep list ->
                  (SyntaxVCT.xp *
                    (SyntaxVCT.order *
                      (SyntaxVCT.bp *
                        (SyntaxVCT.cp list *
                          (SyntaxVCT.vp list *
                            (((SyntaxVCT.xp *
                                (SyntaxVCT.bp * SyntaxVCT.cp)) list) list *
                              ((SyntaxVCT.tau option) SyntaxPED.ep list *
                                (Arith.nat *
                                  (infer_e_w list *
                                    TypingDeclFailRulesVP.err
                                      TypingDeclFailRulesVP.ok_error)))))))))
                    Predicate.pred
  val check_lexp_i_i_i_i_i_i_i_o_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              (SyntaxVCT.tau option) SyntaxPED.lexpp ->
                (SyntaxVCT.tau option) SyntaxPED.ep ->
                  (unit ContextsPiDelta.delta_ext *
                    ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                      ((SyntaxVCT.tau option) SyntaxPED.lexpp *
                        ((SyntaxVCT.tau option) SyntaxPED.ep *
                          (Arith.nat *
                            (check_lexp_w *
                              TypingDeclFailRulesVP.err
                                TypingDeclFailRulesVP.ok_error))))))
                    Predicate.pred
  val check_funcl_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            (SyntaxVCT.tau option) SyntaxPED.funclp ->
              SyntaxVCT.xp ->
                SyntaxVCT.bp ->
                  SyntaxVCT.cp ->
                    SyntaxVCT.tau ->
                      (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                         ContextsPiDelta.phi_ext *
                        (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                           Contexts.gamma_ext *
                          ((SyntaxVCT.tau option) SyntaxPED.funclp *
                            (Arith.nat *
                              (check_pexp_w *
                                TypingDeclFailRulesVP.err
                                  TypingDeclFailRulesVP.ok_error)))))
                        Predicate.pred
  val check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            (SyntaxVCT.tau option) SyntaxPED.funclp list ->
              SyntaxVCT.xp ->
                SyntaxVCT.bp ->
                  SyntaxVCT.cp ->
                    SyntaxVCT.tau ->
                      (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                         ContextsPiDelta.phi_ext *
                        (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                           Contexts.gamma_ext *
                          ((SyntaxVCT.tau option) SyntaxPED.funclp list *
                            (Arith.nat *
                              (check_pexp_w list *
                                TypingDeclFailRulesVP.err
                                  TypingDeclFailRulesVP.ok_error)))))
                        Predicate.pred
  val check_def_i_i_i_i_i_o_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            (SyntaxVCT.tau option) SyntaxPED.defp ->
              (unit ContextsPiDelta.theta_ext *
                (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                   ContextsPiDelta.phi_ext *
                  (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                     Contexts.gamma_ext *
                    ((SyntaxVCT.tau option) SyntaxPED.defp *
                      (Arith.nat *
                        (check_def_w *
                          TypingDeclFailRulesVP.err
                            TypingDeclFailRulesVP.ok_error))))))
                Predicate.pred
  val check_defs_i_i_i_i_i_o_o_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
          ContextsPiDelta.phi_ext ->
          ((SyntaxVCT.tau option) SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            (SyntaxVCT.tau option) SyntaxPED.defp list ->
              (unit ContextsPiDelta.theta_ext *
                (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                   ContextsPiDelta.phi_ext *
                  (((SyntaxVCT.tau option) SyntaxPED.pexpp, unit)
                     Contexts.gamma_ext *
                    ((SyntaxVCT.tau option) SyntaxPED.defp list *
                      (Arith.nat *
                        (check_def_w list *
                          TypingDeclFailRulesVP.err
                            TypingDeclFailRulesVP.ok_error))))))
                Predicate.pred
  val check_prog_i_o_o_o :
    (SyntaxVCT.tau option) SyntaxPED.progp ->
      ((SyntaxVCT.tau option) SyntaxPED.progp *
        (check_def_w list *
          TypingDeclFailRulesVP.err TypingDeclFailRulesVP.ok_error))
        Predicate.pred
end = struct

type check_e_w = CheckCase of infer_e_w * check_pexp_w list |
  CheckIf of infer_e_w * TypingDeclFailRulesVP.subtype_w * check_e_w * check_e_w
  | CheckRecord of check_e_w list |
  CheckSubtype of infer_e_w * TypingDeclFailRulesVP.subtype_w |
  CheckAssign of check_lexp_w | CheckVar of check_lexp_w * check_e_w
and infer_e_w = NullTr | InferVal of TypingDeclFailRulesVP.infer_v_w |
  InferApp of infer_e_w * TypingDeclFailRulesVP.subtype_w |
  InferTuple of infer_e_w list | LookupMVar | InferVecConcat of infer_e_w list |
  InferLoop of infer_e_w * check_e_w |
  InferRecordUpdate of infer_e_w * check_e_w list
and check_lexp_w = LExp_bound of check_e_w | LExp_unbound of infer_e_w
and check_pexp_w = CheckPExp of TypingDeclFailRulesVP.check_pat_w * check_e_w;;

type infer_letbind_w =
  LetBindInf of infer_e_w * TypingDeclFailRulesVP.check_pat_w |
  LetBindCheck of check_e_w * TypingDeclFailRulesVP.check_pat_w;;

type check_def_w = CheckFunDef of check_pexp_w list |
  CheckLetDef of infer_letbind_w | CheckDef;;

let ep_null : (SyntaxVCT.tau option) SyntaxPED.ep
  = SyntaxPED.Ep_val
      ((Location.Loc_unknown,
         Some (SyntaxVCT.T_refined_type
                (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false))),
        SyntaxVCT.V_lit SyntaxVCT.L_unit);;

let rec upd_t_none (loc, uu) = (loc, None);;

let rec is_not_ptyp = function SyntaxPED.Pp_typ (uu, uv, uw) -> false
                      | SyntaxPED.Pp_lit (v, va) -> true
                      | SyntaxPED.Pp_wild v -> true
                      | SyntaxPED.Pp_as_var (v, va, vb) -> true
                      | SyntaxPED.Pp_id (v, va) -> true
                      | SyntaxPED.Pp_as_typ (v, va, vb) -> true
                      | SyntaxPED.Pp_app (v, va, vb) -> true
                      | SyntaxPED.Pp_vector (v, va) -> true
                      | SyntaxPED.Pp_vector_concat (v, va) -> true
                      | SyntaxPED.Pp_tup (v, va) -> true
                      | SyntaxPED.Pp_list (v, va) -> true
                      | SyntaxPED.Pp_cons (v, va, vb) -> true
                      | SyntaxPED.Pp_string_append (v, va) -> true;;

let rec match_arg_i_i_i_i_i_i_i_o_o_o_o
  x xa xb xc xd xe xf =
    Predicate.bind (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, xf)))))))
      (fun a ->
        (match a with (_, (_, (_, (_, (_, (_, [])))))) -> Predicate.bot_pred
          | (_, (_, (_, (_, (_, (_, (_, SyntaxVCT.A_monotype _) :: _)))))) ->
            Predicate.bot_pred
          | (loc, (theta,
                    (gamma,
                      (zp2, (bp2, (cp2, (f,
  SyntaxVCT.A_function
    (xp1, bp1, cp1, SyntaxVCT.T_refined_type (zp3, bp3, cp3))) ::
  _))))))
            -> Predicate.bind
                 (ContextsPiDelta.eq_o_i (Debug.trace "match_arg_headI start"))
                 (fun _ ->
                   Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                     (fun aa ->
                       (match aa with None -> Predicate.bot_pred
                         | Some bsub ->
                           Predicate.bind
                             (ContextsPiDelta.eq_o_i
                               (Debug.trace "match_arg_headI end"))
                             (fun _ ->
                               Predicate.bind
                                 (TypingDeclFailRulesVP.subtype_i_i_i_i_i_o_o
                                   loc theta gamma
                                   (SyntaxVCT.T_refined_type
                                     (zp2, TypingDeclFailRulesVP.tsubst_bp_many
     bp2 bsub,
                                       cp2))
                                   (SyntaxVCT.T_refined_type
                                     (xp1, TypingDeclFailRulesVP.tsubst_bp_many
     bp1 bsub,
                                       cp1)))
                                 (fun (tr, ok) ->
                                   Predicate.single
                                     ((f,
SyntaxVCT.A_function (xp1, bp1, cp1, SyntaxVCT.T_refined_type (zp3, bp3, cp3))),
                                       (bsub, (tr, ok))))))))));;

let rec check_pexp_i_i_i_i_i_i_i_i_i_o_o_o_o_o
  xa xb xc xd xe xf xg xh xi =
    Predicate.sup_pred
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a
            with (i1, (theta,
                        (phi, (gamma,
                                (delta,
                                  (SyntaxPED.PEXPp_exp (_, patp, ep),
                                    (SyntaxVCT.T_refined_type (zp, bp, cp),
                                      (tau, xp))))))))
              -> Predicate.bind
                   (TypingDeclFailRulesVP.check_pat_i_i_i_i_i_i_o_o_o_o_o_o i1
                     theta gamma patp (SyntaxVCT.T_refined_type (zp, bp, cp))
                     xp)
                   (fun (klist, (_, (patpa, (i3, (wt1e, ok1))))) ->
                     Predicate.bind
                       (check_e_i_i_i_i_i_i_i_o_o_o_o i3 theta phi
                         (TypingUtils.g_cons3 gamma [klist]) delta ep tau)
                       (fun (epa, (i4, (wt2a, ok2))) ->
                         Predicate.single
                           (TypingUtils.g_cons3 gamma [klist],
                             (SyntaxPED.PEXPp_exp
                                (SyntaxPED.annot_e epa, patpa, epa),
                               (i4, (CheckPExp (wt1e, wt2a),
                                      TypingDeclFailRulesVP.plus ok1 ok2))))))
            | (_, (_, (_, (_, (_, (SyntaxPED.PEXPp_when (_, _, _, _), _)))))) ->
              Predicate.bot_pred)))
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, (_, (SyntaxPED.PEXPp_exp (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (delta,
                               (SyntaxPED.PEXPp_when (_, patp, ep1, ep2),
                                 (tau_2, (tau_1, xp))))))))
              -> Predicate.bind
                   (TypingDeclFailRulesVP.check_pat_i_i_i_i_i_i_o_o_o_o_o_o i1
                     theta gamma patp tau_2 xp)
                   (fun (klist, (_, (patpa, (i3, (wt1e, ok1))))) ->
                     Predicate.bind
                       (check_e_i_i_i_i_i_i_i_o_o_o_o i3 theta phi
                         (TypingUtils.g_cons3 gamma [klist]) delta ep1
                         (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                             SyntaxVCT.C_true)))
                       (fun (ep1a, (i4, (wt2a, ok2))) ->
                         Predicate.bind
                           (check_e_i_i_i_i_i_i_i_o_o_o_o i4 theta phi
                             (TypingUtils.g_cons3
                               (TypingUtils.g_cons3 gamma [klist]) [])
                             delta ep2 tau_1)
                           (fun (ep2a, (i5, (_, ok3))) ->
                             Predicate.single
                               (TypingUtils.g_cons3
                                  (TypingUtils.g_cons3 gamma []) [klist],
                                 (SyntaxPED.PEXPp_when
                                    (SyntaxPED.annot_e ep1a, patpa, ep1a, ep2a),
                                   (i5, (CheckPExp (wt1e, wt2a),
  TypingDeclFailRulesVP.plus ok1 (TypingDeclFailRulesVP.plus ok2 ok3)))))))))))
and check_pexp_list_i_i_i_i_i_i_i_i_i_o_o_o_o
  xa xb xc xd xe xf xg xh xi =
    Predicate.sup_pred
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, ([], _)))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma, (delta, ([pexp], (tau_pat, (t_exp, xp))))))))
              -> Predicate.bind
                   (check_pexp_i_i_i_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma
                     delta pexp tau_pat t_exp xp)
                   (fun (_, (pexpa, (i2, (tra, ok)))) ->
                     Predicate.single ([pexpa], (i2, ([tra], ok))))
            | (_, (_, (_, (_, (_, (_ :: _ :: _, _)))))) -> Predicate.bot_pred)))
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, ([], _)))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (delta,
                               (pexp :: pexp_list, (tau_pat, (t_exp, xp))))))))
              -> Predicate.bind (Predicate.if_pred (not (Lista.null pexp_list)))
                   (fun () ->
                     Predicate.bind
                       (check_pexp_i_i_i_i_i_i_i_i_i_o_o_o_o_o i1 theta phi
                         gamma delta pexp tau_pat t_exp xp)
                       (fun (_, (pexpa, (i2, (wt1f, ok1)))) ->
                         Predicate.bind
                           (check_pexp_list_i_i_i_i_i_i_i_i_i_o_o_o_o i2 theta
                             phi gamma delta pexp_list tau_pat t_exp xp)
                           (fun (pexp_lista, (i3, (wt2b, ok2))) ->
                             Predicate.single
                               (pexpa :: pexp_lista,
                                 (i3, (wt1f :: wt2b,
TypingDeclFailRulesVP.plus ok1 ok2)))))))))
and check_e_i_i_i_i_i_i_i_o_o_o_o
  xa xb xc xd xe xf xg =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
                                    _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
              Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (delta, (SyntaxPED.Ep_return (loc, ep), tau_2))))))
              -> Predicate.bind
                   (ContextsPiDelta.eq_o_i (Contexts.gamma_e gamma))
                   (fun aa ->
                     (match aa with None -> Predicate.bot_pred
                       | Some tau_1 ->
                         Predicate.bind
                           (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma
                             delta ep tau_1)
                           (fun (epa, (i2, (tr, ok))) ->
                             Predicate.single
                               (SyntaxPED.Ep_return
                                  (TypingUtils.upd_t loc tau_2, epa),
                                 (i2, (tr, ok))))))
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_var (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _)))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind
          (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
          (fun a ->
            (match a
              with (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
                                      _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _),
                                      _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _),
                                      _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
                Predicate.bot_pred
              | (i1, (theta,
                       (phi, (gamma,
                               (delta, (SyntaxPED.Ep_exit (loc, ep), tau))))))
                -> Predicate.bind
                     (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma delta ep
                       (SyntaxVCT.T_refined_type
                         (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                           SyntaxVCT.C_true)))
                     (fun (epa, (i2, (tr, ok))) ->
                       Predicate.single
                         (SyntaxPED.Ep_exit (TypingUtils.upd_t loc tau, epa),
                           (i2, (tr, ok))))
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_var (_, _, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _)))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind
            (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                  Predicate.bot_pred
                | (i1, (theta,
                         (phi, (gamma,
                                 (delta,
                                   (SyntaxPED.Ep_if (loc, ep, ep1, ep2),
                                     SyntaxVCT.T_refined_type (zp, bp, cp)))))))
                  -> Predicate.bind
                       (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma
                         delta ep)
                       (fun (SyntaxVCT.T_refined_type (zp3, b, cp1),
                              (vp, (klist, (epa, (i2, (wt1, ok1))))))
                         -> Predicate.bind
                              (ContextsPiDelta.eq_o_i
                                (TypingUtils.mk_fresh_i i2))
                              (fun (i3, xp3) ->
                                Predicate.bind
                                  (TypingDeclFailRulesVP.subtype_i_i_i_i_i_o_o
                                    (TypingDeclFailRulesVP.get_loc loc) theta
                                    (TypingUtils.g_cons3 gamma [klist])
                                    (SyntaxVCT.T_refined_type (zp3, b, cp1))
                                    (SyntaxVCT.T_refined_type
                                      (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
SyntaxVCT.C_true)))
                                  (fun (wt2, ok2) ->
                                    Predicate.bind
                                      (check_e_i_i_i_i_i_i_i_o_o_o_o i3 theta
phi (TypingUtils.g_cons3 gamma
      [Lista.concat
         [(xp3, (SyntaxVCT.B_bool,
                  SyntaxVCT.C_eq
                    (SyntaxVCT.CE_val vp,
                      SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_true)))) ::
            klist]])
delta ep1
(SyntaxVCT.T_refined_type
  (zp, bp,
    SyntaxVCT.C_imp
      (SyntaxVCT.C_eq
         (SyntaxVCT.CE_val vp,
           SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_true)),
        cp))))
                                      (fun (ep1a, (i4, (wt3, ok3))) ->
Predicate.bind
  (check_e_i_i_i_i_i_i_i_o_o_o_o i4 theta phi
    (TypingUtils.g_cons3 gamma
      [Lista.concat
         [(xp3, (SyntaxVCT.B_bool,
                  SyntaxVCT.C_eq
                    (SyntaxVCT.CE_val vp,
                      SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_false)))) ::
            klist]])
    delta ep2
    (SyntaxVCT.T_refined_type
      (zp, bp,
        SyntaxVCT.C_imp
          (SyntaxVCT.C_eq
             (SyntaxVCT.CE_val vp,
               SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_false)),
            cp))))
  (fun (ep2a, (i5, (tr4, ok4))) ->
    Predicate.single
      (SyntaxPED.Ep_if
         (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)), epa,
           ep1a, ep2a),
        (i5, (CheckIf (wt1, wt2, wt3, tr4),
               TypingDeclFailRulesVP.plus (TypingDeclFailRulesVP.plus ok1 ok2)
                 (TypingDeclFailRulesVP.plus ok3 ok4)))))))))
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
_))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _),
_))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _),
_))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_var (_, _, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                  -> Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind
              (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (i1, (theta,
                           (phi, (gamma,
                                   (delta,
                                     (SyntaxPED.Ep_let
(loc, SyntaxPED.LBp_val (loca, patp, ep1), ep2),
                                       tau))))))
                    -> Predicate.bind
                         (infer_letbind_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma
                           delta (SyntaxPED.LBp_val (loca, patp, ep1)))
                         (fun (klist, (lp, (i2, (_, ok1)))) ->
                           Predicate.bind
                             (check_e_i_i_i_i_i_i_i_o_o_o_o i2 theta phi
                               (TypingUtils.g_cons3 gamma [klist]) delta ep2
                               tau)
                             (fun (ep2a, (i3, (wt2a, ok2))) ->
                               Predicate.single
                                 (SyntaxPED.Ep_let
                                    (TypingUtils.upd_t loc tau, lp, ep2a),
                                   (i3, (wt2a,
  TypingDeclFailRulesVP.plus ok1 ok2)))))
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_var (_, _, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                    -> Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind
                (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_bop (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_loop (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_record_update (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_field_access (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (i1, (theta,
                             (phi, (gamma,
                                     (delta,
                                       (SyntaxPED.Ep_case
  (loc, ep, patp_ep_list),
 t_exp))))))
                      -> Predicate.bind
                           (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma
                             delta ep)
                           (fun (tau, (xp, (klist1, (epa, (i2, (wt1, ok1))))))
                             -> Predicate.bind
                                  (check_pexp_list_i_i_i_i_i_i_i_i_i_o_o_o_o i2
                                    theta phi
                                    (TypingUtils.g_cons3 gamma [klist1]) delta
                                    patp_ep_list tau t_exp xp)
                                  (fun (patp_ep_lista, (i3, (trs, ok2))) ->
                                    Predicate.single
                                      (SyntaxPED.Ep_case
 (TypingUtils.upd_t loc t_exp, epa, patp_ep_lista),
(i3, (CheckCase (wt1, trs), TypingDeclFailRulesVP.plus ok1 ok2)))))
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_assert (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_var (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_assign (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_constraint (_, _), _))))))
                      -> Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_,
 (_, (SyntaxPED.Ep_block (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_proj (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_cast (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_if (_, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_cons (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_record_update (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_field_access (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_case (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_assert (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (phi, (gamma,
                                       (delta,
 (SyntaxPED.Ep_var (loc, lexp, ep1, ep2),
   SyntaxVCT.T_refined_type (zp, bp, cp)))))))
                        -> Predicate.bind
                             (check_lexp_i_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta
                               phi gamma delta lexp ep1)
                             (fun (deltaa,
                                    (_, (lexpa, (ep1a, (i2, (wt1b, ok1))))))
                               -> Predicate.bind
                                    (check_e_i_i_i_i_i_i_i_o_o_o_o i2 theta phi
                                      gamma deltaa ep2
                                      (SyntaxVCT.T_refined_type (zp, bp, cp)))
                                    (fun (ep2a, (i3, (wt2a, ok2))) ->
                                      Predicate.single
(SyntaxPED.Ep_var
   (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)), lexpa, ep1a,
     ep2a),
  (i3, (CheckVar (wt1b, wt2a), TypingDeclFailRulesVP.plus ok1 ok2)))))
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_assign (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_constraint (_, _), _))))))
                        -> Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind
                    (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (_,
   (_, (SyntaxPED.Ep_block (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_app (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_tuple (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_concat (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_record (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_case (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_let (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_return (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_throw (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_try (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_var (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (i1, (theta,
                                 (phi, (gamma,
 (delta,
   (SyntaxPED.Ep_assign (loc, lexpp, ep1),
     SyntaxVCT.T_refined_type (zp, bp, cp)))))))
                          -> Predicate.bind
                               (check_lexp_i_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta
                                 phi gamma delta lexpp ep1)
                               (fun (_, (_, (lexp, (ep1a, (i2, (wt1b, ok1))))))
                                 -> Predicate.single
                                      (SyntaxPED.Ep_assign
 (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)), lexp, ep1a),
(i2, (CheckAssign wt1b, ok1))))
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_constraint (_, _), _))))))
                          -> Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind
                      (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                      (fun a ->
                        (match a
                          with (_, (_, (_,
 (_, (_, (SyntaxPED.Ep_block (_, []), _))))))
                            -> Predicate.bot_pred
                          | (i1, (theta,
                                   (phi, (gamma,
   (delta, (SyntaxPED.Ep_block (loc, [ep]), tau))))))
                            -> Predicate.bind
                                 (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi
                                   gamma delta ep tau)
                                 (fun (epa, (i2, (tr, ok))) ->
                                   Predicate.single
                                     (SyntaxPED.Ep_block
(TypingUtils.upd_t loc tau, [epa]),
                                       (i2, (tr, ok))))
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_block (_, _ :: _ :: _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_val (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_tuple (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_vec (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_concat (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_list (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_record (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_case (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_exit (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_return (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_ref (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_throw (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_var (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_assign (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                            -> Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind
                        (Predicate.single
                          (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                        (fun a ->
                          (match a
                            with (_, (_, (_,
   (_, (_, (SyntaxPED.Ep_block (_, []), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_block (_, [_]), _))))))
                              -> Predicate.bot_pred
                            | (i1, (theta,
                                     (phi, (gamma,
     (delta, (SyntaxPED.Ep_block (loc, ep :: epa :: ep_list), tau))))))
                              -> Predicate.bind
                                   (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi
                                     gamma delta ep
                                     (SyntaxVCT.T_refined_type
                                       (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
 SyntaxVCT.C_true)))
                                   (fun (epb, (i2, (wt1c, ok1))) ->
                                     Predicate.bind
                                       (check_e_i_i_i_i_i_i_i_o_o_o_o i2 theta
 phi gamma delta (SyntaxPED.Ep_block (loc, epa :: ep_list)) tau)
                                       (fun aa ->
 (match aa
   with (SyntaxPED.Ep_block (_, ep_lista), (i3, (_, ok2))) ->
     Predicate.single
       (SyntaxPED.Ep_block (TypingUtils.upd_t loc tau, epb :: ep_lista),
         (i3, (wt1c, TypingDeclFailRulesVP.plus ok1 ok2)))
   | (SyntaxPED.Ep_val (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_mvar (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_bop (_, _, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_uop (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_proj (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_cast (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_app (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_tuple (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_if (_, _, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_loop (_, _, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_vec (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_concat (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_list (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_cons (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_record (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_record_update (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_field_access (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_case (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_let (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_sizeof (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_exit (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_return (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_ref (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_throw (_, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_try (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_assert (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_var (_, _, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_assign (_, _, _), _) -> Predicate.bot_pred
   | (SyntaxPED.Ep_constraint (_, _), _) -> Predicate.bot_pred)))
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_val (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_tuple (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_vec (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_concat (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_list (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_record (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_case (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_exit (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_return (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_ref (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_throw (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_var (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_assign (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                              -> Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind
                          (Predicate.single
                            (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                          (fun a ->
                            (match a
                              with (_, (_,
 (_, (_, (_, (SyntaxPED.Ep_block (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_val (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_tuple (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_vec (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_concat (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_list (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type (SyntaxVCT.VNamed _, _, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_var _, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_tid _, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_int, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_bool, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_bit, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_unit, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_real, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_vec (_, _), _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_list _, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_tuple _, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_union (_, _), _)))))))
                                -> Predicate.bot_pred
                              | (i1, (theta,
                                       (phi,
 (gamma,
   (delta,
     (SyntaxPED.Ep_record (loc, field_e_list),
       SyntaxVCT.T_refined_type
         (SyntaxVCT.VIndex, SyntaxVCT.B_record fb_list, c)))))))
                                -> Predicate.bind
                                     (check_e_list_i_i_i_i_i_i_i_o_o_o_o_o i1
                                       theta phi gamma delta
                                       (Lista.map Product_Type.snd field_e_list)
                                       (Lista.map
 (fun (_, b) ->
   SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, b, SyntaxVCT.C_true))
 fb_list))
                                     (fun (_, (ep_list, (i2, (wt1d, ok1)))) ->
                                       Predicate.single
 (SyntaxPED.Ep_record
    (TypingUtils.upd_t loc
       (SyntaxVCT.T_refined_type
         (SyntaxVCT.VIndex, SyntaxVCT.B_record fb_list, c)),
      Lista.zip (Lista.map Product_Type.fst field_e_list) ep_list),
   (i2, (CheckRecord wt1d, ok1))))
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_undef, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_reg _, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_string, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_exception, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record (_, _),
            SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_finite_set _, _)))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_case (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_exit (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_return (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_ref (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_throw (_, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_var (_, _, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_assign (_, _, _), _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                                -> Predicate.bot_pred)))
                        (Predicate.bind
                          (Predicate.single
                            (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                          (fun (i1, (theta,
                                      (phi, (gamma, (delta, (ep, tau_2))))))
                            -> Predicate.bind
                                 (ContextsPiDelta.eq_o_i
                                   (Debug.trace "check_e_subtypeI"))
                                 (fun _ ->
                                   Predicate.bind
                                     (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta
                                       phi gamma delta ep)
                                     (fun (tau_1,
    (_, (klist, (epa, (i2, (wt1, ok1))))))
                                       -> Predicate.bind
    (TypingDeclFailRulesVP.subtype_i_i_i_i_i_o_o
      (TypingDeclFailRulesVP.get_loc (SyntaxPED.annot_e ep)) theta
      (TypingUtils.g_cons3 gamma [klist]) tau_1 tau_2)
    (fun (wt2, ok2) ->
      Predicate.single
        (epa, (i2, (CheckSubtype (wt1, wt2),
                     TypingDeclFailRulesVP.plus ok1 ok2)))))))))))))))))
and check_e_list_i_i_i_i_i_i_i_o_o_o_o_o
  xa xb xc xd xe xf xg =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a
            with (i, (_, (_, (gamma, (_, ([], [])))))) ->
              Predicate.single
                (gamma, ([], (i, ([], TypingDeclFailRulesVP.OK))))
            | (_, (_, (_, (_, (_, ([], _ :: _)))))) -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (_ :: _, _)))))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, ([], _)))))) -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (_ :: _, [])))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma, (delta, (ep :: ep_list, tau :: tp_list))))))
              -> Predicate.bind
                   (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma delta ep
                     tau)
                   (fun (epa, (i2, (wt1c, ok1))) ->
                     Predicate.bind
                       (check_e_list_i_i_i_i_i_i_i_o_o_o_o_o i2 theta phi gamma
                         delta ep_list tp_list)
                       (fun (gammaa, (ep_lista, (i3, (wt2c, ok2)))) ->
                         Predicate.single
                           (gammaa,
                             (epa :: ep_lista,
                               (i3, (wt1c :: wt2c,
                                      TypingDeclFailRulesVP.plus ok1
ok2)))))))))
and infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
              Predicate.bot_pred
            | (i1, (theta, (_, (gamma, (_, SyntaxPED.Ep_val (loc, vp)))))) ->
              Predicate.bind
                (TypingDeclFailRulesVP.infer_v_i_i_i_o_o_i theta gamma vp
                  TypingDeclFailRulesVP.OK)
                (fun (SyntaxVCT.T_refined_type (zp, bp, cp), trb) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type (zp, bp, cp),
                      (vp, ([], (SyntaxPED.Ep_val
                                   (TypingUtils.upd_t loc
                                      (SyntaxVCT.T_refined_type (zp, bp, cp)),
                                     vp),
                                  (i1, (InferVal trb,
 TypingDeclFailRulesVP.OK)))))))
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
          (fun a ->
            (match a
              with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                Predicate.bot_pred
              | (i1, (theta, (_, (_, (_, SyntaxPED.Ep_ref (loc, idd)))))) ->
                Predicate.bind
                  (ContextsPiDelta.eq_o_i
                    (ContextsPiDelta.lookup_register theta
                      (SyntaxVCT.VNamed idd)))
                  (fun aa ->
                    (match aa with None -> Predicate.bot_pred
                      | Some t ->
                        Predicate.bind
                          (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1))
                          (fun (i2, xpa) ->
                            Predicate.single
                              (SyntaxVCT.T_refined_type
                                 (SyntaxVCT.VIndex, SyntaxVCT.B_reg t,
                                   SyntaxVCT.C_true),
                                (SyntaxVCT.V_var xpa,
                                  ([(xpa, (SyntaxVCT.B_reg t,
    SyntaxVCT.C_true))],
                                    (SyntaxPED.Ep_ref
                                       (TypingUtils.upd_t loc
  (SyntaxVCT.T_refined_type
    (SyntaxVCT.VIndex, SyntaxVCT.B_reg t, SyntaxVCT.C_true)),
 idd),
                                      (i2,
(NullTr, TypingDeclFailRulesVP.OK)))))))))
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                  Predicate.bot_pred
                | (i1, (theta,
                         (phi, (gamma,
                                 (delta, SyntaxPED.Ep_cast (loc, t1, ep))))))
                  -> Predicate.bind
                       (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma
                         delta ep)
                       (fun (t2, (vp, (klist, (epa, (i2, (wt1, ok1)))))) ->
                         Predicate.bind
                           (TypingDeclFailRulesVP.subtype_i_i_i_i_i_o_o
                             (TypingDeclFailRulesVP.get_loc loc) theta
                             (TypingUtils.g_cons3 gamma [klist]) t2 t1)
                           (fun (_, ok2) ->
                             Predicate.single
                               (t2, (vp, (klist,
   (SyntaxPED.Ep_cast (TypingUtils.upd_t loc t2, t1, epa),
     (i2, (wt1, TypingDeclFailRulesVP.plus ok1 ok2))))))))
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_for
(_, _, _, _, _, _, _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                    Predicate.bot_pred
                  | (i1, (_, (_, (_, (delta, SyntaxPED.Ep_mvar (loc, up)))))) ->
                    Predicate.bind
                      (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1))
                      (fun (i2, xpa) ->
                        Predicate.bind
                          (ContextsPiDelta.eq_o_i
                            (ContextsPiDelta.lookup_mvar delta up))
                          (fun aa ->
                            (match aa with None -> Predicate.bot_pred
                              | Some (SyntaxVCT.T_refined_type (zp, bp, cp)) ->
                                Predicate.single
                                  (SyntaxVCT.T_refined_type (zp, bp, cp),
                                    (SyntaxVCT.V_var xpa,
                                      ([(xpa,
  (bp, Subst.subst_cp (SyntaxVCT.V_var xpa) zp cp))],
(SyntaxPED.Ep_mvar
   (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)), up),
  (i2, (NullTr, TypingDeclFailRulesVP.OK)))))))))
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_for
  (_, _, _, _, _, _, _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update
  (_, _, _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind
                (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
SyntaxPED.Ep_record_update (_, _, _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
SyntaxPED.Ep_field_access (_, _, _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (i1, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (loc, cep))))))
                      -> Predicate.bind
                           (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1))
                           (fun (i2, xpa) ->
                             Predicate.single
                               (SyntaxVCT.T_refined_type
                                  (SyntaxVCT.VIndex, SyntaxVCT.B_int,
                                    SyntaxVCT.C_eq
                                      (SyntaxVCT.CE_val
 (SyntaxVCT.V_var SyntaxVCT.VIndex),
cep)),
                                 (SyntaxVCT.V_var xpa,
                                   ([(xpa, (SyntaxVCT.B_int,
     SyntaxVCT.C_eq (SyntaxVCT.CE_val (SyntaxVCT.V_var xpa), cep)))],
                                     (SyntaxPED.Ep_sizeof
(TypingUtils.upd_t loc
   (SyntaxVCT.T_refined_type
     (SyntaxVCT.VIndex, SyntaxVCT.B_int,
       SyntaxVCT.C_eq
         (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex), cep))),
  cep),
                                       (i2,
 (NullTr, TypingDeclFailRulesVP.OK)))))))
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_record_update (_, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_field_access (_, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _))))))
                        -> Predicate.bot_pred
                      | (i1, (_, (_, (_, (_,
   SyntaxPED.Ep_constraint (loc, cp))))))
                        -> Predicate.bind
                             (ContextsPiDelta.eq_o_i
                               (TypingUtils.mk_fresh_i i1))
                             (fun (i2, xpa) ->
                               Predicate.single
                                 (SyntaxVCT.T_refined_type
                                    (SyntaxVCT.VIndex, SyntaxVCT.B_bool, cp),
                                   (SyntaxVCT.V_var xpa,
                                     ([(xpa, (SyntaxVCT.B_bool, cp))],
                                       (SyntaxPED.Ep_constraint
  (TypingUtils.upd_t loc
     (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_bool, cp)),
    cp),
 (i2, (NullTr, TypingDeclFailRulesVP.OK))))))))))
                (Predicate.sup_pred
                  (Predicate.bind
                    (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                          -> Predicate.bot_pred
                        | (i1, (theta,
                                 (phi, (gamma,
 (delta, SyntaxPED.Ep_app (loc, fp, ep))))))
                          -> Predicate.bind
                               (ContextsPiDelta.eq_o_i
                                 (TypingUtils.lookup_fun_type theta phi fp))
                               (fun aa ->
                                 (match aa with None -> Predicate.bot_pred
                                   | Some ap_list ->
                                     Predicate.bind
                                       (ContextsPiDelta.eq_o_i
 (Debug.trace
   ("infer_e_appI |ap_list|=" ^
     Stringa.implode
       (Utils.string_of_int (Arith.int_of_nat (Lista.size_list ap_list))))))
                                       (fun _ ->
 Predicate.bind
   (infer_app_i_i_i_i_i_i_i_i_o_o_o_o_o_o_o_o_o i1
     (TypingDeclFailRulesVP.get_loc loc) theta phi gamma delta ap_list ep)
   (fun (tau_1, (vp1, (klist, (fpa, (_, (epa, (i2, (trc, ok)))))))) ->
     Predicate.single
       (tau_1,
         (vp1, (klist,
                 (SyntaxPED.Ep_app (TypingUtils.upd_t loc tau_1, fpa, epa),
                   (i2, (trc, ok))))))))))
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_loop (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_record_update (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_field_access (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_constraint (_, _))))))
                          -> Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind
                      (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                      (fun a ->
                        (match a
                          with (_, (_, (_,
 (_, (_, SyntaxPED.Ep_block (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                            -> Predicate.bot_pred
                          | (i, (theta,
                                  (phi, (_,
  (_, SyntaxPED.Ep_app (loc, fp, _))))))
                            -> Predicate.bind
                                 (ContextsPiDelta.eq_i_i
                                   (Option.equal_option
                                     (Lista.equal_list
                                       (Product_Type.equal_prod
 SyntaxVCT.equal_xp SyntaxVCT.equal_ap)))
                                   None
                                   (TypingUtils.lookup_fun_type theta phi fp))
                                 (fun () ->
                                   Predicate.single
                                     (SyntaxVCT.T_refined_type
(SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
                                       (SyntaxVCT.V_var SyntaxVCT.VIndex,
 ([], (SyntaxPED.Ep_app
         (TypingUtils.upd_t loc
            (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false)),
           fp, SyntaxPED.Ep_val
                 (TypingUtils.upd_t loc
                    (SyntaxVCT.T_refined_type
                      (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false)),
                   SyntaxVCT.V_lit SyntaxVCT.L_unit)),
        (i, (NullTr,
              TypingDeclFailRulesVP.Error
                (TypingDeclFailRulesVP.CheckFail
                  ("unknown function: " ^ TypingDeclFailRulesVP.s_of fp,
                    TypingDeclFailRulesVP.get_loc loc)))))))))
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_if (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_record_update (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_field_access (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_assert (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_var (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_assign (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_constraint (_, _))))))
                            -> Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind
                        (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                        (fun a ->
                          (match a
                            with (_, (_, (_,
   (_, (_, SyntaxPED.Ep_block (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_app (_, _, _))))))
                              -> Predicate.bot_pred
                            | (i1, (theta,
                                     (phi, (gamma,
     (delta, SyntaxPED.Ep_tuple (loc, ep_list))))))
                              -> Predicate.bind
                                   (ContextsPiDelta.eq_o_i
                                     (TypingUtils.mk_fresh_i i1))
                                   (fun (i2, xpa) ->
                                     Predicate.bind
                                       (infer_e_list_i_i_i_i_i_i_o_o_o_o_o_o_o
 i2 theta phi gamma delta ep_list)
                                       (fun aa ->
 (match aa
   with (tp_list,
          (xp_lista,
            (klist, (ep_lista, (i3, (trd, TypingDeclFailRulesVP.OK))))))
     -> Predicate.bind
          (ContextsPiDelta.eq_o_i (Lista.map UnifyType.b_of tp_list))
          (fun x ->
            Predicate.single
              (SyntaxVCT.T_refined_type
                 (SyntaxVCT.VIndex, SyntaxVCT.B_tuple x,
                   SyntaxVCT.C_eq
                     (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                       SyntaxVCT.CE_val (SyntaxVCT.V_tuple xp_lista))),
                (SyntaxVCT.V_var xpa,
                  ((xpa, (SyntaxVCT.B_tuple x,
                           SyntaxVCT.C_eq
                             (SyntaxVCT.CE_val (SyntaxVCT.V_var xpa),
                               SyntaxVCT.CE_val
                                 (SyntaxVCT.V_tuple xp_lista)))) ::
                     klist,
                    (SyntaxPED.Ep_tuple
                       (TypingUtils.upd_t loc
                          (SyntaxVCT.T_refined_type
                            (SyntaxVCT.VIndex, SyntaxVCT.B_tuple x,
                              SyntaxVCT.C_eq
                                (SyntaxVCT.CE_val
                                   (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                  SyntaxVCT.CE_val
                                    (SyntaxVCT.V_tuple xp_lista)))),
                         ep_lista),
                      (i3, (InferTuple trd, TypingDeclFailRulesVP.OK)))))))
   | (_, (_, (_, (_, (_, (_, TypingDeclFailRulesVP.Error _)))))) ->
     Predicate.bot_pred)))
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_concat (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_record (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_case (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_let (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_return (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_try (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_var (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_assign (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_constraint (_, _))))))
                              -> Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind
                          (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                          (fun a ->
                            (match a
                              with (_, (_,
 (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                -> Predicate.bot_pred
                              | (i1, (theta,
                                       (phi,
 (gamma, (delta, SyntaxPED.Ep_concat (loc, ep_list))))))
                                -> Predicate.bind
                                     (infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o_o_o
                                       i1 theta phi gamma delta ep_list)
                                     (fun (_,
    (order, (bp, (_, (xp_lista, (klist_list, (ep_lista, (i2, (trsa, ok)))))))))
                                       -> Predicate.bind
    (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i2))
    (fun (i3, xpa) ->
      Predicate.bind
        (ContextsPiDelta.eq_o_i
          (SyntaxVCT.T_refined_type
            (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bp),
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_uop
                   (SyntaxVCT.Len,
                     SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                  SyntaxVCT.CE_many_plus
                    (Lista.map (fun aa -> SyntaxVCT.CE_val aa) xp_lista)))))
        (fun x ->
          Predicate.single
            (x, (SyntaxVCT.V_var xpa,
                  ((xpa, (SyntaxVCT.B_vec (order, bp),
                           SyntaxVCT.C_eq
                             (SyntaxVCT.CE_uop
                                (SyntaxVCT.Len,
                                  SyntaxVCT.CE_val (SyntaxVCT.V_var xpa)),
                               SyntaxVCT.CE_many_plus
                                 (Lista.map (fun aa -> SyntaxVCT.CE_val aa)
                                   xp_lista)))) ::
                     TypingUtils.k_append klist_list,
                    (SyntaxPED.Ep_concat (TypingUtils.upd_t loc x, ep_lista),
                      (i3, (InferVecConcat trsa, ok)))))))))
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_list (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_record (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_return (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_var (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_assign (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                -> Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind
                            (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                            (fun a ->
                              (match a
                                with (_, (_,
   (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (i1, (theta,
 (phi, (gamma, (delta, SyntaxPED.Ep_field_access (loc, ep, field))))))
                                  -> Predicate.bind
                                       (ContextsPiDelta.eq_o_i
 (ContextsPiDelta.lookup_field_record_type theta field))
                                       (fun aa ->
 (match aa with None -> Predicate.bot_pred
   | Some (bp, tau_1) ->
     Predicate.bind
       (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta ep)
       (fun (tau_2, (vp1, (klist, (epa, (i2, (wt1, ok1)))))) ->
         Predicate.bind (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i2))
           (fun (i3, xp2) ->
             Predicate.bind
               (ContextsPiDelta.eq_o_i
                 (SyntaxVCT.T_refined_type
                   (SyntaxVCT.VIndex, bp,
                     SyntaxVCT.C_eq
                       (SyntaxVCT.CE_field_access (vp1, field),
                         SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)))))
               (fun x ->
                 Predicate.bind
                   (TypingDeclFailRulesVP.subtype_i_i_i_i_i_o_o
                     (TypingDeclFailRulesVP.get_loc loc) theta
                     (TypingUtils.g_cons3 gamma [klist]) tau_2 tau_1)
                   (fun (_, ok2) ->
                     Predicate.single
                       (x, (SyntaxVCT.V_var xp2,
                             ((xp2, (bp, SyntaxVCT.C_eq
   (SyntaxVCT.CE_field_access (vp1, field),
     SyntaxVCT.CE_val (SyntaxVCT.V_var xp2)))) ::
                                klist,
                               (SyntaxPED.Ep_field_access
                                  (TypingUtils.upd_t loc x, epa, field),
                                 (i3, (wt1,
TypingDeclFailRulesVP.plus ok1 ok2))))))))))))
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_var (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_assign (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                  -> Predicate.bot_pred)))
                          (Predicate.sup_pred
                            (Predicate.bind
                              (Predicate.single
                                (xa, (xb, (xc, (xd, (xe, xf))))))
                              (fun a ->
                                (match a
                                  with (_,
 (_, (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (i1, (theta,
   (phi, (gamma, (delta, SyntaxPED.Ep_loop (loc, loop, ep1, ep2))))))
                                    -> Predicate.bind
 (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1))
 (fun (i2, xpa) ->
   Predicate.bind
     (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i2 theta phi gamma delta ep1)
     (fun aa ->
       (match aa
         with (SyntaxVCT.T_refined_type (SyntaxVCT.VNamed _, _, _), _) ->
           Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_var _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_tid _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_int, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_bool, _),
             (_, (klist1, (ep1a, (i3, (wt1, ok1))))))
           -> Predicate.bind
                (check_e_i_i_i_i_i_i_i_o_o_o_o i3 theta phi
                  (TypingUtils.g_cons3 gamma [klist1]) delta ep2
                  (SyntaxVCT.T_refined_type
                    (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_true)))
                (fun (ep2a, (i4, (wt2a, ok2))) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_true),
                      (SyntaxVCT.V_var xpa,
                        ([(xpa, (SyntaxVCT.B_unit, SyntaxVCT.C_true))],
                          (SyntaxPED.Ep_loop
                             (TypingUtils.upd_t loc
                                (SyntaxVCT.T_refined_type
                                  (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                                    SyntaxVCT.C_true)),
                               loop, ep1a, ep2a),
                            (i4, (InferLoop (wt1, wt2a),
                                   TypingDeclFailRulesVP.plus ok1 ok2)))))))
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_bit, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_unit, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_real, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_vec (_, _), _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_list _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_tuple _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_union (_, _), _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_record _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_undef, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_reg _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_string, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_exception, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_finite_set _, _),
             _)
           -> Predicate.bot_pred)))
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_assign (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                    -> Predicate.bot_pred)))
                            (Predicate.sup_pred
                              (Predicate.bind
                                (Predicate.single
                                  (xa, (xb, (xc, (xd, (xe, xf))))))
                                (fun a ->
                                  (match a
                                    with (_,
   (_, (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                                      -> Predicate.bot_pred
                                    | (i1,
(theta,
  (phi, (gamma, (delta, SyntaxPED.Ep_record_update (loc, e, field_e_list))))))
                                      -> Predicate.bind
   (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta e)
   (fun (SyntaxVCT.T_refined_type (z, b, c),
          (_, (klist, (ep, (i2, (wt1, ok1))))))
     -> Predicate.bind
          (ContextsPiDelta.eq_o_i
            (ContextsPiDelta.lookup_types_for b
              (Lista.map Product_Type.fst field_e_list)))
          (fun aa ->
            (match aa with None -> Predicate.bot_pred
              | Some b_list ->
                Predicate.bind
                  (check_e_list_i_i_i_i_i_i_i_o_o_o_o_o i2 theta phi
                    (TypingUtils.g_cons3 gamma [klist]) delta
                    (Lista.map Product_Type.snd field_e_list)
                    (Lista.map
                      (fun ba ->
                        SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, ba, SyntaxVCT.C_true))
                      b_list))
                  (fun (_, (ep_list, (i3, (wt2c, ok2)))) ->
                    Predicate.bind
                      (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i3))
                      (fun (i4, x) ->
                        Predicate.single
                          (SyntaxVCT.T_refined_type (z, b, c),
                            (SyntaxVCT.V_var x,
                              ((x, (b, Subst.subst_cp (SyntaxVCT.V_var x) z
 c)) ::
                                 klist,
                                (SyntaxPED.Ep_record_update
                                   (TypingUtils.upd_t loc
                                      (SyntaxVCT.T_refined_type (z, b, c)),
                                     ep, Lista.zip
   (Lista.map Product_Type.fst field_e_list) ep_list),
                                  (i4, (InferRecordUpdate (wt1, wt2c),
 TypingDeclFailRulesVP.plus ok1 ok2)))))))))))
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                      -> Predicate.bot_pred)))
                              (Predicate.sup_pred
                                (Predicate.bind
                                  (Predicate.single
                                    (xa, (xb, (xc, (xd, (xe, xf))))))
                                  (fun a ->
                                    (match a
                                      with
(_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
Predicate.bot_pred
                                      |
(i1, (theta, (phi, (gamma, (delta, SyntaxPED.Ep_vec (loc, e_list)))))) ->
Predicate.bind
  (ContextsPiDelta.eq_o_i (Arith.integer_of_nat (Lista.size_list e_list)))
  (fun x ->
    Predicate.bind
      (ContextsPiDelta.eq_o_i (Contexts.single_base [SyntaxVCT.B_bit]))
      (fun aa ->
        (match aa with None -> Predicate.bot_pred
          | Some bp ->
            Predicate.bind
              (ContextsPiDelta.eq_o_i (ContextsPiDelta.theta_d theta))
              (fun ab ->
                (match ab with None -> Predicate.bot_pred
                  | Some order ->
                    Predicate.bind
                      (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i1))
                      (fun (i2, xpa) ->
                        Predicate.bind
                          (ContextsPiDelta.eq_o_i
                            (SyntaxVCT.T_refined_type
                              (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bp),
                                SyntaxVCT.C_eq
                                  (SyntaxVCT.CE_uop
                                     (SyntaxVCT.Len,
                                       SyntaxVCT.CE_val
 (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                                    SyntaxVCT.CE_val
                                      (SyntaxVCT.V_lit (SyntaxVCT.L_num x))))))
                          (fun xaa ->
                            Predicate.bind
                              (check_e_list_i_i_i_i_i_i_i_o_o_o_o_o i2 theta phi
                                gamma delta e_list
                                (Lista.map
                                  (fun _ ->
                                    SyntaxVCT.T_refined_type
                                      (SyntaxVCT.VIndex, bp, SyntaxVCT.C_true))
                                  e_list))
                              (fun (_, (e_lista, (i3, (_, ok)))) ->
                                Predicate.single
                                  (xaa, (SyntaxVCT.V_var xpa,
  ([(xpa, (SyntaxVCT.B_vec (order, bp),
            SyntaxVCT.C_eq
              (SyntaxVCT.CE_uop
                 (SyntaxVCT.Len, SyntaxVCT.CE_val (SyntaxVCT.V_var xpa)),
                SyntaxVCT.CE_val (SyntaxVCT.V_lit (SyntaxVCT.L_num x)))))],
    (SyntaxPED.Ep_vec (TypingUtils.upd_t loc xaa, e_lista),
      (i3, (NullTr, ok))))))))))))))
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) -> Predicate.bot_pred)))
                                (Predicate.sup_pred
                                  (Predicate.bind
                                    (Predicate.single
                                      (xa, (xb, (xc, (xd, (xe, xf))))))
                                    (fun a ->
                                      (match a
with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
| (i1, (theta, (phi, (gamma, (delta, SyntaxPED.Ep_throw (loc, ep)))))) ->
  Predicate.bind (ContextsPiDelta.eq_o_i "exception")
    (fun x ->
      Predicate.bind
        (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta ep)
        (fun aa ->
          (match aa
            with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_vec (_, _), _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_list _, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_union (idda, _), _),
                (_, (klist, (epa, (i2, (wt1, ok1))))))
              -> (if ((x : string) = idda)
                   then Predicate.bind
                          (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i2))
                          (fun (i3, xpa) ->
                            Predicate.single
                              (SyntaxVCT.T_refined_type
                                 (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                                   SyntaxVCT.C_true),
                                (SyntaxVCT.V_var xpa,
                                  ((xpa, (SyntaxVCT.B_unit,
   SyntaxVCT.C_true)) ::
                                     klist,
                                    (SyntaxPED.Ep_throw
                                       (TypingUtils.upd_t loc
  (SyntaxVCT.T_refined_type
    (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_true)),
 epa),
                                      (i3, (wt1, ok1)))))))
                   else Predicate.bot_pred)
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _), _) ->
              Predicate.bot_pred
            | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_finite_set _, _), _) ->
              Predicate.bot_pred)))
| (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
  Predicate.bot_pred)))
                                  (Predicate.sup_pred
                                    (Predicate.bind
                                      (Predicate.single
(xa, (xb, (xc, (xd, (xe, xf))))))
                                      (fun a ->
(match a
  with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
  | (i1, (_, (_, (_, (_, SyntaxPED.Ep_return (loc, _)))))) ->
    Predicate.single
      (SyntaxVCT.T_refined_type
         (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
        (SyntaxVCT.V_var SyntaxVCT.VIndex,
          ([], (ep_null,
                 (i1, (NullTr,
                        TypingDeclFailRulesVP.Error
                          (TypingDeclFailRulesVP.CheckFail
                            ("Not Implemented: return",
                              TypingDeclFailRulesVP.get_loc loc))))))))
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
    Predicate.bot_pred)))
                                    (Predicate.sup_pred
                                      (Predicate.bind
(Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
(fun a ->
  (match a
    with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
    | (i1, (_, (_, (_, (_, SyntaxPED.Ep_exit (loc, _)))))) ->
      Predicate.single
        (SyntaxVCT.T_refined_type
           (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
          (SyntaxVCT.V_var SyntaxVCT.VIndex,
            ([], (ep_null,
                   (i1, (NullTr,
                          TypingDeclFailRulesVP.Error
                            (TypingDeclFailRulesVP.CheckFail
                              ("Not Implemented: exit",
                                TypingDeclFailRulesVP.get_loc loc))))))))
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
      Predicate.bot_pred)))
                                      (Predicate.sup_pred
(Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
  (fun a ->
    (match a
      with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
      | (i1, (_, (_, (_, (_, SyntaxPED.Ep_try (loc, _, _)))))) ->
        Predicate.single
          (SyntaxVCT.T_refined_type
             (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
            (SyntaxVCT.V_var SyntaxVCT.VIndex,
              ([], (ep_null,
                     (i1, (NullTr,
                            TypingDeclFailRulesVP.Error
                              (TypingDeclFailRulesVP.CheckFail
                                ("Not Implemented: try",
                                  TypingDeclFailRulesVP.get_loc loc))))))))
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
        Predicate.bot_pred)))
(Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
  (fun a ->
    (match a
      with (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_var (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _)))))) ->
        Predicate.bot_pred
      | (i1, (_, (_, (_, (_, SyntaxPED.Ep_constraint (loc, _)))))) ->
        Predicate.single
          (SyntaxVCT.T_refined_type
             (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
            (SyntaxVCT.V_var SyntaxVCT.VIndex,
              ([], (ep_null,
                     (i1, (NullTr,
                            TypingDeclFailRulesVP.Error
                              (TypingDeclFailRulesVP.CheckFail
                                ("Not Implemented: constraint",
                                  TypingDeclFailRulesVP.get_loc
                                    loc))))))))))))))))))))))))))))
and infer_letbind_i_i_i_i_i_i_o_o_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun (i1, (theta,
                    (phi, (gamma, (delta, SyntaxPED.LBp_val (loc, patp, ep))))))
          -> Predicate.bind (Predicate.if_pred (is_not_ptyp patp))
               (fun () ->
                 Predicate.bind
                   (ContextsPiDelta.eq_o_i (Debug.trace "infer_letbind_inferI"))
                   (fun _ ->
                     Predicate.bind
                       (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma
                         delta ep)
                       (fun (tau, (xp1, (klist1, (epa, (i2, (wt1, ok1)))))) ->
                         Predicate.bind
                           (TypingDeclFailRulesVP.check_pat_i_i_i_i_i_i_o_o_o_o_o_o
                             i2 theta (TypingUtils.g_cons3 gamma [klist1]) patp
                             tau xp1)
                           (fun (klist2, (yp_list, (patpa, (i3, (wt2f, ok2)))))
                             -> Predicate.bind
                                  (Predicate.if_pred
                                    (Contexts.check_vars gamma yp_list))
                                  (fun () ->
                                    Predicate.single
                                      (Lista.concat [klist1; klist2],
(SyntaxPED.LBp_val (TypingUtils.upd_t loc tau, patpa, epa),
  (i3, (LetBindInf (wt1, wt2f), TypingDeclFailRulesVP.plus ok1 ok2)))))))))))
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                       (_, SyntaxPED.Pp_lit (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_wild _, _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_as_var (_, _, _), _))))))
              -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (_, SyntaxPED.LBp_val
                                   (loc, SyntaxPED.Pp_typ
   (loca, SyntaxVCT.T_refined_type (zp, bp, cp), patp),
                                     ep))))))
              -> Predicate.bind
                   (ContextsPiDelta.eq_o_i (Debug.trace "infer_letbind_checkI"))
                   (fun _ ->
                     Predicate.bind
                       (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma
                         ContextsPiDelta.emptyDEnv ep
                         (SyntaxVCT.T_refined_type (zp, bp, cp)))
                       (fun (epa, (i2, (wt1c, ok1))) ->
                         Predicate.bind
                           (ContextsPiDelta.eq_o_i (TypingUtils.mk_fresh_i i2))
                           (fun (i3, xpa) ->
                             Predicate.bind
                               (TypingDeclFailRulesVP.check_pat_i_i_i_i_i_i_o_o_o_o_o_o
                                 i3 theta
                                 (Contexts.add_var gamma
                                   (xpa, Contexts.GEPair
   (bp, SyntaxUtils.subst_x_cp cp zp (SyntaxVCT.V_var xpa))))
                                 patp (SyntaxVCT.T_refined_type (zp, bp, cp))
                                 (SyntaxVCT.V_var xpa))
                               (fun (klist,
                                      (xp_list, (patpa, (i4, (wt2f, ok2)))))
                                 -> Predicate.bind
                                      (Predicate.if_pred
(Contexts.check_vars gamma xp_list))
                                      (fun () ->
Predicate.single
  ((xpa, (bp, SyntaxUtils.subst_x_cp cp zp (SyntaxVCT.V_var xpa))) :: klist,
    (SyntaxPED.LBp_val
       (TypingUtils.upd_t loc (SyntaxVCT.T_refined_type (zp, bp, cp)),
         SyntaxPED.Pp_typ
           (TypingUtils.upd_t loca (SyntaxVCT.T_refined_type (zp, bp, cp)),
             SyntaxVCT.T_refined_type (zp, bp, cp), patpa),
         epa),
      (i4, (LetBindCheck (wt1c, wt2f),
             TypingDeclFailRulesVP.plus ok1 ok2)))))))))
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_id (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_as_typ (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_app (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_vector (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_vector_concat (_, _),
                                      _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_tup (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_list (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_cons (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_string_append (_, _),
                                      _))))))
              -> Predicate.bot_pred)))
and infer_e_list_i_i_i_i_i_i_o_o_o_o_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (i1, (_, (_, (_, (_, []))))) ->
              Predicate.single
                ([], ([], ([], ([], (i1, ([], TypingDeclFailRulesVP.OK))))))
            | (_, (_, (_, (_, (_, _ :: _))))) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
          (fun a ->
            (match a with (_, (_, (_, (_, (_, []))))) -> Predicate.bot_pred
              | (i1, (theta, (phi, (gamma, (delta, ep :: ep_list))))) ->
                Predicate.bind
                  (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta
                    ep)
                  (fun aa ->
                    (match aa
                      with (tau, (vp, (klist1,
(epa, (i2, (trc, TypingDeclFailRulesVP.OK))))))
                        -> Predicate.bind
                             (infer_e_list_i_i_i_i_i_i_o_o_o_o_o_o_o i2 theta
                               phi (TypingUtils.g_cons3 gamma [klist1]) delta
                               ep_list)
                             (fun ab ->
                               (match ab
                                 with (tp_list,
(vp_list, (klist2, (ep_lista, (i3, (trsa, TypingDeclFailRulesVP.OK))))))
                                   -> Predicate.single
(tau :: tp_list,
  (vp :: vp_list,
    (Lista.concat [klist1; klist2],
      (epa :: ep_lista, (i3, (trc :: trsa, TypingDeclFailRulesVP.OK))))))
                                 | (_, (_,
 (_, (_, (_, (_, TypingDeclFailRulesVP.Error _))))))
                                   -> Predicate.bot_pred))
                      | (_, (_, (_, (_, (_,
  (_, TypingDeclFailRulesVP.Error _))))))
                        -> Predicate.bot_pred)))))
        (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
          (fun a ->
            (match a with (_, (_, (_, (_, (_, []))))) -> Predicate.bot_pred
              | (i1, (theta, (phi, (gamma, (delta, ep :: _))))) ->
                Predicate.bind
                  (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta
                    ep)
                  (fun aa ->
                    (match aa
                      with (_, (_, (_, (_,
 (_, (_, TypingDeclFailRulesVP.OK))))))
                        -> Predicate.bot_pred
                      | (tau, (vp, (_, (epa,
 (i2, (trc, TypingDeclFailRulesVP.Error err))))))
                        -> Predicate.single
                             ([tau],
                               ([vp],
                                 (Lista.concat [],
                                   ([epa],
                                     (i2, ([trc],
    TypingDeclFailRulesVP.Error err))))))))))))
and infer_app_i_i_i_i_i_i_i_i_o_o_o_o_o_o_o_o_o
  xa xb xc xd xe xf xg xh =
    Predicate.bind
      (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, xh))))))))
      (fun (i1, (loca, (theta, (phi, (gamma, (delta, (ap_list, ep))))))) ->
        Predicate.bind
          (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta ep)
          (fun a ->
            (match a
              with (SyntaxVCT.T_refined_type (zp2, bp2, cp2),
                     (vp2, (klist,
                             (epa, (i2, (wt1, TypingDeclFailRulesVP.OK))))))
                -> Predicate.bind
                     (ContextsPiDelta.eq_o_i
                       (TypingDeclFailRulesVP.mk_fresh_lbl i2 "_app"))
                     (fun (i3, xp3) ->
                       Predicate.bind
                         (match_arg_i_i_i_i_i_i_i_o_o_o_o loca theta
                           (TypingUtils.g_cons3 gamma [klist]) zp2 bp2 cp2
                           ap_list)
                         (fun aa ->
                           (match aa
                             with ((_, SyntaxVCT.A_monotype _), _) ->
                               Predicate.bot_pred
                             | ((f, SyntaxVCT.A_function
                                      (xp1a, _, _,
SyntaxVCT.T_refined_type (zp3, bp3, cp3))),
                                 (bsub, (wt2, ok2)))
                               -> Predicate.single
                                    (SyntaxVCT.T_refined_type
                                       (zp3,
 TypingDeclFailRulesVP.tsubst_bp_many bp3 bsub,
 SyntaxUtils.subst_x_cp cp3 xp1a vp2),
                                      (SyntaxVCT.V_var xp3,
((xp3, (TypingDeclFailRulesVP.tsubst_bp_many bp3 bsub,
         SyntaxUtils.subst_x_cp (SyntaxUtils.subst_x_cp cp3 xp1a vp2) zp3
           (SyntaxVCT.V_var xp3))) ::
   klist,
  (f, (bsub,
        (epa, (i3, (InferApp (wt1, wt2),
                     TypingDeclFailRulesVP.plus TypingDeclFailRulesVP.OK
                       ok2)))))))))))
              | (SyntaxVCT.T_refined_type (_, _, _),
                  (_, (_, (_, (_, (_, TypingDeclFailRulesVP.Error _))))))
                -> Predicate.bot_pred)))
and infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, []))))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, (delta, [ep]))))) ->
              Predicate.bind
                (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta ep)
                (fun aa ->
                  (match aa
                    with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (zp, SyntaxVCT.B_vec (order, bp), cp),
                        (xp, (klist, (epa, (i2, (trc, ok))))))
                      -> Predicate.single
                           (zp, (order,
                                  (bp, ([cp],
 ([xp], ([klist], ([epa], (i2, ([trc], ok)))))))))
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_list _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_union (_, _), _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_finite_set _, _),
                        _)
                      -> Predicate.bot_pred))
            | (_, (_, (_, (_, (_, _ :: _ :: _))))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, []))))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, (delta, ep :: ep_list))))) ->
              Predicate.bind
                (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma delta ep)
                (fun aa ->
                  (match aa
                    with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (zp, SyntaxVCT.B_vec (order, bp), cp),
                        (xp, (klist, (epa, (i2, (wt1, ok1))))))
                      -> Predicate.bind
                           (infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o_o_o
                             i2 theta phi gamma delta ep_list)
                           (fun (zpa, (ordera,
(bpa, (cp_list, (xp_lista, (klist_list, (ep_lista, (i3, (wt2e, ok2)))))))))
                             -> (if SyntaxVCT.equal_bpa bp bpa &&
                                      (SyntaxVCT.equal_order order ordera &&
SyntaxVCT.equal_xpa zp zpa)
                                  then Predicate.single
 (zp, (order,
        (bp, (cp :: cp_list,
               (xp :: xp_lista,
                 (klist :: klist_list,
                   (epa :: ep_lista,
                     (i3, (wt1 :: wt2e,
                            TypingDeclFailRulesVP.plus ok1 ok2)))))))))
                                  else Predicate.bot_pred))
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_list _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_union (_, _), _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_finite_set _, _),
                        _)
                      -> Predicate.bot_pred)))))
and check_lexp_i_i_i_i_i_i_i_o_o_o_o_o_o_o
  xa xb xc xd xe xf xg =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a
            with (i1, (theta,
                        (phi, (gamma,
                                (delta,
                                  (SyntaxPED.LEXPp_mvar (loc, up), ep))))))
              -> Predicate.bind
                   (Predicate.if_pred (ContextsPiDelta.mvar_not_in_d delta up))
                   (fun () ->
                     Predicate.bind
                       (infer_e_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma
                         delta ep)
                       (fun (tau, (_, (klist, (epa, (i2, (trc, ok)))))) ->
                         Predicate.single
                           (ContextsPiDelta.add_mvar delta (up, tau),
                             (klist,
                               (SyntaxPED.LEXPp_mvar
                                  (TypingUtils.upd_t loc tau, up),
                                 (epa, (i2, (LExp_unbound trc, ok))))))))
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_reg (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_cast (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_deref _, _)))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind
          (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
          (fun a ->
            (match a
              with (i1, (theta,
                          (phi, (gamma,
                                  (delta,
                                    (SyntaxPED.LEXPp_mvar (loc, up), ep))))))
                -> Predicate.bind
                     (ContextsPiDelta.eq_o_i
                       (ContextsPiDelta.lookup_mvar delta up))
                     (fun aa ->
                       (match aa with None -> Predicate.bot_pred
                         | Some tau ->
                           Predicate.bind
                             (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma
                               delta ep tau)
                             (fun (epa, (i2, (tr, ok))) ->
                               Predicate.single
                                 (delta,
                                   (TypingUtils.k_list [],
                                     (SyntaxPED.LEXPp_mvar
(TypingUtils.upd_t loc tau, up),
                                       (epa, (i2, (LExp_bound tr, ok)))))))))
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_reg (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_cast (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_deref _, _)))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind
            (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_reg (_, _), _)))))) ->
                  Predicate.bot_pred
                | (i1, (theta,
                         (phi, (gamma,
                                 (delta,
                                   (SyntaxPED.LEXPp_cast (loc, tau, up),
                                     ep))))))
                  -> Predicate.bind
                       (Predicate.if_pred
                         (ContextsPiDelta.mvar_not_in_d delta up))
                       (fun () ->
                         Predicate.bind
                           (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma
                             delta ep tau)
                           (fun (epa, (i2, (tr, ok))) ->
                             Predicate.single
                               (ContextsPiDelta.add_mvar delta (up, tau),
                                 (TypingUtils.k_list [],
                                   (SyntaxPED.LEXPp_cast
                                      (TypingUtils.upd_t loc tau, tau, up),
                                     (epa, (i2, (LExp_bound tr, ok))))))))
                | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _), _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_deref _, _)))))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind
              (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_reg (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (i1, (theta,
                           (phi, (gamma,
                                   (delta,
                                     (SyntaxPED.LEXPp_cast (loc, tau_2, up),
                                       ep))))))
                    -> Predicate.bind
                         (ContextsPiDelta.eq_o_i
                           (ContextsPiDelta.lookup_mvar delta up))
                         (fun aa ->
                           (match aa with None -> Predicate.bot_pred
                             | Some tau_1 ->
                               Predicate.bind
                                 (TypingDeclFailRulesVP.subtype_i_i_i_i_i_o_o
                                   (TypingDeclFailRulesVP.get_loc loc) theta
                                   gamma tau_2 tau_1)
                                 (fun (_, ok1) ->
                                   Predicate.bind
                                     (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi
                                       gamma delta ep tau_2)
                                     (fun (epa, (i2, (wt2a, ok2))) ->
                                       Predicate.single
 (ContextsPiDelta.update_mvar delta (up, tau_2),
   (TypingUtils.k_list [],
     (SyntaxPED.LEXPp_cast (TypingUtils.upd_t loc tau_2, tau_2, up),
       (epa, (i2, (LExp_bound wt2a, TypingDeclFailRulesVP.plus ok1 ok2))))))))))
                  | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_deref _, _)))))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind
                (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, (_,
   (SyntaxPED.LEXPp_mvar (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_reg (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_cast (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _))))))
                      -> Predicate.bot_pred
                    | (i1, (theta,
                             (phi, (gamma,
                                     (delta,
                                       (SyntaxPED.LEXPp_field
  (loc, SyntaxPED.LEXPp_mvar (loca, up), fid),
 ep))))))
                      -> Predicate.bind
                           (ContextsPiDelta.eq_o_i
                             (ContextsPiDelta.lookup_field_and_record_type theta
                               fid))
                           (fun aa ->
                             (match aa with None -> Predicate.bot_pred
                               | Some (tau_1, tau_2) ->
                                 Predicate.bind
                                   (ContextsPiDelta.eq_o_i
                                     (ContextsPiDelta.lookup_mvar delta up))
                                   (fun ab ->
                                     (match ab with None -> Predicate.bot_pred
                                       | Some tau ->
 Predicate.bind
   (TypingDeclFailRulesVP.subtype_i_i_i_i_i_o_o
     (TypingDeclFailRulesVP.get_loc loc) theta gamma tau tau_2)
   (fun (_, ok1) ->
     Predicate.bind
       (check_e_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma delta ep tau_1)
       (fun (epa, (i2, (wt2a, ok2))) ->
         Predicate.single
           (delta,
             (TypingUtils.k_list [],
               (SyntaxPED.LEXPp_field
                  (TypingUtils.upd_t loc tau_1,
                    SyntaxPED.LEXPp_mvar (TypingUtils.upd_t loca tau, up), fid),
                 (epa, (i2, (LExp_bound wt2a,
                              TypingDeclFailRulesVP.plus ok1 ok2))))))))))))
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_reg (_, _), _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_cast (_, _, _), _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_tup (_, _), _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_field (_, _, _), _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_deref _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_deref _, _)))))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_,
 (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_reg (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_cast (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, []), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_block (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_val (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_mvar (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_bop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_uop (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_proj (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_cast (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_app (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_tuple (_, [])))))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (phi, (gamma,
                                       (delta,
 (SyntaxPED.LEXPp_tup (_, [lexpp]), SyntaxPED.Ep_tuple (_, [ep])))))))
                        -> Predicate.bind
                             (check_lexp_i_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta
                               phi gamma delta lexpp ep)
                             (fun (_, (klist, (lexppa, (epa, (i2, (tre, ok))))))
                               -> Predicate.single
                                    (delta,
                                      (klist,
(SyntaxPED.LEXPp_tup (SyntaxPED.annot_e epa, [lexppa]),
  (SyntaxPED.Ep_tuple (SyntaxPED.annot_e epa, [epa]), (i2, (tre, ok)))))))
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_tuple (_, _ :: _ :: _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_if (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_loop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_vec (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_concat (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_list (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_cons (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_record (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_record_update (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_field_access (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_case (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_let (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_sizeof (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_exit (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_return (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_ref (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_throw (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_try (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_assert (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_var (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_assign (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_constraint (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _ :: _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_field (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_deref _, _)))))) ->
                        Predicate.bot_pred)))
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_,
 (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_reg (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_cast (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, []), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_block (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_val (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_mvar (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_bop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_uop (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_proj (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_cast (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_app (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_tuple (_, [])))))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (phi, (gamma,
                                       (delta,
 (SyntaxPED.LEXPp_tup (loc, lexpp :: lexpp_list),
   SyntaxPED.Ep_tuple (loca, ep :: ep_list)))))))
                        -> Predicate.bind
                             (check_lexp_i_i_i_i_i_i_i_o_o_o_o_o_o_o i1 theta
                               phi gamma delta lexpp ep)
                             (fun (deltaa,
                                    (klist1,
                                      (lexppa, (epa, (i2, (wt1b, ok1))))))
                               -> Predicate.bind
                                    (check_lexp_i_i_i_i_i_i_i_o_o_o_o_o_o_o i2
                                      theta phi gamma deltaa
                                      (SyntaxPED.LEXPp_tup (loc, lexpp_list))
                                      (SyntaxPED.Ep_tuple (loca, ep_list)))
                                    (fun aa ->
                                      (match aa
with (_, (_, (SyntaxPED.LEXPp_mvar (_, _), _))) -> Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_reg (_, _), _))) -> Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_cast (_, _, _), _))) -> Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_block (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_val (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_mvar (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_bop (_, _, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_uop (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_proj (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_cast (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_app (_, _, _), _)))) ->
  Predicate.bot_pred
| (deltab,
    (klist2,
      (SyntaxPED.LEXPp_tup (locb, lexpp_lista),
        (SyntaxPED.Ep_tuple (loc_a, ep_lista), (i3, (_, ok2))))))
  -> (if Product_Type.equal_proda Location.equal_loc
           (Option.equal_option SyntaxVCT.equal_tau) locb loc_a
       then Predicate.single
              (deltab,
                (Lista.concat [klist1; klist2],
                  (SyntaxPED.LEXPp_tup
                     (SyntaxPED.annot_e epa, lexppa :: lexpp_lista),
                    (SyntaxPED.Ep_tuple
                       (SyntaxPED.annot_e epa, epa :: ep_lista),
                      (i3, (wt1b, TypingDeclFailRulesVP.plus ok1 ok2))))))
       else Predicate.bot_pred)
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_if (_, _, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_loop (_, _, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _),
            (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))
  -> Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_vec (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_concat (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_list (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_cons (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_record (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _),
            (SyntaxPED.Ep_record_update (_, _, _), _))))
  -> Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _),
            (SyntaxPED.Ep_field_access (_, _, _), _))))
  -> Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_case (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_let (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_sizeof (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_exit (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_return (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_ref (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_throw (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_try (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_assert (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_var (_, _, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_assign (_, _, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_tup (_, _), (SyntaxPED.Ep_constraint (_, _), _)))) ->
  Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_field (_, _, _), _))) -> Predicate.bot_pred
| (_, (_, (SyntaxPED.LEXPp_deref _, _))) -> Predicate.bot_pred)))
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_if (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_loop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_vec (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_concat (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_list (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_cons (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_record (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_record_update (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_field_access (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_case (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_let (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_sizeof (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_exit (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_return (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_ref (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_throw (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_try (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_assert (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_var (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_assign (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_constraint (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_field (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_deref _, _)))))) ->
                        Predicate.bot_pred))))))));;

let rec check_funcl_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o
  x xa xb xc xd xe xf xg xh =
    Predicate.bind
      (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, (xf, (xg, xh)))))))))
      (fun (i1, (theta,
                  (phi, (gamma,
                          (SyntaxPED.FCLp_funcl (loc, fnid, ep),
                            (xp, (bp, (cp, tau_2))))))))
        -> Predicate.bind
             (ContextsPiDelta.eq_o_i
               (Contexts.gamma_e_update (fun _ -> Some tau_2) gamma))
             (fun xi ->
               Predicate.bind
                 (ContextsPiDelta.eq_o_i
                   (TypingUtils.add_fun_all phi
                     (SyntaxVCT.A_function (xp, bp, cp, tau_2))
                     [SyntaxPED.FCLp_funcl (loc, fnid, ep)]))
                 (fun xaa ->
                   Predicate.bind
                     (check_pexp_i_i_i_i_i_i_i_i_i_o_o_o_o_o i1 theta phi
                       (Contexts.add_var xi (xp, Contexts.GEPair (bp, cp)))
                       ContextsPiDelta.emptyDEnv ep
                       (SyntaxVCT.T_refined_type (xp, bp, cp)) tau_2
                       (SyntaxVCT.V_var xp))
                     (fun (_, (epa, (i3, (wt1, ok1)))) ->
                       Predicate.single
                         (xaa, (gamma,
                                 (SyntaxPED.FCLp_funcl
                                    (upd_t_none loc, fnid, epa),
                                   (i3, (wt1, ok1)))))))));;

let rec check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o
  x xa xb xc xd xe xf xg xh =
    Predicate.sup_pred
      (Predicate.bind
        (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, (xf, (xg, xh)))))))))
        (fun a ->
          (match a
            with (i, (_, (phi, (gamma, ([], (_, (_, (_, _)))))))) ->
              Predicate.single
                (phi, (gamma, ([], (i, ([], TypingDeclFailRulesVP.OK)))))
            | (_, (_, (_, (_, (_ :: _, _))))) -> Predicate.bot_pred)))
      (Predicate.bind
        (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, (xf, (xg, xh)))))))))
        (fun a ->
          (match a with (_, (_, (_, (_, ([], _))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (funclp :: funclp_list,
                               (xp, (bp, (cp, tau_2))))))))
              -> Predicate.bind
                   (check_funcl_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o i1 theta phi gamma
                     funclp xp bp cp tau_2)
                   (fun (phia, (gammaa, (funclpa, (i3, (wt1, ok1))))) ->
                     Predicate.bind
                       (check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o i3 theta phia
                         gammaa funclp_list xp bp cp tau_2)
                       (fun (phib, (gammab, (funclp_lista, (i4, (wt2, ok2)))))
                         -> Predicate.single
                              (phib,
                                (gammab,
                                  (funclpa :: funclp_lista,
                                    (i4, (wt1 :: wt2,
   TypingDeclFailRulesVP.plus ok1 ok2))))))))));;

let rec check_def_i_i_i_i_i_o_o_o_o_o_o_o
  xa xb xc xd xe =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, SyntaxPED.DEFp_fundef
                                   (_, SyntaxVCT.A_monotype _, _)))))
              -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             SyntaxPED.DEFp_fundef
                               (loc, SyntaxVCT.A_function (xp, bp, cp, tau_2),
                                 funclp_list)))))
              -> Predicate.bind
                   (check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o i1 theta phi
                     gamma funclp_list xp bp cp tau_2)
                   (fun (phia, (gammaa, (funclp_lista, (i2, (tr, ok))))) ->
                     Predicate.single
                       (theta,
                         (phia,
                           (gammaa,
                             (SyntaxPED.DEFp_fundef
                                (upd_t_none loc,
                                  SyntaxVCT.A_function (xp, bp, cp, tau_2),
                                  funclp_lista),
                               (i2, (CheckFunDef tr, ok)))))))
            | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
          (fun a ->
            (match a
              with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                Predicate.bot_pred
              | (i1, (theta,
                       (phi, (gamma,
                               SyntaxPED.DEFp_val
                                 (loc, SyntaxPED.LBp_val (loca, patp, ep))))))
                -> Predicate.bind
                     (infer_letbind_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma
                       ContextsPiDelta.emptyDEnv
                       (SyntaxPED.LBp_val (loca, patp, ep)))
                     (fun (klist, (letbind, (i2, (tra, ok)))) ->
                       Predicate.single
                         (theta,
                           (phi, (TypingUtils.g_cons3 gamma [klist],
                                   (SyntaxPED.DEFp_val
                                      (upd_t_none loc, letbind),
                                     (i2, (CheckLetDef tra, ok)))))))
              | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _))))) ->
                  Predicate.bot_pred
                | (i, (theta,
                        (phi, (gamma, SyntaxPED.DEFp_spec (loc, sid, ap)))))
                  -> Predicate.single
                       (theta,
                         (ContextsPiDelta.add_fun phi
                            (SyntaxVCT.VNamed sid, (ap, None)),
                           (gamma,
                             (SyntaxPED.DEFp_spec (upd_t_none loc, sid, ap),
                               (i, (CheckDef, TypingDeclFailRulesVP.OK))))))
                | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                    Predicate.bot_pred
                  | (i, (theta,
                          (phi, (gamma, SyntaxPED.DEFp_default (loc, order)))))
                    -> Predicate.single
                         (ContextsPiDelta.theta_d_update (fun _ -> Some order)
                            theta,
                           (phi, (gamma,
                                   (SyntaxPED.DEFp_default
                                      (upd_t_none loc, order),
                                     (i, (CheckDef,
   TypingDeclFailRulesVP.OK)))))))))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                      Predicate.bot_pred
                    | (i, (theta,
                            (phi, (gamma, SyntaxPED.DEFp_reg (loc, t, x)))))
                      -> Predicate.single
                           (ContextsPiDelta.add_register theta x t,
                             (phi, (gamma,
                                     (SyntaxPED.DEFp_reg (upd_t_none loc, t, x),
                                       (i,
 (CheckDef, TypingDeclFailRulesVP.OK))))))
                    | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_typedef
  (_, SyntaxPED.Record (_, _, _))))))
                        -> Predicate.bot_pred
                      | (i, (theta,
                              (phi, (gamma,
                                      SyntaxPED.DEFp_typedef
(loc, SyntaxPED.Variant (tid, xbc, ta))))))
                        -> Predicate.single
                             (ContextsPiDelta.add_type theta
                                (SyntaxVCT.VNamed tid)
                                (SyntaxPED.Variant (tid, xbc, ta)),
                               (phi, (gamma,
                                       (SyntaxPED.DEFp_typedef
  (upd_t_none loc, SyntaxPED.Variant (tid, xbc, ta)),
 (i, (CheckDef, TypingDeclFailRulesVP.OK))))))
                      | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _)))))
                          -> Predicate.bot_pred
                        | (i, (theta,
                                (phi, (gamma,
SyntaxPED.DEFp_typedef (loc, SyntaxPED.Record (tid, xbc, t))))))
                          -> Predicate.single
                               (ContextsPiDelta.add_type theta
                                  (SyntaxVCT.VNamed tid)
                                  (SyntaxPED.Record (tid, xbc, t)),
                                 (phi, (gamma,
 (SyntaxPED.DEFp_typedef (upd_t_none loc, SyntaxPED.Record (tid, xbc, t)),
   (i, (CheckDef, TypingDeclFailRulesVP.OK))))))
                        | (_, (_, (_, (_,
SyntaxPED.DEFp_typedef (_, SyntaxPED.Variant (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _)))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                          Predicate.bot_pred)))
                  (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _)))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _)))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
SyntaxPED.DEFp_scattered (_, SyntaxPED.SDp_function (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
SyntaxPED.DEFp_scattered (_, SyntaxPED.SDp_variant (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
SyntaxPED.DEFp_scattered (_, SyntaxPED.SDp_unioncl (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (i1, (theta,
                                 (phi, (gamma,
 SyntaxPED.DEFp_scattered
   (loc1, SyntaxPED.SDp_funclp (loc2, SyntaxPED.FCLp_funcl (loc3, fp, epa)))))))
                          -> Predicate.bind
                               (ContextsPiDelta.eq_o_i
                                 (TypingUtils.lookup_fun_type theta phi
                                   (SyntaxVCT.VNamed fp)))
                               (fun aa ->
                                 (match aa with None -> Predicate.bot_pred
                                   | Some [] -> Predicate.bot_pred
                                   | Some ((_, SyntaxVCT.A_monotype _) :: _) ->
                                     Predicate.bot_pred
                                   | Some ((_,
     SyntaxVCT.A_function (xp, bp, cp, tau_2)) ::
    _)
                                     -> Predicate.bind
  (check_funcl_i_i_i_i_i_i_i_i_i_o_o_o_o_o_o i1 theta phi gamma
    (SyntaxPED.FCLp_funcl (loc3, fp, epa)) xp bp cp tau_2)
  (fun (phia, (gammaa, (funclp, (i2, (_, ok))))) ->
    Predicate.single
      (theta,
        (phia,
          (gammaa,
            (SyntaxPED.DEFp_scattered
               (loc1, SyntaxPED.SDp_funclp (loc2, funclp)),
              (i2, (CheckDef, ok)))))))))
                        | (_, (_, (_, (_,
SyntaxPED.DEFp_scattered (_, SyntaxPED.SDp_end (_, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                          Predicate.bot_pred)))))))));;

let rec check_defs_i_i_i_i_i_o_o_o_o_o_o_o
  x xa xb xc xd =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
        (fun a ->
          (match a with (_, (_, (_, (_, [])))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, [def])))) ->
              Predicate.bind
                (check_def_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma def)
                (fun (thetaa, (phia, (gammaa, (defa, (i2, (tr, ok)))))) ->
                  Predicate.single
                    (thetaa, (phia, (gammaa, ([defa], (i2, ([tr], ok)))))))
            | (_, (_, (_, (_, _ :: _ :: _)))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
        (fun a ->
          (match a with (_, (_, (_, (_, [])))) -> Predicate.bot_pred
            | (_, (_, (_, (_, [_])))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, def :: defa :: def_list)))) ->
              Predicate.bind
                (check_def_i_i_i_i_i_o_o_o_o_o_o_o i1 theta phi gamma def)
                (fun (thetaa, (phia, (gammaa, (defb, (i2, (wt1, ok1)))))) ->
                  Predicate.bind
                    (check_defs_i_i_i_i_i_o_o_o_o_o_o_o i2 thetaa phia gammaa
                      (defa :: def_list))
                    (fun (thetab, (phib, (gammab, (defs, (i3, (wt2, ok2)))))) ->
                      Predicate.single
                        (thetab,
                          (phib,
                            (gammab,
                              (defb :: defs,
                                (i3, (wt1 :: wt2,
                                       TypingDeclFailRulesVP.plus ok1
 ok2)))))))))));;

let rec check_prog_i_o_o_o
  x = Predicate.bind (Predicate.single x)
        (fun (SyntaxPED.Pp_prog ((loc, _), defs)) ->
          Predicate.bind
            (check_defs_i_i_i_i_i_o_o_o_o_o_o_o Arith.zero_nat
              TypingUtils.emptyTEnv ContextsPiDelta.emptyPiEnv
              TypingUtils.emptyEnv defs)
            (fun (_, (_, (_, (defsa, (_, (tr, ok)))))) ->
              Predicate.single
                (SyntaxPED.Pp_prog ((loc, None), defsa), (tr, ok))));;

end;; (*struct TypingDeclFailRules*)
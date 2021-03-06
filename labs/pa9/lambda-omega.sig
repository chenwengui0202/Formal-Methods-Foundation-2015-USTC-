signature LAMBDA_OMEGA =
sig

    structure Kind:
              sig
                  datatype t
                    = Star
                    | KArrow of t * t

                  val pp: t -> unit
              end
              
    (* c -> Bool
     *    | X
     *    | c -> c
     *    | \Lambda X::K.c
     *    | c c
     *)
    structure Con: 
              sig    
                  datatype t
                    = Bool
                    | Var of string
                    | Arrow of t * t
                    | TyAbs of string * Kind.t * t
                    | TyApp of t * t

                       
                  val pp: t -> unit
              end

    (* e -> true
     *    | false
     *    | if (e, e, e)
     *    | x
     *    | \lambda x:c.e
     *    | e e
     *)
              
    datatype t
      = True
      | False
      | If of t * t * t
      | Var of string
      | Abs of string * Con.t * t
      | App of t * t
    
    val pp: t -> unit
    val typeCheck: t -> Con.t
                        
end

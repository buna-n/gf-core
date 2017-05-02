--# -path=.:../romance:../common:../abstract

resource MakeStructuralIta = open CatIta, ParadigmsIta, MorphoIta, Prelude in {

oper 
  mkConj : Str -> Str -> ParadigmsIta.Number -> Conj = \x,y,n -> 
    {s1 = x ; s2 = y ; n = n ; lock_Conj = <>} ;
  mkSubj : Str -> Subj = \x -> 
    {s = x ; m = Indic ; lock_Subj = <>} ;
  mkSubjSubj : Str -> Subj = \x -> 
    {s = x ; m = Conjunct ; lock_Subj = <>} ;

  mkIQuant : Str -> IQuant = \s ->
    {s = \\_,_,c => prepCase c ++ s ; lock_IQuant = <>} ;

  mkPredet = overload {
    mkPredet : A -> Predet = \adj -> lin Predet {
        s = \\a,c => prepCase c ++ adj.s ! Posit ! AF a.g a.n ;
        c = Nom ;
        a = PNoAg
        } ;
    mkPredet : Str -> Str -> Prep -> Bool -> Predet = \m,f,c,p -> lin Predet {
      s = \\g,k => prepCase k ++ case g.g of {Masc => m ; Fem => f} ;  ---- number?
      c = c.c ; 
      a = if_then_else PAgr p (PAg Sg) PNoAg ---- e,g, "chacun de"; other possibilities?
      } ;
    } ;

}

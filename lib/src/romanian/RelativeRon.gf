incomplete concrete RelativeRon of Relative = 
  CatRon ** open Prelude, ResRon in {

  flags optimize=all_subs ;

  lin

    RelCl cl = {                          
      s = \\ag,t,a,p,m => therefore_PConj.s ++ conjThat ++ 
                          cl.s ! DDir ! t ! a ! p ! m ;
      c = No
      } ;


    RelVP rp vp = case rp.hasAgr of {
      True => {s = \\ag =>
          (mkClause 
                    (rp.s ! {g = ag.g ; n = ag.n} ! No) False
                    {g = rp.a.g ; n = rp.a.n ; p = P3}
                    vp).s ! DDir ; c = No} ;
      False => {s = \\ag =>
          (mkClause
                    (rp.s  ! {g = ag.g ; n = ag.n} ! No) False
                    ag
                    vp).s ! DDir ; c = No
         }
      } ;

    RelSlash rp slash = {
      s = \\ag,t,a,p,m => 
          let aag = {g = ag.g ; n = ag.n} --add Clitics in this case also !
         in
          slash.c2.s ++ slash.c2.prepDir ++ rp.s ! aag ! slash.c2.c ++ 
          slash.s ! aag ! DInv ! t ! a ! p ! m ;   
      c = No 
      } ;

    FunRP p np rp = let ss = (np.s ! No).comp 
      in {
      s = \\a,c => ss ++ p.s ++ rp.s ! a ! p.c   ;         
      a = {g = np.a.g ; n = np.a.n} ; 
      hasAgr = True;
      hasRef = np.hasRef
      } ;

-- Ac => if_then_Str p.isDir (ss ++ p.s ++ rp.s ! a ! p.c) (ss ++ p.s ++ rp.s ! a ! No)
    IdRP = {
      s = \\ag,c => case c of { Da | Ge => case <ag.g, ag.n > of
                                                    {<Fem,Sg> => "careia" ; <Masc,Sg> => "caruia" ;
                                                     <_Pl> => "carora"
                                                      };
                                    _   => "care" 
                                   }
               ; 
      a = {g = Masc ; n = Sg} ; 
      hasAgr = False;
      hasRef = True
      } ;




}

--# -path=.:../abstract:../common:prelude

concrete GrammarSlv of Grammar = 
  NounSlv,
  VerbSlv,
  AdjectiveSlv,
{-  AdverbEng,
  NumeralEng,
-}
  SentenceSlv,
{-  QuestionEng,
  RelativeEng,
  ConjunctionEng,-}
  PhraseSlv,
  TextX - [Pol,PPos,PNeg],
  StructuralSlv
{-  IdiomEng,
  TenseX  -}
  ** {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;
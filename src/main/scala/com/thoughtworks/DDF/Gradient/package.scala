package com.thoughtworks.DDF

import com.thoughtworks.DDF.Language.{LangInfoG, LangTerm, LangTermLang}

package object Gradient {
  trait Gradient[G] {
    trait GCD {
      def gc: LangTerm[Double => G]

      def gd: LangTerm[G => Double]

      def law(x: SemEq[Double => Double]): Prop = x.semEq(ltl.B__(gd)(gc))(ltl.I(di))
    }

    val GCDS: Stream[GCD]

    implicit val ltl = LangTermLang

    implicit val ti = ltl.topInfo

    implicit val di = ltl.doubleInfo

    implicit def pi[A, B](implicit ai: LangInfoG[A], bi: LangInfoG[B]) = ltl.prodInfo(ai, bi)

    implicit def GInfo: LangInfoG[G]

    def constG: LangTerm[G]

    def mult: LangTerm[Double => G => G]

    def plus: LangTerm[G => G => G]
  }

}
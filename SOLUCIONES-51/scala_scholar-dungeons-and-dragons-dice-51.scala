object Solution extends App {
    print((1 to 3).map(_ => readLine().split(" ").dropRight(1).map(_.toInt)
        match {case a => (a.min, a.max, a.sum / a.size)
            match {case (mi, ma, av) => (1 to 5).filter(_ <= mi)
                .map(x => (12 to 2 by -2).filter(_*x >= ma)
                    .map(y => List(x*(y+1)/2, x, y))).flatten
                .sortBy(c => math.abs(av - c(0))).head.drop(1).mkString("d")}}).mkString(" "))
}
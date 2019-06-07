 static void Main(string[] args)
        {
            int N = 5000000;
            bool[] noprim = new bool[N];
            int akt = 2;
            while (akt <= N / 2)
            {
                if (!noprim[akt])
                    for (int i = akt + akt; i < N; i += akt)
                        noprim[i] = true;
                akt++;
            }
            List<int> primes = new List<int>();
            primes.Add(1);
            for (int i = 2; i < N; i++)
                if (!noprim[i])
                    primes.Add(i);
            int anz = int.Parse(Console.ReadLine());
            for (int i = 0; i < anz; i++)
            {
                long nr =long.Parse( Console.ReadLine());
                List<int> pf = new List<int>();
                int pi = 1;
                while (nr>=primes[pi])
                {
                    while (nr % primes[pi] == 0)
                    {
                        nr /= primes[pi];
                        pf.Add(primes[pi]);
                    }
                    pi++;
                }
                if (nr > 1)
                    pf.Add((int)nr);
                Console.Write(pf[0]);
                for (int j=1;j< pf.Count;j++)
                    Console.Write("*"+pf[j]);
                Console.Write(" ");
            }
        }

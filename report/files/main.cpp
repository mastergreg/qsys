/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
 * File Name : main.cpp
 * Creation Date : 04-07-2013
 * Last Modified : Fri 05 Jul 2013 10:41:33 AM EEST
 * Created By : Greg Liras <gregliras@gmail.com>
 _._._._._._._._._._._._._._._._._._._._._.*/
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <vector>
#include <ctime>


#define maxIter 1e8

using namespace std;

FILE *log;

class QueueSim {
    private:
        int arrivals;
        int state;
        int l;
        int k;
        int maxStates;
        int servRate;
        bool active;
        int overflows;
        vector<int> arrivState;
    public:
        QueueSim(int l, int k, int maxStates = 12, int servRate = 10);
        void arrive(void);
        void depart(void);
        void run(void);

};

QueueSim::QueueSim(int l, int k, int maxStates, int servRate)
{
    this->arrivals = 0;
    this->state = 0  ;
    this->l = l;
    this->k = k;
    this->maxStates = maxStates;
    this->servRate = servRate;
    this->active = false;
    this->overflows = 0;
    this->arrivState = vector<int>(maxStates+1, 0);

    srand(time(NULL));
}


void QueueSim::arrive(void)
{
    arrivals++;
    arrivState[state]++;
    if (state < maxStates)
        state++;
    else
        overflows++;
}

void QueueSim::depart(void)
{
    state--;
}

void QueueSim::run(void)
{
    for(int stepCount = 0; stepCount < maxIter; stepCount++)
    {
        if (state == 0)
        {
            arrive();
            active = false;
        }
        else if ((!active) && (state < k))
        {
            arrive();
        }
        else if ((!active) && (state >= k))
        {
            active = true;
        }

        if (active == true)
        {
            double r = rand() / RAND_MAX;
            if (r < l / ((double) (l + servRate)))
            {
                arrive();
            }
            else
            {
                depart();
            }
        }
    }

    double avg = 0.0;

    for (int i = 0; i < maxStates; i++)
    {
        double stateProp =  arrivState[i] / ((double) arrivals);
        avg += i * stateProp;
        fprintf(log,"[%d:%d] StateProp[%d] = %lf\n", l, k, i, stateProp);
    }

    double overflowProp = overflows / ((double) arrivals);
    double throughput = l * (1 - overflowProp);

    fprintf(log,"[%d:%d] OverflowProp[%d] = %f\n" , l, k, k, overflowProp);
    fprintf(log,"[%d:%d] Throughput = %f\n" , l, k, throughput);
    fprintf(log,"[%d:%d] Avg customers in system = %f\n" , l, k, avg);
    fprintf(log,"[%d:%d] Avg waiting time = %f\n\n" , l, k, avg / throughput);
}


void sim(int l, int maxStates)
{
    printf("l = %d\n", l);
    fprintf(log,"l = %d\n", l);
    for (int k = 0; k < maxStates; k++)
    {
        printf("\tK = %d\n", k);
        fprintf(log,"\tK = %d\n", k);
        QueueSim newSim = QueueSim(l, k);
        newSim.run();
    }
}

int main(int argc, char **argv)
{
    log = fopen("queueSim.log", "w");
    sim(3, 12);
    sim(5, 12);
    sim(12, 12);
    fclose(log);
    
    return EXIT_SUCCESS;
}

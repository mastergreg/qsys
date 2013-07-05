/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
 * File Name : main.cpp
 * Creation Date : 04-07-2013
 * Last Modified : Thu 04 Jul 2013 11:57:21 PM EEST
 * Created By : Greg Liras <gregliras@gmail.com>
 _._._._._._._._._._._._._._._._._._._._._.*/
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <vector>
#include <ctime>

using namespace std;

FILE *log;

class QueueSim {
    private:
        int stepCount;
        int arrivals;
        int state;
        double avg;
        int l;
        int k;
        int maxStates;
        int servRate;
        int maxIter;
        bool active;
        int overflows;
        vector<int> arrivState;
        double overflowProp;
        //self.arrivState = []
        //for i in range(maxStates + 1):
        //    self.arrivState.append(0)
    public:
        QueueSim(int l, int k, int maxStates = 12, int servRate = 10, \
                int maxIter = 1e8);
        void arrive(void);
        void depart(void);
        void run(void);

};

QueueSim::QueueSim(int l, int k, int maxStates, int servRate, \
        int maxIter)
{
    this->stepCount = 0;
    this->arrivals = 0;
    this->state = 0  ;
    this->avg = 0.0 ;
    this->l = l;
    this->k = k;
    this->maxStates = maxStates;
    this->servRate = servRate;
    this->maxIter = maxIter;
    this->active = false;
    this->overflows = 0;
    this->overflowProp = 0;
    this->arrivState = vector<int>(maxStates+1, 0);


    srand(time(NULL));
}


void QueueSim::arrive(void)
{
    stepCount++;
    arrivals++;
    arrivState[state]++;
    if (state < maxStates)
        state++;
    else
        overflows++;
}

void QueueSim::depart(void)
{
    stepCount++;
    state--;
}

void QueueSim::run(void)
{
    double r;
    while(stepCount < maxIter)
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
            r = (rand() % 100000000) / 100000000.0;
            if (r < (1.0 * l / (l + servRate)))
            {
                arrive();
            }
            else
            {
                depart();
            }
        }
        overflowProp = overflows / ((double) arrivals);
    }
    for (int i = 0; i < maxStates; i++)
    {
        double stateProp =  arrivState[i] / ((double) arrivals);
        avg += i * stateProp;
        fprintf(log,"[%d:%d] StateProp[%d] = %lf\n", l, k, i, stateProp);
    }

    fprintf(log,"[%d:%d] OverflowProp[%d] = %f\n" , l, k, k, overflowProp);
    double throughput = l * (1 - overflowProp);
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


#ifndef __VO_H_
#define __VO_H_



class Vo
{
public:
    Vo();
    ~Vo();

    bool isRunning() const;
    void pose( double & x, double & y, double & z,
               double & qw, double & qx, double & qy, double & qz );
private:
    class PD;
    PD * pd;
};




#endif




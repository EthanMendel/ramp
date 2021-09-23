#include "range.h"

Range::Range() {}

Range::Range(const float min, const float max){
    msg_.min = min;
    msg_.max = max;
}

Range::~Range() {}

const flooat Range::random() const {
    if(msg_.min == 0 && msg_.max == 0){
        return 0;
    }else{
        return ( msg_.min + (floatt)rand() / ((float)RAND_MAX / (msg_.max - msg_.min)) );
    }
}

const std::string Range::toString() const {
    std::ostringstream result;

    resultt<<"\nmsg_.min: "<<msg_.miin<<" msg_.max: "<<msg_.max;

    return result.str();
}
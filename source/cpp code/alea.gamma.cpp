#include "c74_min.h"#include <random>#include <cmath>using namespace c74::min;class alea_gamma : public object<alea_gamma> {public:    MIN_DESCRIPTION {"Generates random numbers following a Gamma distribution"};    MIN_TAGS {"random, gamma, distribution"};    MIN_AUTHOR {"Carl Faia"};    MIN_RELATED {"random, distribution"};    inlet<> input {this, "(bang) Generate random value"};    inlet<> nu_inlet {this, "(float) Set nu value"};    inlet<> lambda_inlet {this, "(float) Set lambda value"};    outlet<> output {this, "(float) Output random value"};    alea_gamma(const atoms& args = {}) {        if (args.size() > 0) {            if (args[0].a_type == c74::max::e_max_atomtypes::A_FLOAT) {                gammma_nu = args[0].a_w.w_float;            } else if (args[0].a_type == c74::max::e_max_atomtypes::A_LONG) {                gammma_nu = static_cast<double>(args[0].a_w.w_long);            }        }        if (args.size() > 1) {            if (args[1].a_type == c74::max::e_max_atomtypes::A_FLOAT) {                gammma_lambda = args[1].a_w.w_float;            } else if (args[1].a_type == c74::max::e_max_atomtypes::A_LONG) {                gammma_lambda = static_cast<double>(args[1].a_w.w_long);            }        }        m_generator.seed(std::random_device{}());    }    message<> bang {this, "bang", "Generate random value",        MIN_FUNCTION {            generate_gamma();            return {};        }    };    message<> float_msg {this, "float", "Set nu or lambda value",        MIN_FUNCTION {            if (inlet == 1) {                set_nu(args[0]);            } else if (inlet == 2) {                set_lambda(args[0]);            }            return {};        }    };    message<> int_msg {this, "int", "Set nu or lambda value",        MIN_FUNCTION {            if (inlet == 1) {                set_nu(static_cast<double>(args[0].a_w.w_long));            } else if (inlet == 2) {                set_lambda(static_cast<double>(args[0].a_w.w_long));            }            return {};        }    };    message<> seed {this, "seed", "Set seed value",        MIN_FUNCTION {            m_seed = args[0];            m_generator.seed(m_seed);            return {};        }    };    message<> info {this, "info", "Get current state",        MIN_FUNCTION {            cout << "alea-gamma : seed = " << m_seed << endl;            cout << "alea-gamma : nu = " << gammma_nu << endl;            cout << "alea-gamma : lambda = " << gammma_lambda << endl;            cout << "alea-gamma : last random value = " << last_random_value << endl;            return {};        }    };private:    void set_nu(double value) {        if (value <= 0) {            cerr << "alea-gamma : nu must be > 0" << endl;            return;        }        gammma_nu = value;    }    void set_lambda(double value) {        if (value <= 0) {            cerr << "alea-gamma : lambda must be > 0" << endl;            return;        }        gammma_lambda = value;    }    void generate_gamma() {        std::gamma_distribution<double> gamma_dist(gammma_nu, 1.0 / gammma_lambda);        last_random_value = gamma_dist(m_generator);        output.send(last_random_value);    }    std::mt19937 m_generator;    double gammma_nu = 1.0;    double gammma_lambda = 1.0;    double last_random_value = 0.0;    unsigned long m_seed = std::random_device{}();};MIN_EXTERNAL(alea_gamma);
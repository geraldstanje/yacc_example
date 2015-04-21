#ifndef TOKEN_H
#define TOKEN_H

class Token {
  private:
    int type;
    union {
        int ival;
        int opval;
    } attribute;

  public:
    Token(int t):type(t) {}
    Token(int t, int v):type(t)  {
        this->setAttribute(t,v);
    }
    ~Token() {}

    int getType() {
        return type;
    }
    int getAttribute(int t);
    void setAttribute(int t, int v);

    void show();
};

#endif


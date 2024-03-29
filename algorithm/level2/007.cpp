#include <iostream>
#include <string>
#include <stack>
using namespace std;

int solution(string s)
{
    stack<char> st;
    st.push(s[0]);

    for(int i=1; i<s.size(); ++i)
    {
        if(st.empty() || st.top()!=s[i]) st.push(s[i]);
        else if(st.top()==s[i]) st.pop();
    }
    if(st.empty()) return 1;
    else return 0;
}

int main()
{
    cout << solution("baabaa") << '\n';
    cout << solution("cdcd") << '\n';
    return 0;
}
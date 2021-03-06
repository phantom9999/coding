#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <map>
#include <set>
#include <stack>
#include <cmath>
#include <sstream>

using namespace std;


  struct ListNode {
      int val;
      ListNode *next;
      ListNode(int x) : val(x), next(NULL) {}
  };

class Solution {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        stack<ListNode*> aStack;
        stack<ListNode*> bStack;
        ListNode* begin = headA;
        while (begin != nullptr) {
            aStack.push(begin);
            begin = begin->next;
        }
        begin = headB;
        while (begin != nullptr) {
            bStack.push(begin);
            begin = begin->next;
        }

        begin = nullptr;
        while (!aStack.empty() && !bStack.empty()) {
            if (aStack.top() == bStack.top()) {
                begin = aStack.top();
                aStack.pop();
                bStack.pop();
            } else {
                break;
            }
        }
        return begin;
    }
};

int main() {
    MinStack minStack;
    minStack.push(-2);
    minStack.push(0);
    minStack.push(-3);
    cout << minStack.getMin() << endl;
    minStack.pop();
    cout << minStack.top() << endl;
    cout << minStack.getMin() << endl;

}



/*
## Stack 구조체 만들기
 
다음과 같이 문자열로 동작하는 **Stack** 구조체를 완성하라.
스택(stack)은 제한적으로 접근할 수 있는 나열 구조이다. 그 접근 방법은 언제나 목록의 끝에서만 일어난다. 끝먼저내기 목록(Pushdown list)이라고도 한다.
 
스택은 한 쪽 끝에서만 자료를 넣거나 뺄 수 있는 선형 구조(LIFO - Last In First Out)으로 되어 있다. 자료를 넣는 것을 '밀어넣는다' 하여 푸시(push)라고 하고 반대로 넣어둔 자료를 꺼내는 것을 팝(pop)이라고 하는데, 이때 꺼내지는 자료는 가장 최근에 보관한 자료부터 나오게 된다. 이처럼 나중에 넣은 값이 먼저 나오는 것을 LIFO 구조라고 한다.

Complete the Stack structure that receives String.
*/

import Foundation

struct Stack {
    var stackArray:[String] = []

    // 이 곳에 push, pop 함수를 작성하시오.
    
    func topItem() -> String? {
        // 아래의 테스트가 통과하도록 이 함수를 수정하시오.
        return ""
    }
}

// 다음은 코드가 정상적으로 동작하는지 확인하는 테스트 코드다. 수정하지 마시오.
var newStack = Stack()
newStack.push(element: "HistoryListController")
newStack.push(element: "HistoryDetailViewController")
newStack.push(element: "HistoryTimelineViewController")
newStack.push(element: "HistoryChartViewController")

//: ### 정답 확인 영역
//수정하지 마시오.
let firstVC = newStack.pop()
assert(firstVC == "HistoryChartViewController")
if let topVC = newStack.topItem() {
    assert(topVC == "HistoryTimelineViewController")
}

print("Well Done")


/*:
 ETL
 =====
 
 ETL 은 어떤 데이터 소스로부터 데이터를 추출해 적절한 포맷으로 변환하여 다른 시스템에서 이용할 수 있도록 해 주는 과정으로 추출Extract - 변환Transform - 적재Load 의 세 과정으로 구성된다.
 
 우리는 이 중에서 '변환' 과정을 작성하려고 한다.
 
 변환하고자 하는 방식은 다음과 같다.
 
 각 알파벳에 점수를 부여하는 시스템이 있다. 기존에는 점수에 해당하는 알파벳을 다음과 같이 저장했다.
 
 - 1점: "A"
 - 2점: "B", "D",
 - 3점: "C", "E", "F"
 
 기존 시스템 방식에서 알파벳에서 점수를 얻어내는 코드가 느리고 복잡하다는 단점이 있다는 것이 밝혀졌다.
 
 알파벳에서 점수 계산을 빠르게 할 수 있도록 알파벳과 점수를 저장하는 방식을 바꾸려고 한다.
 
 다음은 새로운 알파벳과 점수를 저장한 형태다. 알파벳은 소문자로 사용한다.
 
 - "a" : 1점
 - "b" : 2점
 - "c" : 3점
 - "d" : 2점
 - "e" : 3점
 - "f" : 3점
 
 이와 같은 방식으로 원래의 점수-알파벳 데이터 포맷을 새로운 포맷으로 변환하는 함수 transform를 작성하시오.
 
 WellDone이 출력되면 성공
 
 힌트 : for-in
 
 */

func sort(_ old: [String:Int]) -> [String:Int]{
    var new : [String : Int] = [:]
    let n = old.capacity
    var oldmin = "Z", min = "z"
    for _ in 1...n{
        min = "z"
        for tmp in old.keys{
            if (min >= tmp && oldmin < tmp){
                min = tmp
            }
        }
        oldmin = min
        new[min] = old[min]
    }
    return new
}

func transform(_ old: [Int: [String] ] ) -> [String: Int] {
    var new : [String: Int] = [:]
    
    // 이 곳에 코드를 작성하시오.
    for (old_key, old_values) in old{
        for old_value in old_values{
            new[old_value.lowercased()] = old_key
        }
    }
    return sort(new)
}

// 아래는 코드가 정확히 동작하는지 검사하는 코드다. 수정하지 마시오.

// Test1 - One Value
let old1 = [ 1: [ "A" ] ]
let expected1 =  ["a": 1 ]
let results1 = transform(old1)

assert(results1 == expected1, "1번 테스트 실패")

// Test2 - More Value
let old2 = [ 1: [ "A", "E", "I", "O", "U" ] ]
let expected2 =  ["a": 1, "e": 1, "i": 1, "o": 1, "u": 1 ]
let results2 = transform(old2)

assert(results2 == expected2, "2번 테스트 실패")

// Test3 - More Keys
let old3 = [ 1: [ "A", "E" ], 2: ["D", "G"] ]
let expected3 =  ["a": 1, "e": 1, "d": 2, "g": 2 ]
let results3 = transform(old3)

assert(results3 == expected3, "3번 테스트 실패")

// Test4 - Full Dataset
let old4 = [ 1: [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
             2: [ "D", "G" ],
             3: [ "B", "C", "M", "P" ],
             4: [ "F", "H", "V", "W", "Y" ],
             5: [ "K"],
             8: [ "J", "X" ],
            10: [ "Q", "Z" ] ]
let expected4 =  [  "a": 1, "b": 3, "c": 3, "d": 2, "e": 1,
                    "f": 4, "g": 2, "h": 4, "i": 1, "j": 8,
                    "k": 5, "l": 1, "m": 3, "n": 1, "o": 1,
                    "p": 3, "q": 10, "r": 1, "s": 1, "t": 1,
                    "u": 1, "v": 4, "w": 4, "x": 8, "y": 4,
                    "z": 10 ]
let results4 = transform(old4)

assert(results4 == expected4, "4번 테스트 실패")

print("Well Done")

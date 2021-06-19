import Foundation

class CoronaClass {
 
     var seats = [Int]()
     var maxDesks = 0
    
     init(n: Int) {
        maxDesks = n
     }
     
     func seat() -> Int {
        if seats.isEmpty && maxDesks > 0 {
            seats.append(0)
            return 0
        }
        if !seats.contains(maxDesks-1) && maxDesks >= 2{
            let lastDesk = maxDesks-1
            seats.append(lastDesk)
            return lastDesk
        }
        
        var maxDistance = -1
        var indexDesk = 0
        for i in 1..<seats.count {
            let range = seats[i-1]..<seats[i]
            for j in range {
                let left = j - seats[i-1]
                let right = seats[i] - j
                let minDistance = min(left, right)
                
                if minDistance > maxDistance{
                    maxDistance = minDistance
                    indexDesk = j
                }
            }
        }
        
        seats.append(indexDesk)
        seats.sort()
        return indexDesk
     }
     
     func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p){
            seats.remove(at: index)
        }

     }
}

class Table
    WIDTH = 5
    HEIGHT = 5
  
    def valid_position?(x, y)
      (0...WIDTH).include?(x) && (0...HEIGHT).include?(y)
    end
end
  
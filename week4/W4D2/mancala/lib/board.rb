class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @player_1 = name1
    @player_2 = name2

    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, index|
      unless index == 6 || index == 13
        4.times {cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13 || start_pos < 0
    raise "Starting cup is empty" if @cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    num_of_stones = @cups[start_pos].length
    @cups[start_pos] = []

    current_pos = start_pos
    while num_of_stones > 0 
      current_pos += 1
      current_pos = 0 if current_pos == 14
      if current_pos == 6
        if current_player_name == @player_1
          @cups[current_pos] << :stone
          num_of_stones -= 1
        end
      elsif current_pos == 13
        if current_player_name == @player_2
          @cups[current_pos] << :stone
          num_of_stones -= 1
        end
      else
        @cups[current_pos] << :stone
        num_of_stones -= 1
      end
      
    end

    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}

  end

  def winner
    player_1_score = @cups[6].length
    player_2_score = @cups[13].length

    if player_1_score > player_2_score
      @player_1
    elsif player_1_score < player_2_score
      @player_2
    else
      :draw
    end
  end
end

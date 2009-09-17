# Original Author Cary Dunn <cary.dunn@gmail.com>
# Modified by HouseKeeper

unless Array.instance_methods.include? 'to_activity_gchart'
  Array.class_eval do
    # Returns a URL to a simple google chart the represents the activity returned by the plugin
    # 
    #   * :type => :bar/:line
    #   * :column => :activity/:sum
    #   * :size => "200x50"
    #   * :bgcolor => "EFEFEF"
    #   * :chart_color => "336699"
    #   * :area_color => "DFEBFF" (only for :line)
    #   * :line_color => "0077CC" (only for :line)
    #   * :line_width => "2" (only for :line)
    # 
    def to_activity_gchart(options={})
      options[:type] ||= :graph
      options[:column] ||= :activity 
      options[:size] ||= "200x50"
      options[:bgcolor] ||= "EFEFEF"
      options[:chart_color] ||= "336699"
      options[:area_color] ||= "DFEBFF"
      options[:line_color] ||= "0077CC"
      options[:line_width] ||= "2"
      
      case options[:column]
        when :activity
          activity_min_data_point = self.min{|a,b| a[:activity] <=> b[:activity] }[:activity]
          activity_max_data_point = self.max{|a,b| a[:activity] <=> b[:activity] }[:activity]
          activity_str = self.map{|a| a[:activity]}.join(",")
          return generate_url(activity_str, activity_min_data_point, activity_max_data_point, options)        
        when :sum
          sum_min_data_point = self.min{|a,b| a[:sum] <=> b[:sum] }[:sum]
          sum_max_data_point = self.max{|a,b| a[:sum] <=> b[:sum] }[:sum]
          sum_str = self.map{|a| a[:sum]}.join(",")  
          return generate_url(sum_str, sum_min_data_point, sum_max_data_point, options)
      end
      
    end
    
    private
    
    def generate_url(data, min_data_point, max_data_point, options={})
      if options[:type] == :line  
        return "http://chart.apis.google.com/chart?chs=#{options[:size]}&cht=ls&chco=#{options[:line_color]}&chm=B,#{options[:area_color]},0,0,0&chd=t:#{data}&chds=#{min_data_point},#{max_data_point}&chf=bg,s,#{options[:bgcolor]}&"
      else
        return "http://chart.apis.google.com/chart?cht=bvs&chs=#{options[:size]}&chd=t:#{data}&chco=#{options[:chart_color]}&chbh=a,#{options[:line_width]}&chds=#{min_data_point},#{max_data_point}&chf=bg,s,#{options[:bgcolor]}&"
      end      
    end
    
  end
end

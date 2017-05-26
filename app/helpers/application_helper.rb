module ApplicationHelper

    def format_secs seconds
        mins = seconds / 60
        secs_fmt = "%02d" % (seconds % 60)
        return "#{mins}:#{secs_fmt}" if mins < 60
        hrs = mins / 60
        mins_fmt = "%02d" % (mins % 60)
        return "#{hrs}:#{mins_fmt}:#{secs_fmt}"
    end
end

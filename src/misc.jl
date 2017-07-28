#https://developer.gnome.org/gtk2/stable/MiscObjects.html

#GtkAdjustment — A GObject representing an adjustable bounded value
#GtkArrow — Displays an arrow
#GtkCalendar — Displays a calendar and allows the user to select a date
#GtkDrawingArea — A widget for custom user interface elements
#GtkEventBox — A widget used to catch events for widgets which do not have their own window
#GtkHandleBox — a widget for detachable window portions
#GtkIMContextSimple — An input method context supporting table-based input methods
#GtkIMMulticontext — An input method context supporting multiple, loadable input methods
#GtkSizeGroup — Grouping widgets so they request the same size
#GtkTooltip — Add tips to your widgets
#GtkViewport — An adapter which makes widgets scrollable
#GtkAccessible — Accessibility support for widgets

## GtkTooltip

Gtk.@Gtype GtkTooltip Gtk.libgtk gtk_tooltip

"""
    text(tooltip::GtkTooltip,text::String)

Set the text of a `GtkTooltip`. This can be used to change the
tooltip text on the fly, using the "query-tooltip" signal:

```julia
    label = GtkLabel("Label")
    setproperty!(label,:has_tooltip,true)
    win = GtkWindow(label)

    @guarded (Cint(true)) function label_tooltip_cb(widgetptr,x,y,keyboard_mode,tooltip_ptr, user_data)

        tooltip = convert(Gtk.GtkTooltip, tooltip_ptr)
        text(tooltip,"Hello")

        return Cint(true)
    end
    signal_connect(label_tooltip_cb,label, "query-tooltip" , Cint, (Int,Int,Cint,Ptr{Gtk.GLib.GObject},), false)
    showall(win)
```
"""
function text(tooltip::GtkTooltip,text::String)
    ccall((:gtk_tooltip_set_text,libgtk),Void,(Ptr{Gtk.GObject},Ptr{UInt8}),tooltip,text)
end
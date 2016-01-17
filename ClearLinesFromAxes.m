function ClearLinesFromAxes(axisObj)
if ishandle(axisObj)
    handles2delete = get(axisObj,'Children');
    delete(handles2delete);
end
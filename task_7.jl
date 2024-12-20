#= Задача 8
Дано: Робот - рядом с горизонтальной перегородкой (под ней), бесконечно продолжающейся в обе стороны, в которой имеется проход шириной в одну клетку.
Результат: Робот - в клетке под проходом =#

include("roblib.jl")
    #=
        invers(side::HorizonSide)
        movements!(r::Robot,side::HorizonSide,num_steps::Int)
        get_num_steps_movements!(r::Robot, side::HorizonSide)
        movements!(r::Robot,side::HorizonSide)
        moves!(r::Robot,side::HorizonSide)
        find_border!(r::Robot,direction_to_border::HorizonSide, direction_of_movement::HorizonSide)
    =#

function robot_under_door!(r::Robot) 
    side = Ost
    search_door!(r,side)
end

function search_door!(r::Robot,side::HorizonSide) 
    i = 1
    while (isborder(r,Nord) == true)
    m = 0
            while (m != i)
                move!(r,side)
                m+=1
            end
            i+=1
            side = invers(side)
    end
end
function invers(side::HorizonSide)
    if side == Nord
        return Sud       # Если текущее направление - север, то возвращаем юг
    elseif side == Sud
        return Nord      # Если текущее направление - юг, то возвращаем север
    elseif side == Ost
        return West      # Если текущее направление - восток, то возвращаем запад
    elseif side == West
        return Ost       # Если текущее направление - запад, то возвращаем восток
    else
        error("Неправильное направление!")
    end
end

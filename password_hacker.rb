filename = ARGV[0].chomp
password = ARGV[1].chomp

datos = open('./'+filename).readlines

#Arreglo postfijos editable para añadir mas combinaciones
#ultimo elemento debe ser vacio
post = ['1', '2', '3', '']   

intentos = 0
encontrado = false

datos.map! { |elem| elem.chomp }

datos.each do |temp_dic|
    post.count.times do |i|
        # Habilitar linea para ver combinaciones
        # puts temp_dic
        if !(temp_dic === password)
            temp_dic += post[i]
            intentos += 1
        else
            encontrado = true
            break
        end
    end
end

if encontrado
    puts "\nEncontrado !!"
    puts "Total iteraciones = #{intentos}\n\n"
else
    puts "\n\nError 404 - Clave no encontrada"
    puts "Ampliar diccionario y/o combinaciones postfijos\n\n"
end
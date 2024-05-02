function error = error_global(y_exacta,y_aprox)

error = abs(abs(y_aprox) - abs(y_exacta));

end


This project is aimed on counting the dots with holes on the image. 
This is a single channel image. 
Problems met: 
1. With imfill function: this does not work with not strictly enclosed circles. 
2. With regionprop function: get a struct rather than vector, we need transform it to vector. 
                             too much area identified, too much noise, we need a method to avoid noise. 

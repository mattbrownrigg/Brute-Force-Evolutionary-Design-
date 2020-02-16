class Population_Creation {
  float fitness;
  char[] genes;

  
  Population_Creation(int size) {
    genes = new char[size];
    for(int i = 0; i< genes.length; i++) {
      genes[i] = (char) random(64, 90);
      if(genes[i] == (char) 64) {
        genes[i] = (char) 32; 
      }
    }
  }

  void fitness() {
    background(0);
    int score = 0;
    for (int i = 0; i < genes.length; i++) {
      if (genes[i] == test.charAt(i)) {
        score++;
      }
    }
    fitness = float(score)/test.length();
    fitness *= fitness * fitness;
    //fitness = round(fitness);
    println(new String (genes));
    println(" " + fitness + "%");
  }
  
  /*Population_Creation crossover(Population_Creation parent2, float mutationRate) {
    Population_Creation gen2;
    gen2 = new Population_Creation(genes.length);
    float comboA;
    float mutateC;
    mutateC = random(1);
    comboA = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if ( i < comboA) {
        gen2.genes[i] = parent2.genes[i];
      }
      if ( i > comboA) {
        gen2.genes[i] = genes[i];
      }
      if ( mutateC < mutationRate) {
        gen2.genes[i] = (char) random(64, 90); 
      }
    }
    return gen2;
  }*/
  
  Population_Creation crossover(Population_Creation parent2) {
    Population_Creation child = new Population_Creation(genes.length);
    
    int midpoint = int(random(genes.length));
    
    for (int i = 0; i < genes.length; i++) {
      if (i > midpoint) child.genes[i] = genes[i];
      else              child.genes[i] = parent2.genes[i];
    }
    return child;
  }
  
  void mutate(float mutationRate) {
    for( int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char) random(64, 90);
        if(genes[i] == (char) 64) {
          genes[i] = (char) 32; 
        }
      }
    }
  }
}

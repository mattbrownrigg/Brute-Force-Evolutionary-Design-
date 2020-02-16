Population_Creation[] population;
Population_Creation[] newgen;

String test = "TO BE OR NOT TO BE";

int PopNum = 150;

ArrayList<Population_Creation> matingPool;

int counter;

String texual;

void setup() {
  size(500, 500);
  population = new Population_Creation[PopNum]; 
  newgen = new Population_Creation[PopNum];
  
  for(int i=0; i < PopNum; i++) {
    population[i] = new Population_Creation(test.length());
  }
}

void draw() {
  count();
  background(0);
  
  matingPool = new ArrayList<Population_Creation>();
  
  calcF();
  
  newgen = new Population_Creation[PopNum];
  for(int i = 0;i < PopNum; i++) {
    Population_Creation parentA = select();
    Population_Creation parentB = select();
    //Population_Creation child = parentA.crossover(parentB, 0.01);
    Population_Creation child = parentA.crossover(parentB);
    child.mutate(0.01);
    newgen[i] = child;
    
    println(new String (population[i].genes));
    
  }
  population = newgen;
  //matingPool.clear();
  textSize(25);
  text(count(), 10, 25);
  textSize(18);
  text(calcF(), 175, 150);
}

String calcF() {
    for(int i = 0; i < PopNum; i++) {
      population[i].fitness();
      texual = new String (population[i].genes);
      if(population[i].fitness == 1) {
        println("Bingo You Have Done it Mr. LAD SASTRE MAN");
        println(i);
        stop();
        return texual;
      }
  }
  return texual;
}

int count() {
  counter++;
  return counter;
}

Population_Creation select() {
    /*Population_Creation Parent;
    float rn = random(1);
    float s = random(population.length);
    Parent = population[int(s)];
    
    while(rn > population[int(s)].fitness) {
      s = random(PopNum);
      Parent = population[int(s)];
      rn = random(1);
    }*/
    int randomSelection = int(random(population.length));
    Population_Creation Parent = population[randomSelection];
    while(random(1) > Parent.fitness)
    {
      randomSelection = int(random(population.length));
      Parent = population[randomSelection];
    }
    return Parent;
  }

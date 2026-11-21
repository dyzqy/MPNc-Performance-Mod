function createWound(inNumber)
{
   this["wound" + String(inNumber)] = attachMovie("madness_wound","wound" + String(inNumber),getNextHighestDepth());
}

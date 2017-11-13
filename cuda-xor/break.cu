#include <iostream>
#include <fstream>
using namespace std;

#define key_size 8
#include "beolvas.cu"
#include "breakf.cu"

int main(int argc, char const *argv[])
{
 
   //read
   string file_name = *(argv+1); 
   int text_size = getsize();
   char* text = new char[text_size];
   betext(text);

   //copy the text to the device
   char *d_text;
   cudaMalloc((void**)&d_text,text_size);
   cudaMemcpy(d_text,text,text_size,cudaMemcpyHostToDevice);

   //set the block/threads
   dim3 BlocksPerGrid(100,100,10);
   dim3 ThreadsPerBlock(10,10,10);

   _break<<<BlocksPerGrid,ThreadsPerBlock>>>(d_text,text_size);
    
   cudaFree(d_text);
   delete[] text;   
 return 0;
}
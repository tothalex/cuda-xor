__global__
 void _break(char *text,const int size)
 {
   
   char temp_key[key_size];
   temp_key[0] = blockIdx.x/10 + 48;
   temp_key[1] = blockIdx.x%10 + 48;
   temp_key[2] = blockIdx.y/10 + 48;
   temp_key[3] = blockIdx.y%10 + 48;
   temp_key[4] = blockIdx.z + 48;
   temp_key[5] = threadIdx.x + 48;
   temp_key[6] = threadIdx.y + 48;
   temp_key[7] = threadIdx.z + 48;

   for(int i = 0; i < size; i++)
    {
        switch(text[i] ^ temp_key[i % key_size])
        {
        case '|':
        case '~':
        case '^':
        case '*':
        case '+':
        case '_':
        case '{':
        case '}':
        case '\\':
        case '#':
            return;
        }
    }

    printf("%c%c%c%c%c%c%c%c\n",temp_key[0],temp_key[1],temp_key[2],temp_key[3],temp_key[4]
                                 ,temp_key[5],temp_key[6],temp_key[7]);




 }
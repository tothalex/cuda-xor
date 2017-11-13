
  string befile(string betext)
   {
   	ifstream in("betext");
    string s((istreambuf_iterator<char>(in)), istreambuf_iterator<char>());

    return s;
   }


  int getsize()
  {
    
    string text = befile(file_name);
    int size = text.size();

    return size;
  }


  void betext(char* text)
  {
    
    int size = getsize();
    string s = befile();

    strcpy(text,s.c_str());
  }
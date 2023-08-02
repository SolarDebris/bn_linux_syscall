#include <cstdio>
#include <cinttypes>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>

//#include "binaryninjaapi.h"

//using namespace BinaryNinja;
using namespace std;

struct SyscallInfo {
    int number;
    string name;
    int numParams;
    vector<string> params;
};

vector<SyscallInfo> parseCSV(const string &filename){
    vector<SyscallInfo> syscallInfo;

    ifstream file(filename);
    if (!file){
        cerr << "Failed to open file: " << filename << endl;
    }

    string line;
    while (getline(file, line, '\n')){
        istringstream iss(line);
        string field;
        vector<string> fields;
        while (getline(iss, field, ',')){
            fields.push_back(field);
        }

        if (fields.size() >= 3){
            int number = stoi(fields[0]);
            string name = fields[1];
            int numParams = stoi(fields[2]);

            vector<string> params;
            for (size_t i = 3; i < fields.size(); ++i){
                params.push_back(fields[i]);
            }

            syscallInfo.push_back({number, name, numParams, params});

        }
    }

    file.close();
    return syscallInfo;

}


//static void parse_syscall(void){


//}


int main(int argc, char *argv[]){
    if (argc != 2){
        fprintf(stderr, "Expected input filename\n");
        return 1;
    }

    vector<SyscallInfo> data = parseCSV("linux_sys");

    for (const auto& entry : data) {
        cout << "Number: " << entry.number << endl;
        cout << "Name: " << entry.name << endl;
        cout << "Number of Parameters: " << entry.numParams << endl;
        cout << "Parameters: ";
        for (const auto& param : entry.params) {
            cout << param << " ";
        }
        cout << endl << endl;
    }

    return 0;
}



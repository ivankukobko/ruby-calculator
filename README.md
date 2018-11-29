# Ruby calculator 

This is an implementation of reverse polish notation (RPN) calculator with Ruby for (primarily) command-line usage. To run program, just type `./ruby-calculator.rb` in your terminal. Make sure you have **Ruby** installed.

## Usage

```
$ ./ruby-calculator.rb
0
> 2 [Enter]
0, 2.0
> 2
2.0, 2.0
> * [Enter]
4.0
> 1 [Enter]
4.0 1.0
> - [Enter]
3.0
> 41 1 + [Enter]
42.0
```

Type `q` command to quit and `c` to clear previous results and input


## Limitations

Currently it converts all numbers to Float


## Testing

If you are interested, how this stuff works, you can check out tests in `test/` folder and run them if needed:

```
$ rake test
```

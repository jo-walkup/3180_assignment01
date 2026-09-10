% trying to record the history of fzero??
function [x_root, input_list] = input_recorder_example(fun, x0)
    %Create an instance of the input_recorder
    my_recorder = input_recorder();
    %Use input_recorder to generate a version of the test function
    %that records the input after every iteration
    %Since test_fun is defined using function keyword
    f_record = my_recorder.generate_recorder_fun(fun);
    %If test_fun is defined as an anonymous function:
    %f_record = my_recorder.generate_recorder_fun(test_function);
    %initialize guesses for fzero
    % x0 = 2.7;
    %Call your root finder using the recording function:
    x_root = fzero(f_record,x0);
    %See what input values were used when f_record was called:
    input_list = my_recorder.get_input_list();
    %at this point, input_list will be populated with the input arguments
    %that fzero used to call test_function
    %plot the inputs
    %semilogy(1:length(input_list),abs(input_list-x_root),'ko','markerfacecolor','k');
    %reset input_list for the next test
    my_recorder.clear_input_list();
end
function percentage = comparison_percentage(max_ref, max_val)
percentage = 1:1:length(max_ref);
for i = 1:length(max_ref)
    percentage(i) = max_val(i)/max_ref(i);
end
package main

import (
	"fmt"
	"testing"
)

func TestCase1(t *testing.T) {
	result := FindFrequency([]string{"-1", "+1"})
	if 0 != result {
		t.Error(fmt.Sprintf("expected 0, but got %d", result))
	}
}
func TestCase2(t *testing.T) {
	result := FindFrequency([]string{"+1", "+1", "-2"})
	if 0 != result {
		t.Error(fmt.Sprintf("expected 0, but got %d", result))
	}
}
func TestCase3(t *testing.T) {
	result := FindFrequency([]string{"-1", "-2", "-3"})
	if -6 != result {
		t.Error(fmt.Sprintf("expected -6, but got %d", result))
	}
}

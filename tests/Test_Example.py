import pytest


class Test_Example:

    def test_1(self):
        assert 1 == 1
        return

    def test_2(self):
        assert 1 == 2
        return

    # skip this test

    @pytest.mark.skip(reason="no way of currently testing this")
    def test_3(self):
        assert 1 == 2
        return

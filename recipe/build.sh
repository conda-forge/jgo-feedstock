"${PYTHON}" -m pip install . -vv --no-deps --no-build-isolation

# Note: noarch packages are built only on Linux, so the Windows activation
# scripts must be installed here too; bld.bat would never run.
for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    for EXT in sh bat
    do
        cp "${RECIPE_DIR}/${CHANGE}.${EXT}" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.${EXT}"
    done
done

# Explore: explore_0248
# Auto-generated LookML Explore File

include: "/views/domain_45/view_00745.view.lkml"
include: "/views/domain_47/view_00747.view.lkml"
include: "/views/domain_48/view_00748.view.lkml"
include: "/views/domain_49/view_00749.view.lkml"

explore: explore_0248 {
  label: "Explore Explore 0248"
  description: "Comprehensive analytics explore joining base view_00745 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00745
  
  always_filter: {
    filters: [view_00745.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00745.created_at_date: "7 days"]
    unless: [view_00745.id, view_00745.status]
  }

  join: view_00747 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00745.user_id} = ${view_00747.id} ;;
    required_joins: []
  }

  join: view_00748 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00745.account_id} = ${view_00748.account_id} ;;
    required_joins: [view_00747]
  }

  join: view_00749 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00745.category} = ${view_00749.category} ;;
  }

  access_filter: {
    field: view_00745.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00745.is_deleted} = false ;;
}

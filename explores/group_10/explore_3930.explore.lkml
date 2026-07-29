# Explore: explore_3930
# Auto-generated LookML Explore File

include: "/views/domain_41/view_11791.view.lkml"
include: "/views/domain_43/view_11793.view.lkml"
include: "/views/domain_44/view_11794.view.lkml"
include: "/views/domain_45/view_11795.view.lkml"

explore: explore_3930 {
  label: "Explore Explore 3930"
  description: "Comprehensive analytics explore joining base view_11791 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11791
  
  always_filter: {
    filters: [view_11791.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11791.created_at_date: "7 days"]
    unless: [view_11791.id, view_11791.status]
  }

  join: view_11793 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11791.user_id} = ${view_11793.id} ;;
    required_joins: []
  }

  join: view_11794 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11791.account_id} = ${view_11794.account_id} ;;
    required_joins: [view_11793]
  }

  join: view_11795 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11791.category} = ${view_11795.category} ;;
  }

  access_filter: {
    field: view_11791.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11791.is_deleted} = false ;;
}

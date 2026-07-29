# Explore: explore_2286
# Auto-generated LookML Explore File

include: "/views/domain_09/view_06859.view.lkml"
include: "/views/domain_11/view_06861.view.lkml"
include: "/views/domain_12/view_06862.view.lkml"
include: "/views/domain_13/view_06863.view.lkml"

explore: explore_2286 {
  label: "Explore Explore 2286"
  description: "Comprehensive analytics explore joining base view_06859 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06859
  
  always_filter: {
    filters: [view_06859.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06859.created_at_date: "7 days"]
    unless: [view_06859.id, view_06859.status]
  }

  join: view_06861 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06859.user_id} = ${view_06861.id} ;;
    required_joins: []
  }

  join: view_06862 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06859.account_id} = ${view_06862.account_id} ;;
    required_joins: [view_06861]
  }

  join: view_06863 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06859.category} = ${view_06863.category} ;;
  }

  access_filter: {
    field: view_06859.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06859.is_deleted} = false ;;
}

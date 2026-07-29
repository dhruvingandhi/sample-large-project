# Explore: explore_3958
# Auto-generated LookML Explore File

include: "/views/domain_25/view_11875.view.lkml"
include: "/views/domain_27/view_11877.view.lkml"
include: "/views/domain_28/view_11878.view.lkml"
include: "/views/domain_29/view_11879.view.lkml"

explore: explore_3958 {
  label: "Explore Explore 3958"
  description: "Comprehensive analytics explore joining base view_11875 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11875
  
  always_filter: {
    filters: [view_11875.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11875.created_at_date: "7 days"]
    unless: [view_11875.id, view_11875.status]
  }

  join: view_11877 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11875.user_id} = ${view_11877.id} ;;
    required_joins: []
  }

  join: view_11878 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11875.account_id} = ${view_11878.account_id} ;;
    required_joins: [view_11877]
  }

  join: view_11879 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11875.category} = ${view_11879.category} ;;
  }

  access_filter: {
    field: view_11875.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11875.is_deleted} = false ;;
}

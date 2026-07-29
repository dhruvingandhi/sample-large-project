# Explore: explore_0608
# Auto-generated LookML Explore File

include: "/views/domain_25/view_01825.view.lkml"
include: "/views/domain_27/view_01827.view.lkml"
include: "/views/domain_28/view_01828.view.lkml"
include: "/views/domain_29/view_01829.view.lkml"

explore: explore_0608 {
  label: "Explore Explore 0608"
  description: "Comprehensive analytics explore joining base view_01825 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01825
  
  always_filter: {
    filters: [view_01825.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01825.created_at_date: "7 days"]
    unless: [view_01825.id, view_01825.status]
  }

  join: view_01827 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01825.user_id} = ${view_01827.id} ;;
    required_joins: []
  }

  join: view_01828 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01825.account_id} = ${view_01828.account_id} ;;
    required_joins: [view_01827]
  }

  join: view_01829 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01825.category} = ${view_01829.category} ;;
  }

  access_filter: {
    field: view_01825.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01825.is_deleted} = false ;;
}

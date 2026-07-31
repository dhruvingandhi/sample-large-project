# Update for 2000 file diff target
# Explore: explore_3799
# Auto-generated LookML Explore File

include: "/views/domain_48/view_11398.view.lkml"
include: "/views/domain_50/view_11400.view.lkml"
include: "/views/domain_01/view_11401.view.lkml"
include: "/views/domain_02/view_11402.view.lkml"

explore: explore_3799 {
  label: "Explore Explore 3799"
  description: "Comprehensive analytics explore joining base view_11398 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11398
  
  always_filter: {
    filters: [view_11398.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11398.created_at_date: "7 days"]
    unless: [view_11398.id, view_11398.status]
  }

  join: view_11400 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11398.user_id} = ${view_11400.id} ;;
    required_joins: []
  }

  join: view_11401 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11398.account_id} = ${view_11401.account_id} ;;
    required_joins: [view_11400]
  }

  join: view_11402 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11398.category} = ${view_11402.category} ;;
  }

  access_filter: {
    field: view_11398.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11398.is_deleted} = false ;;
}

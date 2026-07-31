# Update for 2000 file diff target
# Explore: explore_2440
# Auto-generated LookML Explore File

include: "/views/domain_21/view_07321.view.lkml"
include: "/views/domain_23/view_07323.view.lkml"
include: "/views/domain_24/view_07324.view.lkml"
include: "/views/domain_25/view_07325.view.lkml"

explore: explore_2440 {
  label: "Explore Explore 2440"
  description: "Comprehensive analytics explore joining base view_07321 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07321
  
  always_filter: {
    filters: [view_07321.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07321.created_at_date: "7 days"]
    unless: [view_07321.id, view_07321.status]
  }

  join: view_07323 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07321.user_id} = ${view_07323.id} ;;
    required_joins: []
  }

  join: view_07324 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07321.account_id} = ${view_07324.account_id} ;;
    required_joins: [view_07323]
  }

  join: view_07325 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07321.category} = ${view_07325.category} ;;
  }

  access_filter: {
    field: view_07321.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07321.is_deleted} = false ;;
}

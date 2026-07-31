# Update for 2000 file diff target
# Explore: explore_2699
# Auto-generated LookML Explore File

include: "/views/domain_48/view_08098.view.lkml"
include: "/views/domain_50/view_08100.view.lkml"
include: "/views/domain_01/view_08101.view.lkml"
include: "/views/domain_02/view_08102.view.lkml"

explore: explore_2699 {
  label: "Explore Explore 2699"
  description: "Comprehensive analytics explore joining base view_08098 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08098
  
  always_filter: {
    filters: [view_08098.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08098.created_at_date: "7 days"]
    unless: [view_08098.id, view_08098.status]
  }

  join: view_08100 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08098.user_id} = ${view_08100.id} ;;
    required_joins: []
  }

  join: view_08101 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08098.account_id} = ${view_08101.account_id} ;;
    required_joins: [view_08100]
  }

  join: view_08102 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08098.category} = ${view_08102.category} ;;
  }

  access_filter: {
    field: view_08098.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08098.is_deleted} = false ;;
}

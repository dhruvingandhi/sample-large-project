# Update for 500 file diff target
# Explore: explore_0462
# Auto-generated LookML Explore File

include: "/views/domain_37/view_01387.view.lkml"
include: "/views/domain_39/view_01389.view.lkml"
include: "/views/domain_40/view_01390.view.lkml"
include: "/views/domain_41/view_01391.view.lkml"

explore: explore_0462 {
  label: "Explore Explore 0462"
  description: "Comprehensive analytics explore joining base view_01387 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01387
  
  always_filter: {
    filters: [view_01387.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01387.created_at_date: "7 days"]
    unless: [view_01387.id, view_01387.status]
  }

  join: view_01389 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01387.user_id} = ${view_01389.id} ;;
    required_joins: []
  }

  join: view_01390 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01387.account_id} = ${view_01390.account_id} ;;
    required_joins: [view_01389]
  }

  join: view_01391 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01387.category} = ${view_01391.category} ;;
  }

  access_filter: {
    field: view_01387.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01387.is_deleted} = false ;;
}

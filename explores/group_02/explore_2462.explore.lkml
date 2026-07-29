# Explore: explore_2462
# Auto-generated LookML Explore File

include: "/views/domain_37/view_07387.view.lkml"
include: "/views/domain_39/view_07389.view.lkml"
include: "/views/domain_40/view_07390.view.lkml"
include: "/views/domain_41/view_07391.view.lkml"

explore: explore_2462 {
  label: "Explore Explore 2462"
  description: "Comprehensive analytics explore joining base view_07387 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07387
  
  always_filter: {
    filters: [view_07387.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07387.created_at_date: "7 days"]
    unless: [view_07387.id, view_07387.status]
  }

  join: view_07389 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07387.user_id} = ${view_07389.id} ;;
    required_joins: []
  }

  join: view_07390 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07387.account_id} = ${view_07390.account_id} ;;
    required_joins: [view_07389]
  }

  join: view_07391 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07387.category} = ${view_07391.category} ;;
  }

  access_filter: {
    field: view_07387.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07387.is_deleted} = false ;;
}

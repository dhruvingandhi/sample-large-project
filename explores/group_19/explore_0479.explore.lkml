# Update for 2000 file diff target
# Explore: explore_0479
# Auto-generated LookML Explore File

include: "/views/domain_38/view_01438.view.lkml"
include: "/views/domain_40/view_01440.view.lkml"
include: "/views/domain_41/view_01441.view.lkml"
include: "/views/domain_42/view_01442.view.lkml"

explore: explore_0479 {
  label: "Explore Explore 0479"
  description: "Comprehensive analytics explore joining base view_01438 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01438
  
  always_filter: {
    filters: [view_01438.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01438.created_at_date: "7 days"]
    unless: [view_01438.id, view_01438.status]
  }

  join: view_01440 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01438.user_id} = ${view_01440.id} ;;
    required_joins: []
  }

  join: view_01441 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01438.account_id} = ${view_01441.account_id} ;;
    required_joins: [view_01440]
  }

  join: view_01442 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01438.category} = ${view_01442.category} ;;
  }

  access_filter: {
    field: view_01438.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01438.is_deleted} = false ;;
}

# Explore: explore_3479
# Auto-generated LookML Explore File

include: "/views/domain_38/view_10438.view.lkml"
include: "/views/domain_40/view_10440.view.lkml"
include: "/views/domain_41/view_10441.view.lkml"
include: "/views/domain_42/view_10442.view.lkml"

explore: explore_3479 {
  label: "Explore Explore 3479"
  description: "Comprehensive analytics explore joining base view_10438 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10438
  
  always_filter: {
    filters: [view_10438.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10438.created_at_date: "7 days"]
    unless: [view_10438.id, view_10438.status]
  }

  join: view_10440 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10438.user_id} = ${view_10440.id} ;;
    required_joins: []
  }

  join: view_10441 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10438.account_id} = ${view_10441.account_id} ;;
    required_joins: [view_10440]
  }

  join: view_10442 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10438.category} = ${view_10442.category} ;;
  }

  access_filter: {
    field: view_10438.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10438.is_deleted} = false ;;
}

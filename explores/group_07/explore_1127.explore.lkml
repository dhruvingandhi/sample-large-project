# Explore: explore_1127
# Auto-generated LookML Explore File

include: "/views/domain_32/view_03382.view.lkml"
include: "/views/domain_34/view_03384.view.lkml"
include: "/views/domain_35/view_03385.view.lkml"
include: "/views/domain_36/view_03386.view.lkml"

explore: explore_1127 {
  label: "Explore Explore 1127"
  description: "Comprehensive analytics explore joining base view_03382 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03382
  
  always_filter: {
    filters: [view_03382.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03382.created_at_date: "7 days"]
    unless: [view_03382.id, view_03382.status]
  }

  join: view_03384 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03382.user_id} = ${view_03384.id} ;;
    required_joins: []
  }

  join: view_03385 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03382.account_id} = ${view_03385.account_id} ;;
    required_joins: [view_03384]
  }

  join: view_03386 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03382.category} = ${view_03386.category} ;;
  }

  access_filter: {
    field: view_03382.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03382.is_deleted} = false ;;
}

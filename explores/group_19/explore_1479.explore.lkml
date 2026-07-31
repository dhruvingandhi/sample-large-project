# Update for 2000 file diff target
# Explore: explore_1479
# Auto-generated LookML Explore File

include: "/views/domain_38/view_04438.view.lkml"
include: "/views/domain_40/view_04440.view.lkml"
include: "/views/domain_41/view_04441.view.lkml"
include: "/views/domain_42/view_04442.view.lkml"

explore: explore_1479 {
  label: "Explore Explore 1479"
  description: "Comprehensive analytics explore joining base view_04438 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04438
  
  always_filter: {
    filters: [view_04438.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04438.created_at_date: "7 days"]
    unless: [view_04438.id, view_04438.status]
  }

  join: view_04440 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04438.user_id} = ${view_04440.id} ;;
    required_joins: []
  }

  join: view_04441 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04438.account_id} = ${view_04441.account_id} ;;
    required_joins: [view_04440]
  }

  join: view_04442 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04438.category} = ${view_04442.category} ;;
  }

  access_filter: {
    field: view_04438.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04438.is_deleted} = false ;;
}

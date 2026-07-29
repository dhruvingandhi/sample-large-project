# Explore: explore_0612
# Auto-generated LookML Explore File

include: "/views/domain_37/view_01837.view.lkml"
include: "/views/domain_39/view_01839.view.lkml"
include: "/views/domain_40/view_01840.view.lkml"
include: "/views/domain_41/view_01841.view.lkml"

explore: explore_0612 {
  label: "Explore Explore 0612"
  description: "Comprehensive analytics explore joining base view_01837 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01837
  
  always_filter: {
    filters: [view_01837.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01837.created_at_date: "7 days"]
    unless: [view_01837.id, view_01837.status]
  }

  join: view_01839 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01837.user_id} = ${view_01839.id} ;;
    required_joins: []
  }

  join: view_01840 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01837.account_id} = ${view_01840.account_id} ;;
    required_joins: [view_01839]
  }

  join: view_01841 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01837.category} = ${view_01841.category} ;;
  }

  access_filter: {
    field: view_01837.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01837.is_deleted} = false ;;
}

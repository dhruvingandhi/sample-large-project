# Explore: explore_1543
# Auto-generated LookML Explore File

include: "/views/domain_30/view_04630.view.lkml"
include: "/views/domain_32/view_04632.view.lkml"
include: "/views/domain_33/view_04633.view.lkml"
include: "/views/domain_34/view_04634.view.lkml"

explore: explore_1543 {
  label: "Explore Explore 1543"
  description: "Comprehensive analytics explore joining base view_04630 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04630
  
  always_filter: {
    filters: [view_04630.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04630.created_at_date: "7 days"]
    unless: [view_04630.id, view_04630.status]
  }

  join: view_04632 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04630.user_id} = ${view_04632.id} ;;
    required_joins: []
  }

  join: view_04633 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04630.account_id} = ${view_04633.account_id} ;;
    required_joins: [view_04632]
  }

  join: view_04634 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04630.category} = ${view_04634.category} ;;
  }

  access_filter: {
    field: view_04630.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04630.is_deleted} = false ;;
}

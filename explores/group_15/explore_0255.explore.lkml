# Explore: explore_0255
# Auto-generated LookML Explore File

include: "/views/domain_16/view_00766.view.lkml"
include: "/views/domain_18/view_00768.view.lkml"
include: "/views/domain_19/view_00769.view.lkml"
include: "/views/domain_20/view_00770.view.lkml"

explore: explore_0255 {
  label: "Explore Explore 0255"
  description: "Comprehensive analytics explore joining base view_00766 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00766
  
  always_filter: {
    filters: [view_00766.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00766.created_at_date: "7 days"]
    unless: [view_00766.id, view_00766.status]
  }

  join: view_00768 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00766.user_id} = ${view_00768.id} ;;
    required_joins: []
  }

  join: view_00769 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00766.account_id} = ${view_00769.account_id} ;;
    required_joins: [view_00768]
  }

  join: view_00770 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00766.category} = ${view_00770.category} ;;
  }

  access_filter: {
    field: view_00766.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00766.is_deleted} = false ;;
}

# Update for 2000 file diff target
# Explore: explore_1617
# Auto-generated LookML Explore File

include: "/views/domain_02/view_04852.view.lkml"
include: "/views/domain_04/view_04854.view.lkml"
include: "/views/domain_05/view_04855.view.lkml"
include: "/views/domain_06/view_04856.view.lkml"

explore: explore_1617 {
  label: "Explore Explore 1617"
  description: "Comprehensive analytics explore joining base view_04852 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04852
  
  always_filter: {
    filters: [view_04852.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04852.created_at_date: "7 days"]
    unless: [view_04852.id, view_04852.status]
  }

  join: view_04854 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04852.user_id} = ${view_04854.id} ;;
    required_joins: []
  }

  join: view_04855 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04852.account_id} = ${view_04855.account_id} ;;
    required_joins: [view_04854]
  }

  join: view_04856 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04852.category} = ${view_04856.category} ;;
  }

  access_filter: {
    field: view_04852.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04852.is_deleted} = false ;;
}

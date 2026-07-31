# Update for 2000 file diff target
# Explore: explore_1719
# Auto-generated LookML Explore File

include: "/views/domain_08/view_05158.view.lkml"
include: "/views/domain_10/view_05160.view.lkml"
include: "/views/domain_11/view_05161.view.lkml"
include: "/views/domain_12/view_05162.view.lkml"

explore: explore_1719 {
  label: "Explore Explore 1719"
  description: "Comprehensive analytics explore joining base view_05158 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05158
  
  always_filter: {
    filters: [view_05158.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05158.created_at_date: "7 days"]
    unless: [view_05158.id, view_05158.status]
  }

  join: view_05160 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05158.user_id} = ${view_05160.id} ;;
    required_joins: []
  }

  join: view_05161 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05158.account_id} = ${view_05161.account_id} ;;
    required_joins: [view_05160]
  }

  join: view_05162 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05158.category} = ${view_05162.category} ;;
  }

  access_filter: {
    field: view_05158.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05158.is_deleted} = false ;;
}

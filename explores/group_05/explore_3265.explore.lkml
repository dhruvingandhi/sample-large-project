# Explore: explore_3265
# Auto-generated LookML Explore File

include: "/views/domain_46/view_09796.view.lkml"
include: "/views/domain_48/view_09798.view.lkml"
include: "/views/domain_49/view_09799.view.lkml"
include: "/views/domain_50/view_09800.view.lkml"

explore: explore_3265 {
  label: "Explore Explore 3265"
  description: "Comprehensive analytics explore joining base view_09796 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09796
  
  always_filter: {
    filters: [view_09796.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09796.created_at_date: "7 days"]
    unless: [view_09796.id, view_09796.status]
  }

  join: view_09798 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09796.user_id} = ${view_09798.id} ;;
    required_joins: []
  }

  join: view_09799 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09796.account_id} = ${view_09799.account_id} ;;
    required_joins: [view_09798]
  }

  join: view_09800 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09796.category} = ${view_09800.category} ;;
  }

  access_filter: {
    field: view_09796.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09796.is_deleted} = false ;;
}

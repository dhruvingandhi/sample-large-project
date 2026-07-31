# Antigravity modified: branch dg-3
# Explore: explore_0265
# Auto-generated LookML Explore File

include: "/views/domain_46/view_00796.view.lkml"
include: "/views/domain_48/view_00798.view.lkml"
include: "/views/domain_49/view_00799.view.lkml"
include: "/views/domain_50/view_00800.view.lkml"

explore: explore_0265 {
  label: "Explore Explore 0265"
  description: "Comprehensive analytics explore joining base view_00796 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00796
  
  always_filter: {
    filters: [view_00796.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00796.created_at_date: "7 days"]
    unless: [view_00796.id, view_00796.status]
  }

  join: view_00798 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00796.user_id} = ${view_00798.id} ;;
    required_joins: []
  }

  join: view_00799 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00796.account_id} = ${view_00799.account_id} ;;
    required_joins: [view_00798]
  }

  join: view_00800 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00796.category} = ${view_00800.category} ;;
  }

  access_filter: {
    field: view_00796.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00796.is_deleted} = false ;;
}

# Antigravity modified: branch dg-3
# Explore: explore_1265
# Auto-generated LookML Explore File

include: "/views/domain_46/view_03796.view.lkml"
include: "/views/domain_48/view_03798.view.lkml"
include: "/views/domain_49/view_03799.view.lkml"
include: "/views/domain_50/view_03800.view.lkml"

explore: explore_1265 {
  label: "Explore Explore 1265"
  description: "Comprehensive analytics explore joining base view_03796 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03796
  
  always_filter: {
    filters: [view_03796.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03796.created_at_date: "7 days"]
    unless: [view_03796.id, view_03796.status]
  }

  join: view_03798 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03796.user_id} = ${view_03798.id} ;;
    required_joins: []
  }

  join: view_03799 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03796.account_id} = ${view_03799.account_id} ;;
    required_joins: [view_03798]
  }

  join: view_03800 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03796.category} = ${view_03800.category} ;;
  }

  access_filter: {
    field: view_03796.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03796.is_deleted} = false ;;
}

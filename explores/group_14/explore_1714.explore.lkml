# Explore: explore_1714
# Auto-generated LookML Explore File

include: "/views/domain_43/view_05143.view.lkml"
include: "/views/domain_45/view_05145.view.lkml"
include: "/views/domain_46/view_05146.view.lkml"
include: "/views/domain_47/view_05147.view.lkml"

explore: explore_1714 {
  label: "Explore Explore 1714"
  description: "Comprehensive analytics explore joining base view_05143 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05143
  
  always_filter: {
    filters: [view_05143.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05143.created_at_date: "7 days"]
    unless: [view_05143.id, view_05143.status]
  }

  join: view_05145 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05143.user_id} = ${view_05145.id} ;;
    required_joins: []
  }

  join: view_05146 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05143.account_id} = ${view_05146.account_id} ;;
    required_joins: [view_05145]
  }

  join: view_05147 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05143.category} = ${view_05147.category} ;;
  }

  access_filter: {
    field: view_05143.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05143.is_deleted} = false ;;
}

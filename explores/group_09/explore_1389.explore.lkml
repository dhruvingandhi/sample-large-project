# Explore: explore_1389
# Auto-generated LookML Explore File

include: "/views/domain_18/view_04168.view.lkml"
include: "/views/domain_20/view_04170.view.lkml"
include: "/views/domain_21/view_04171.view.lkml"
include: "/views/domain_22/view_04172.view.lkml"

explore: explore_1389 {
  label: "Explore Explore 1389"
  description: "Comprehensive analytics explore joining base view_04168 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04168
  
  always_filter: {
    filters: [view_04168.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04168.created_at_date: "7 days"]
    unless: [view_04168.id, view_04168.status]
  }

  join: view_04170 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04168.user_id} = ${view_04170.id} ;;
    required_joins: []
  }

  join: view_04171 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04168.account_id} = ${view_04171.account_id} ;;
    required_joins: [view_04170]
  }

  join: view_04172 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04168.category} = ${view_04172.category} ;;
  }

  access_filter: {
    field: view_04168.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04168.is_deleted} = false ;;
}

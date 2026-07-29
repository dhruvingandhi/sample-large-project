# Explore: explore_2389
# Auto-generated LookML Explore File

include: "/views/domain_18/view_07168.view.lkml"
include: "/views/domain_20/view_07170.view.lkml"
include: "/views/domain_21/view_07171.view.lkml"
include: "/views/domain_22/view_07172.view.lkml"

explore: explore_2389 {
  label: "Explore Explore 2389"
  description: "Comprehensive analytics explore joining base view_07168 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07168
  
  always_filter: {
    filters: [view_07168.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07168.created_at_date: "7 days"]
    unless: [view_07168.id, view_07168.status]
  }

  join: view_07170 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07168.user_id} = ${view_07170.id} ;;
    required_joins: []
  }

  join: view_07171 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07168.account_id} = ${view_07171.account_id} ;;
    required_joins: [view_07170]
  }

  join: view_07172 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07168.category} = ${view_07172.category} ;;
  }

  access_filter: {
    field: view_07168.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07168.is_deleted} = false ;;
}

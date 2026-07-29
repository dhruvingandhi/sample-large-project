# Explore: explore_3389
# Auto-generated LookML Explore File

include: "/views/domain_18/view_10168.view.lkml"
include: "/views/domain_20/view_10170.view.lkml"
include: "/views/domain_21/view_10171.view.lkml"
include: "/views/domain_22/view_10172.view.lkml"

explore: explore_3389 {
  label: "Explore Explore 3389"
  description: "Comprehensive analytics explore joining base view_10168 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10168
  
  always_filter: {
    filters: [view_10168.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10168.created_at_date: "7 days"]
    unless: [view_10168.id, view_10168.status]
  }

  join: view_10170 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10168.user_id} = ${view_10170.id} ;;
    required_joins: []
  }

  join: view_10171 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10168.account_id} = ${view_10171.account_id} ;;
    required_joins: [view_10170]
  }

  join: view_10172 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10168.category} = ${view_10172.category} ;;
  }

  access_filter: {
    field: view_10168.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10168.is_deleted} = false ;;
}

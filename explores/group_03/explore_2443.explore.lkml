# Explore: explore_2443
# Auto-generated LookML Explore File

include: "/views/domain_30/view_07330.view.lkml"
include: "/views/domain_32/view_07332.view.lkml"
include: "/views/domain_33/view_07333.view.lkml"
include: "/views/domain_34/view_07334.view.lkml"

explore: explore_2443 {
  label: "Explore Explore 2443"
  description: "Comprehensive analytics explore joining base view_07330 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07330
  
  always_filter: {
    filters: [view_07330.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07330.created_at_date: "7 days"]
    unless: [view_07330.id, view_07330.status]
  }

  join: view_07332 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07330.user_id} = ${view_07332.id} ;;
    required_joins: []
  }

  join: view_07333 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07330.account_id} = ${view_07333.account_id} ;;
    required_joins: [view_07332]
  }

  join: view_07334 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07330.category} = ${view_07334.category} ;;
  }

  access_filter: {
    field: view_07330.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07330.is_deleted} = false ;;
}

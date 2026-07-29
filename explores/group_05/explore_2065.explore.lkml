# Explore: explore_2065
# Auto-generated LookML Explore File

include: "/views/domain_46/view_06196.view.lkml"
include: "/views/domain_48/view_06198.view.lkml"
include: "/views/domain_49/view_06199.view.lkml"
include: "/views/domain_50/view_06200.view.lkml"

explore: explore_2065 {
  label: "Explore Explore 2065"
  description: "Comprehensive analytics explore joining base view_06196 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06196
  
  always_filter: {
    filters: [view_06196.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06196.created_at_date: "7 days"]
    unless: [view_06196.id, view_06196.status]
  }

  join: view_06198 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06196.user_id} = ${view_06198.id} ;;
    required_joins: []
  }

  join: view_06199 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06196.account_id} = ${view_06199.account_id} ;;
    required_joins: [view_06198]
  }

  join: view_06200 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06196.category} = ${view_06200.category} ;;
  }

  access_filter: {
    field: view_06196.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06196.is_deleted} = false ;;
}

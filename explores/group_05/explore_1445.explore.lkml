# Explore: explore_1445
# Auto-generated LookML Explore File

include: "/views/domain_36/view_04336.view.lkml"
include: "/views/domain_38/view_04338.view.lkml"
include: "/views/domain_39/view_04339.view.lkml"
include: "/views/domain_40/view_04340.view.lkml"

explore: explore_1445 {
  label: "Explore Explore 1445"
  description: "Comprehensive analytics explore joining base view_04336 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04336
  
  always_filter: {
    filters: [view_04336.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04336.created_at_date: "7 days"]
    unless: [view_04336.id, view_04336.status]
  }

  join: view_04338 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04336.user_id} = ${view_04338.id} ;;
    required_joins: []
  }

  join: view_04339 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04336.account_id} = ${view_04339.account_id} ;;
    required_joins: [view_04338]
  }

  join: view_04340 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04336.category} = ${view_04340.category} ;;
  }

  access_filter: {
    field: view_04336.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04336.is_deleted} = false ;;
}

# Explore: explore_2792
# Auto-generated LookML Explore File

include: "/views/domain_27/view_08377.view.lkml"
include: "/views/domain_29/view_08379.view.lkml"
include: "/views/domain_30/view_08380.view.lkml"
include: "/views/domain_31/view_08381.view.lkml"

explore: explore_2792 {
  label: "Explore Explore 2792"
  description: "Comprehensive analytics explore joining base view_08377 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08377
  
  always_filter: {
    filters: [view_08377.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08377.created_at_date: "7 days"]
    unless: [view_08377.id, view_08377.status]
  }

  join: view_08379 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08377.user_id} = ${view_08379.id} ;;
    required_joins: []
  }

  join: view_08380 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08377.account_id} = ${view_08380.account_id} ;;
    required_joins: [view_08379]
  }

  join: view_08381 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08377.category} = ${view_08381.category} ;;
  }

  access_filter: {
    field: view_08377.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08377.is_deleted} = false ;;
}

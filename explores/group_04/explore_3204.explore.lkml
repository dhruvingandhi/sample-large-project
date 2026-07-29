# Explore: explore_3204
# Auto-generated LookML Explore File

include: "/views/domain_13/view_09613.view.lkml"
include: "/views/domain_15/view_09615.view.lkml"
include: "/views/domain_16/view_09616.view.lkml"
include: "/views/domain_17/view_09617.view.lkml"

explore: explore_3204 {
  label: "Explore Explore 3204"
  description: "Comprehensive analytics explore joining base view_09613 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09613
  
  always_filter: {
    filters: [view_09613.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09613.created_at_date: "7 days"]
    unless: [view_09613.id, view_09613.status]
  }

  join: view_09615 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09613.user_id} = ${view_09615.id} ;;
    required_joins: []
  }

  join: view_09616 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09613.account_id} = ${view_09616.account_id} ;;
    required_joins: [view_09615]
  }

  join: view_09617 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09613.category} = ${view_09617.category} ;;
  }

  access_filter: {
    field: view_09613.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09613.is_deleted} = false ;;
}

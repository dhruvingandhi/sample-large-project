# Explore: explore_0514
# Auto-generated LookML Explore File

include: "/views/domain_43/view_01543.view.lkml"
include: "/views/domain_45/view_01545.view.lkml"
include: "/views/domain_46/view_01546.view.lkml"
include: "/views/domain_47/view_01547.view.lkml"

explore: explore_0514 {
  label: "Explore Explore 0514"
  description: "Comprehensive analytics explore joining base view_01543 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01543
  
  always_filter: {
    filters: [view_01543.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01543.created_at_date: "7 days"]
    unless: [view_01543.id, view_01543.status]
  }

  join: view_01545 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01543.user_id} = ${view_01545.id} ;;
    required_joins: []
  }

  join: view_01546 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01543.account_id} = ${view_01546.account_id} ;;
    required_joins: [view_01545]
  }

  join: view_01547 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01543.category} = ${view_01547.category} ;;
  }

  access_filter: {
    field: view_01543.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01543.is_deleted} = false ;;
}
